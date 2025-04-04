<#
 .SYNOPSIS
    Scan a Markdown (*.md) document to identify Links in format [Link Descriptor](URL), and validate that the link is valid

 .DESCRIPTION

    For each link found with a defined web address, the script will validate the address.
    For each link found with an aka.ms reference, the script will resolve the redirected address.
    If an aka.ms reference has been resolved, the resolved address will be validated. 

===============================================================================================================

 Created: 03/31/2025
 Author: Simon Facer
 Company: Microsoft
 Email: sfacer@microsoft.com

===============================================================================================================
 Change Log
03/31/2025	sfacer 
 Version 1.00
 Original Version

===============================================================================================================
#>

param (
    [string]$FileToScan
)


$debug = $false
$PS_Version = "1.00"
$PS_UpdateDt = "March 31, 2025"



## Identify the Publish Root, this is the folder hosting docfx.json
function Get-PublishRoot ([string]$ScanFolder) 
  { 
    $ScanFolderSplit = $ScanFolder.split("\")
    
    $idx = $ScanFolderSplit.count -1

    while ($idx -gt 0)
      {
        $idx2 = 0
        $PublishRoot = ""
        While ($idx2 -le $idx)  
          {
            $PublishRoot += $ScanFolderSplit[$idx2] + "\"
            $idx2 += 1
          }

        $DocFXJSON = $PublishRoot + "Docfx.JSON"
write-Host "PS: Checking for Docfx.JSON in $PublishRoot" -ForegroundColor Yellow       
        if (Test-Path -Path $DocFXJSON)
          {
            return $PublishRoot
          } 

        $idx -= 1
      }

    return $ScanFolder
  }


## Resolve the aka.ms link to the target URL
function Resolve-akamsLink ([string]$URLToValidate) 
  { 

    try
      {
        $HTTP_Request = [System.Net.WebRequest]::Create($URLToValidate) 
      }
    catch
      {        
        $rc = "URL is invalid (aka.ms)."
        return $rc
      }

    $HTTP_Request = [System.Net.WebRequest]::Create($URLToValidate) 
    $HTTP_Request.Method = "GET"

    $Err = $false
    try
      {
        $HTTP_Response = $HTTP_Request.GetResponse()
      }
    catch
      {
        $Err = $true
      }

    if ($err -eq $true)
      {
        $rc = "Link did not resolve."
      }
    else
      {
        $Response = $HTTP_Response.ResponseUri 
      }

    if ($Response -eq $null -or $Response.absoluteuri -eq $null)
      {
        $rc = $HTTP_Request.Address.AbsoluteUri
        return $rc
      }

    if ($Response.absoluteuri.indexOf(".vssps.visualstudio.com") -ge 0)
      {
        $absoluteuri = $Response.absoluteuri
        $start = $absoluteuri.indexOf("reply_to=") + 9
        $absoluteuri = (((($absoluteuri.Substring($start).replace("%3A", ":")).replace("%2F", "/")).replace("%25", "%")).replace("%20", " "))

        $end = $absoluteuri.indexOf("%3F") 
        if ($end -ge 0)
          {
            $rc = $absoluteuri.Substring(0,$end)
          }
        else
          {
            $end = $absoluteuri.indexOf("&redirect") 
            if ($end -ge 0)
              {
                $rc = $absoluteuri.Substring(0,$end)
              }
            else
              {
                $rc = $absoluteuri
              }
          }
      }
    elseif ($Response.absoluteuri.indexOf("https://forms.office.com") -ge 0 -or $Response.absoluteuri.indexOf("https://forms.microsoft.com") -ge 0)
      {
        $rc = $Response.absoluteuri
      }
    elseif ($Response.absoluteuri.indexOf(".powerapps.com/") -ge 0)
      {
        $rc = $Response.absoluteuri
      }
    elseif ($Response.absoluteuri.indexOf("?ref=aka&shorturl=") -ge 0)
      {
        $rc = "Link did not resolve."
      }
    else
      {
        $rc = $Response.absoluteuri 
      }

    If ($HTTP_Response -ne $null) 
      { 
        $HTTP_Response.Close() 
      }
      
    return $rc
  }


## Validate the URL, either the link in the md document, or the resolved target url for an aka.ms link
function Validate-URL ([string]$URLToValidate) 
  { 

    try
      {
        $HTTP_Request = [System.Net.WebRequest]::Create($URLToValidate) 
      }
    catch
      {        
        $rc = "URL is invalid."
        return $rc
      }

    $Err = $false

    try
      {
        $HTTP_Response = $HTTP_Request.GetResponse()
      }
    catch
      {
        return "Link did not respond."
      }

    $HTTP_Status = [int]$HTTP_Response.StatusCode

    If ($HTTP_Status -eq 200 -or $HTTP_Status -eq 203)
      {
        $rc = "OK"
      }
    Else 
      {     
        $rc = "Link did not respond."
      }

    If ($HTTP_Response -ne $null) 
      { 
        $HTTP_Response.Close() 
      }

    return $rc
  }


## Validate if an in-repo reference is valid
function Validate-InRepoReference ([string]$URLToValidate, [string]$CurrFolder, [string]$PublishRootFolder) 
  {

    $URLToValidate = ($URLToValidate.split("#"))[0]

    ## Resolve ./ at the start of the link as "this folder"
    if ($URLToValidate.IndexOf("./") -eq 0)
      {
        $len = $URLToValidate.Length - 2
        $URLToValidate = $URLToValidate.Substring(2, $len)
      }

    $URLSplit = $URLToValidate.Split("/")
    $Split_FileName = $URLSplit[$URLSplit.count - 1]

    $idx = 0

    $InRepoFileToCheck = ""
    $CurrFolderSplit = $CurrFolder.split("\")

    ## NOTE - building the file name for a local path check - requires "\" vs "/", where "/" is the separator used in the link URL

    ## Resolve "~/" as "from the publish root"
    if ($URLToValidate.IndexOf("~/") -eq 0 -and $PublishRootFolder -ne "")
      {
        $InRepoFileToCheck = $PublishRootFolder + ($URLToValidate.Substring(2, ($URLToValidate.Length - 2))).Replace("/", "\")
      }
    elseif ($URLToValidate.IndexOf("/") -eq 0 -and $PublishRootFolder -ne "")
      {
        $InRepoFileToCheck = $PublishRootFolder + ($URLToValidate.Substring(1, ($URLToValidate.Length - 1))).Replace("/", "\")
      }
    else
      {
        while ($idx -lt ($URLSplit.count - 1))
          {
    ## Resolve ".." as "up one folder level"
            if ($URLSplit[$idx] -eq "..")
              {
                $len = $CurrFolder.Length - (($CurrFolderSplit[$CurrFolderSplit.count - 1]).Length + 1)
                $CurrFolder = $CurrFolder.Substring(0, $len)
                $CurrFolderSplit = $CurrFolder.Split("\")
              }
            $idx+=1
          }

        $URLToValidate = $URLToValidate.Replace("../", "")

      }
    if ($CurrFolder.Substring(($CurrFolder.Length - 1), 1) -ne "\") 
      {
        $CurrFolder += "\"
      }

    if ($InRepoFileToCheck -eq "")
      {
        $InRepoFileToCheck = $CurrFolder + $URLToValidate
      }

    ## Check if the file exists in the local repo clone
    if ((Test-Path $InRepoFileToCheck -PathType Leaf) -eq $false )
      {
        $InRepoReference = "In-repo reference/File Not Found"
      }
    else
      {
        $InRepoReference = "In-repo reference/OK"
      }

      return $InRepoReference
  }


## Identify the link type
function Get-LinkType ([string]$URLToValidate, [string]$CurrFolder, [string]$PublishRootFolder) 
  {

    $fnLinkType = ""
    $fnCheckURL = "0"
    $fnGitHubProject = ""

    If ($URLToValidate.indexOf("[") -eq 0 -or $URLToValidate.indexOf("(") -eq 0 -or $URLToValidate.indexOf(" ") -eq 0 )
      {
        $fnLinkType = "Invalid formatted link"
        $fnCheckURL = "0"
      }
    ElseIf ($URLToValidate.indexOf("https://github.com") -eq 0 )
      {
        $fnLinkType = "GitHub"
        $fnCheckURL = "1"
        $fnGitHubProject = (($URLToValidate.Replace("https://github.com/", "").Replace("https://www.github.com/", "")).split("/"))[0]
      }
    ElseIf ($URLToValidate.indexOf("https://esxp.microsoft.com/#/omexplanding") -eq 0)
      {
        $fnLinkType = "OMXP"
        $fnCheckURL = "1"
      }
    ElseIf ($URLToValidate.indexOf("https://esxp.microsoft.com") -eq 0)
      {
        $fnLinkType = "ESXP"
        $fnCheckURL = "1"
      }    
    ElseIf ($URLToValidate.indexOf(".sharepoint.com/") -ge 0)
      {
        $fnLinkType = "SharePoint"
        $fnCheckURL = "0"
      }    
    ElseIf ($URLToValidate.indexOf("https://microsoft.seismic.com/") -eq 0)
      {
        $fnLinkType = "Seismic"
        $fnCheckURL = "1"
      }
    ElseIf ($URLToValidate.indexOf("https://dev.azure.com") -eq 0 -or $LinkURL.indexOf("https://sirona.visualstudio.com") -eq 0)
      {
        $fnLinkType = "AzDO"
        $fnCheckURL = "1"
      }
    ElseIf ($URLToValidate.indexOf("https://gearup.microsoft.com") -eq 0)
      {
        $fnLinkType = "GearUp"
        $fnCheckURL = "0"
      }                
    ElseIf ($URLToValidate.indexOf("https://teams.microsoft.com") -eq 0)
      {
        $fnLinkType = "Teams"
        $fnCheckURL = "1"
      }    
    ElseIf ($URLToValidate.indexOf("https://blog.fabric.microsoft.com") -eq 0)
      {
        $fnLinkType = "Blog"
        $fnCheckURL = "1"
      }              
    ElseIf ($URLToValidate.indexOf("https://learningpath.microsoft.com") -eq 0 -or $URLToValidate.indexOf("https://learn.microsoft.com") -eq 0 )
      {
        $fnLinkType = "Skilling"
        $fnCheckURL = "1"
      }              
    ElseIf ($URLToValidate.indexOf("aka.ms") -ge 0)
      {
        $fnLinkType = "aka.ms"
        $fnCheckURL = "0"
      }                   
    ElseIf ($URLToValidate.indexOf("https://") -eq 0)
      {
        $fnLinkType = "Other"
        $fnCheckURL = "1"
      }                  
    ElseIf ($URLToValidate.indexOf("http://") -eq 0)
      {
        $fnLinkType = "Other"
        $fnCheckURL = "1"
      }
    ElseIf ($URLToValidate.indexOf("#") -eq 0)
      {
        $fnLinkType = "Internal"
        $fnCheckURL = "0"
      }
    ElseIf ($URLToValidate.indexOf("~~") -eq 0)
      {
        $fnLinkType = "Replacement token"
        $fnCheckURL = "0"
      }                
    ElseIf ($URLToValidate.indexOf(".") -eq 0 -or $URLToValidate.indexOf("/") -eq 0 -or $URLToValidate.indexOf("~/") -eq 0 -or $URLToValidate.indexOf("media/") -eq 0 -or $URLToValidate.indexOf("_images/") -eq 0)
      {
        $fnLinkType = Validate-InRepoReference $URLToValidate $CurrFolder $PublishRootFolder
        $fnCheckURL = "0"
      }
    ElseIf ($URLToValidate.indexOf("mailto") -eq 0)
      {
        $fnLinkType = "Email address"
        $fnCheckURL = "0"
       }                
    ElseIf ($URLToValidate.length -eq 0)
      {
        $fnLinkType = "MISSING"
        $fnCheckURL = "0"
      }
    Else
      {
        if ($CurrFolder -eq "")
          {
            $fnLinkType = "** Not Recognized **"
            $fnCheckURL = "0"
          }
        else  
          {
            $URLSplit = $URLToValidate.Split("/")
            $Split_FileName = $URLSplit[$URLSplit.count - 1]
            if ($Split_FileName.indexOf(".md") -lt 0 -and $Split_FileName.indexOf(".jpg") -lt 0 -and $Split_FileName.indexOf(".png") -lt 0)
              {
                $fnLinkType = "** Not Recognized **"
                $fnCheckURL = "0"
              }
            else
              {
                $fnLinkType = Validate-InRepoReference $URLToValidate $CurrFolder $PublishRootFolder
                $fnCheckURL = "0"
              }
          }           

      }

    $return = "$fnLinkType|$fnCheckURL|$fnGitHubProject"
    return $return
  }


## Main

    $FileToScan = $FileToScan.Trim()
    Write-Host "PS: Processing $FileToScan" 

    $FileToScan_Parts=$FileToScan.Split(".")
    $FileToScan_FileType = $FileToScan_Parts[$FileToScan_Parts.count - 1]
    if ($FileToScan_FileType -ne "md")
      {
        Write-Host "PS: File is not Markdown ($FileToScan_FileType) - Skipping"
        exit 0
      }

    ## Find the publish root (/doc/), based on finding docfx.json in the folder
    $PublishRootFolder = Get-PublishRoot $FileToScan
Write-Host "PS: PublishRootFolder = $PublishRootFolder"

    $File = get-item -Path $FileToScan 

    $FileFullName = $file.FullName
Write-Host "PS: FileFullName = $FileFullName"

    $LineNum = 1

    $FileFolder = $file.DirectoryName

    ## process the file, line by line
    Get-Content $FileFullName | foreach {

        $ReplChar = [char]255
        $content = $_.Replace("]`(", $ReplChar)
        $LineNum ++

        $split = ($content.split($ReplChar)) | ?{$_ -ne ""}
        if ($split.count -gt 1) 
          {         
            $idx = 0
            while (($idx + 1) -lt $split.count) {
                $idx2 = ($split[$idx].split("[").count - 1)
                $LinkName = $split[$idx].split("[")[$idx2]
                $idx++
                $LinkURL = $split[$idx].split(")")[0]

                $New_tblLinks_Row = $Null

                $New_tblLinks_Row = $tblLinks.NewRow()

                $CheckURL = $false
                $GitHubProject = ""

                $LinkURLSplit = $linkURL.split("`"")
                $LinkURL = ($LinkURLSplit[0]).trim()

                write-Host "." -ForegroundColor White -NoNewLine

                $fnCheckURL = ""
                $fnGitHubProject = ""
                $SkipURLReason = ""
    
                $fnLinkType = Get-LinkType $LinkURL $FileFolder $PublishRootFolder
                $Linktype = ($fnLinkType.split("|"))[0]
                if (($fnLinkType.split("|"))[1] -eq "1")
                  {
                    $CheckURL = $true
                  }
                else
                  {
                    $CheckURL = $false
                  }

                $GitHubProject = ($fnLinkType.split("|"))[2]

                $akamsResolvedURL = ""

                $UrlIsValid = ""
  
                if ($Linktype -eq "aka.ms")
                  {
                    $akamsResolvedURL = $null
                    $akamsResolvedURL = Resolve-akamsLink $LinkURL


                    $SkipValidation = $false
                    if ($akamsResolvedURL -eq "Link did not resolve.")
                      {
                        $SkipValidation = $true
                      }

                    if ($akamsResolvedURL.indexOf("https://forms.office.com") -ge 0 -or $akamsResolvedURL.indexOf("https://forms.microsoft.com") -ge 0)
                      {
                        $SkipValidation = $true
                        $akams_Linktype = "Forms"
                      }
                    elseif ($akamsResolvedURL.indexOf("https://apps.preview.powerapps.com") -ge 0)
                      {
                        $SkipValidation = $true
                        $akams_Linktype = "PowerApp"
                      }
                    elseif ($akamsResolvedURL -ne $null -and $SkipValidation -eq $false)
                      {
                        $fnLinkType = Get-LinkType $akamsResolvedURL $FileFolder $PublishRootFolder
                        $akams_Linktype = ($fnLinkType.split("|"))[0]
                        if (($fnLinkType.split("|"))[1] -eq "1")
                          {
                            $akams_CheckURL = $true
                          }
                        else
                          {
                            $akams_CheckURL = $false
                          }
                        if (($fnLinkType.split("|"))[2] -ne "")
                          {
                            $akams_GitHubProject = ($fnLinkType.split("|"))[2]
                          }
                      }
                    else
                      {
                        $akams_Linktype = ""
                        $akams_CheckURL = $false
                        $akams_GitHubProject = ""
                      }                        
                    if ($akams_CheckURL -eq $true)
                      {
                        $UrlIsValid = Validate-URL $akamsResolvedURL
                        $UrlIsValid = "Redirected URL: " + $UrlIsValid
                      }

                    $Linktype = "$Linktype | $akams_Linktype"
                    If ($akams_Linktype -eq "GitHub")
                      {
                        $GitHubProject = $akams_GitHubProject
                      }
                    }

                elseif ($CheckURL -eq $true)
                  {                      
                    $akamsResolvedURL = ""
                    $UrlIsValid = Validate-URL $LinkURL
                  }               

                else
                  {
                    $akamsResolvedURL = ""
                    $UrlIsValid = ""
                  }

                if ($Linktype.IndexOf("GearUp") -ge 0)
                  {
                    $UrlIsValid = "** GearUp is Retired, links not checked"
                  }
                if ($Linktype.IndexOf("SharePoint") -ge 0)
                  {
                    $UrlIsValid = "** SharePoint links may return false-negatives, links not checked"
                  }                
                if ($Linktype.IndexOf("PowerApp") -ge 0)
                  {
                    $UrlIsValid = "** PowerApp links not checked"
                  }
                if ($Linktype.IndexOf("Forms") -ge 0)
                  {
                    $UrlIsValid = "** Forms links not checked"
                  }
                if ($Linktype.IndexOf("In-repo reference") -eq 0)
                  {
                    $UrlIsValid = ($Linktype.split("/"))[1]
                    $Linktype = ($Linktype.split("/"))[0]
                  }
                if ($Linktype -ne "Replacement token" -and $LinkURL.indexof("./de-dai-?1?") -lt 0 -and $LinkURL -ne "https://aka.ms/de/dai-?2?-AssetList")
                  {                        
                    if ($LinkURL -match "URL is invalid")
                      {
                        $UrlIsValid = $LinkURL
                        $LinkURL = ""
                      }                                                  
                    if ($akamsResolvedURL -match "URL is invalid")
                      {
                        $UrlIsValid = $akamsResolvedURL
                        $akamsResolvedURL = ""
                      }                                               
                    if ($Linktype -match "MISSING" -or $Linktype -match "Not Recognized")
                      {
                        $UrlIsValid = $Linktype
                        $Linktype = ""
                      }
                    if ($Linktype -eq "aka.ms | aka.ms")
                      {
                        $Linktype = "aka.ms | "
                      }
                    if ($UrlIsValid -match "OK")
                      {
                        Exit 0
                      }
                    else
                      {
                        if ($Linktype -match "aka.ms")
                          {
                            $ErrorMsg = $FileFullName.Replace($PublishRootFolder,"") + " | Line Num:" + ($LineNum - 1) + " | Link Name:" + $LinkName + " | Link URL:" + $LinkURL
                            $ErrorMsg = $ErrorMsg + " | aka.ms link: " + $akamsResolvedURL  + " | Link Type:" + $Linktype  + " | GitHub Project:" + $GitHubProject  + " | URL is Valid:" + $UrlIsValid                            
                          }
                        else
                          {
                            $ErrorMsg = $FileFullName.Replace($PublishRootFolder,"") + " | Line Num:" + ($LineNum - 1) + " | Link Name:" + $LinkName + " | Link URL:" + $LinkURL
                            $ErrorMsg = $ErrorMsg + " | aka.ms link: | Link Type:" + $Linktype  + " | GitHub Project:" + $GitHubProject  + " | URL is Valid:" + $UrlIsValid                            
                          }
                        
                        Write-Host "Found TODO in $FilePath"
                        exit 1
                      }
                    $tblLinks.Rows.Add($New_tblLinks_Row)
                  }
                else
                  {
                    Write-Host "`r`nSkipping: $FileFullName | $LineNum | $LinkName | $LinkURL"  -ForegroundColor Red
                  }
              }
          }        
      }   
## End Main
