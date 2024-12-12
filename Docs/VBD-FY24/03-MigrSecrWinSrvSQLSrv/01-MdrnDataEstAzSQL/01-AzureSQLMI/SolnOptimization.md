### **Solution Optimization for Modernizing your Data Estate with Azure SQL**

#### (Duration - 40 Hours) *Duration is an approximate, can be adjusted

[Learning Path and Accreditation](https://aka.ms/DAISP1CS2SOLP)

#### **A. Objective**

This guide will provide guidance and instructions to help you deliver the Solution Optimization for Migration to Azure SQL or Arc-Enabled Data Services Session with your customer. The Solution Optimization Migration to Azure SQL or Arc-Enabled Data Services Session aims to gain a clear understanding of the overall health of the environment after completing the migration, allowing you to evaluate the environment from a security and performance perspective

The goal of this phase is to help optimize the customer Azure SQL Managed Instance environment. During this engagement we will focus on the objectives below:

- Understand customer needs and desired outcomes.
- Ensure adequate database performance.
- Enhance scalability and performance.
- Enhance database security.
- Business continuity and disaster recovery

> **Note**
>
> These are just some scenarios and there could many used cases that are not mentioned here.

#### **B. Pre-requisites**

[!INCLUDE [Pre-Delivery Checklist](~/VBD-FY24/CommonContent/PredeliveryChecklist.md)]


  > **Warning**
  >
  > PTO deliveries are complex and require that the person delivering has a clear and deep understanding of concepts related to PTO.


[!INCLUDE [Customer Scoping](~/VBD-FY24/CommonContent/ScopingGeneral.md)]

  > **Note**
  >
  > It’s important to start setting expectations together with the customer for the delivery. Normally you will aim to get an overall understanding of the environment and help the customer set a baseline architecture for migrating their database(s) to Azure SQL Managed Instance. Within 40 hours you will not be able to analyze a full estate.

  Make sure that scoping call is conducted with the customer to understand the customer scenario and to verify if this MCEM activity aligns with the customer's situation. During the scoping call please confirm the following:

  <!-- ![Solution Optimization Scoping Call AzureSQL] (../media/SolutionOptimization-ScopingCall-AzureSQL.png) -->

  - How long the performance issue(s) has been happening
  - Is the performance issue related to one query or there are multiple queries exhibiting performance issue(s)
  - Does the customer have any benchmark numbers
  - What has changed in the environment
  - What troubleshooting steps have been performed
  - Is the issue reproducible
  - What is the business impact
  - What are the security issues to be addressed?
  - Was there any data breach?  
  - Verify access to the customer environment
    - **Option I** – This is the best option and should be the default option. You are given access to the customer Azure SQL environment; this can be done through remote share or by giving you direct access to the Azure SQL environment.
    - **Option II** – You can work with the customer and have them execute the queries for you and they send you the results. As you can imagine this can create an overhead for customers and might not be the most optimal option.
  - Set expectations regarding the oversight activity and the CSA will not have "hands-on" with the keyboard
  - Review the availability of the customer's current and planned architectural documentation and resources
  - Review the customer's technical blockers
  - Establish times/dates for a 40 hours session to review customers' environment after completing the migration to Azure SQL against known best practices and determine an optimization and security strategy

  At the end of the scoping call, set clear expectations on what is in scope and what is out of scope with the customer.

  | **In Scope**  |
  |---------      |
  |Azure SQL MI environment only     |
  |Tuning a small number of queries  |
  |Fixing security issues |

  | **Out of Scope**   |
  |---------           |
  |Architecture review |
  |Tuning multiple Azure SQL Managed Instance environments|
  |Coding |

  | **Success Criteria** 🏅 |
  |---------         |
  |Assess customer performance issues and provide guidance and remediation that would help remediate the performance issues |
  |Assess customer security issues and provide guidance and remediation that would help remediate the security issues |

#### **C. Target Audience**

The target audience for this MCEM stage is:

|Customer Role                              |Required or Optional |
|---------                                  | :---------:         |
|Data Architect/DBA                         |    Required         |
|Database Engineer                          |    Optional         |
|Developers                                 |    Optional         |
|Solution Owner / Solution Architect        |    Optional         |
|Cloud Architect                            |    Optional         |
|Security architect                         |    Optional         |

#### **D. Execution**

The guidance will provide you with more details to drive the different steps of the solution optimization session. After the scoping call meeting, you will want to create a delivery plan based on the discussion with the customer. You can mix and match content to help build the right delivery plan for this engagement.
Feel free to add/remove hours when more analysis and discussion are needed.

Below are various **deliveries, documents, and other assets** that you can leverage.  Please note you are not limited to or bound by the below deliveries.  You have the freedom to use the below deliveries, come up with your own custom deliveries, mix and match, etc. to reach a solution that is favorable to the customer.

| Delivery Type | Delivery Name | Customer Level | Target Audience | Delivery Method|Use Case | Outcome
| --- | --- | --- | --- | --- | ---| ---|
| Assessment - It is retired from the catalog however the content can be delivered in a VBD as a chapter or module. | [Azure SQL Health and Risk Assessment](https://microsoft.sharepoint.com/:f:/r/teams/DataAIPremierOfferings/Production/Maintain/Assessment_Program/Azure_SQL_Health_and_Risk_Assessment?csf=1&web=1&e=BjFe6y) | Intermediate | DBA, Data Management Team, Developers | Hands-on | Gain insight into your Azure SQL environment by proactively diagnosing issues and risks| Optimization of customer environment |
| Workshop - It is retired from the catalog however the content can be delivered in a VBD as a chapter or module.| [Azure SQL Security and Governance](https://microsoft.sharepoint.com/:f:/r/teams/DataAIPremierOfferings/Production/Maintain/POP/Azure_SQL_Security_and_Governance_Clinic?csf=1&web=1&e=TD3Tyq) | Intermediate| DBA, Data Management team, Developers and Security team | Hands-on | Implementation of security features and a detailed review of your system in order to optimize the security and governance  | Address customers security issues|
| Workshop | [Azure SQL Performance Tuning and Optimization](https://microsoft.sharepoint.com/:f:/r/teams/DataAIPremierOfferings/Production/Maintain/POP/SQL_Server_Performance_Tuning_and_Optimization_Clinic?csf=1&web=1&e=R91jiE) | Intermediate| DBA, Developers | Hands-on| Optimize the performance of the Azure SQL Database and Azure SQL Managed Instance (MI) environment  | Address customer performance issues|

- **Step 1 - Running an assessment**

  Start by having the customer complete an initial scan of the target environment by running the Azure Health and Risk assessment.
  - Check out the [Azure SQL Health and Risk Assessment Delivery Guide](https://microsoft.sharepoint.com/:w:/r/teams/DataAIPremierOfferings/Production/Maintain/Assessment_Program/Azure_SQL_Health_and_Risk_Assessment/DeliveryGuide/Delivery%20Guide%20-%20Azure%20SQL%20MI%20Assessment.docx?d=wa7751769a0ca4902bd91e6a1b665127b&csf=1&web=1&e=prnrr7) for Azure SQL Managed Instance.
  - [SQL Assessment](https://github.com/microsoft/azuredatastudio/tree/main/extensions/sql-assessment#sql-assessment-preview) can be run either through Powershell or Azure Data Studio extension.
    - Check the "Appendix" within the [Azure SQL Health and Risk Assessment Delivery Guide](https://microsoft.sharepoint.com/:w:/r/teams/DataAIPremierOfferings/Production/Maintain/Assessment_Program/Azure_SQL_Health_and_Risk_Assessment/DeliveryGuide/Delivery%20Guide%20-%20Azure%20SQL%20MI%20Assessment.docx?d=wa7751769a0ca4902bd91e6a1b665127b&csf=1&web=1&e=prnrr7) for step-by-step guidance on configuring the Assessment API within Azure Data Studio, and/or completing the assessment via PowerShell.

    > **Note**
    >
    > This could also be a good opportunity to explain the benefits of Azure Data Studio.

  - Run the [SQL BP Check](https://github.com/microsoft/tigertoolbox/blob/master/BPCheck/Check_BP_Servers.sql) script against the SQL Managed Instance.
    - This is a script available in the [TigerToolbox GitHub repository](https://github.com/microsoft/tigertoolbox/tree/master#tigertoolbox)
    - Example of how to run it

      ```sql
      EXEC usp_bpcheck @allow_xpcmdshell = 0, @ptochecks = 1, @duration = 60
      ```

      >❗**Important**
      >
      > Have the customer send the query output to text, as this will make it easier for you to review on your end during the deliver

  - Perform a vulnerability scan against the target environment. If the customer is not familiar with the SQL Vulnerability Assessment, you can use this as an opportunity for upskilling.
    - [What is the SQL Vulnerability Assessment](https://learn.microsoft.com/en-us/azure/defender-for-cloud/sql-azure-vulnerability-assessment-overview?view=azuresql)
    - Review prerequisites and steps to [enable the SQL Vulnerability scan](https://learn.microsoft.com/en-us/azure/defender-for-cloud/sql-azure-vulnerability-assessment-enable?tabs=express).
    - Complete a scan for vulnerabilities and walk through the results with the customer.
  
- **Step 2 - Optimizing Security**

  If the customer wants to look at how to optimize security, check out a list of possible scenarios that can be considered for this engagement:

    | Scenario | Description | Effort |
    |:---      |:---         |:---:   |
    | Enable TDE Encryption | Transparent Data Encryption encrypts the data at rest (on the disk). In addition, all backups are encrypted as well. | 4 hours|
    | Enable SQL Server Auditing | Auditing and storing audit information securely is very important for security. It is not always possible to prevent certain activities. But, it is important to audit activity on sensitive data. | 4 hours|
    | Enable TDE Encryption | Transparent Data Encryption encrypts the data at rest (on the disk). In addition, all backups are encrypted as well. | 4 hours |
    |Enable Row Level Security (RLS) | | 4 hours |
    |Enable Dynamic Data Masking     | | 4 hours |
    |Enable Static Data Masking      | | 4 hours |

  - Check out the [Azure SQL Security and Governance Scenarios Guide](https://microsoft.sharepoint.com/:w:/r/teams/DataAIPremierOfferings/Production/Maintain/POP/Azure_SQL_Security_and_Governance_Clinic/DeliveryGuide/Scenarios.docx?d=w5bc4d636d26f4c8bac3509efa6d7f627&csf=1&web=1&e=EPmRis) for walking through the scenarios.

- **Step 3 – Optimizing Performance**

  If the customer is interested in optimizing the performance of their target Azure SQL Managed Instance, you may want to start by reviewing the output collected during the initial capture from the Azure Health and Risk Assessment. This can help to understand their current issues/bottlenecks.
  - Review the delivery guide for the [SQL Server Performance Tuning and Optimization](https://microsoft.sharepoint.com/:f:/r/teams/DataAIPremierOfferings/Production/Maintain/POP/SQL_Server_Performance_Tuning_and_Optimization_Clinic?csf=1&web=1&e=R91jiE).
  - For Azure SQL Managed Instance, you will need to run the AzureDiag PowerShell module to collect and store diagnostic and performance information from Azure SQL Managed Instance
    - See prerequisites and execution guidance within the [delivery guide for the PTO clinic](https://microsoft.sharepoint.com/:w:/r/teams/DataAIPremierOfferings/Production/Maintain/POP/SQL_Server_Performance_Tuning_and_Optimization_Clinic/DeliveryGuide/Delivery%20Guide_v1%20-%20PTO%20Clinic.docx?d=w6c346510ca7e424f924468a3dfc57ec7&csf=1&web=1&e=XzTSF2).
    - See the section for AzureDiag under the topic of Data Collection within the delivery guide
    - You will use this for both Azure SQL Database and Azure SQL Managed instance.

    >**Note**
    >
    > AzureDiag **is not available as an external download**. Therefore, you will need to pull it down to your local machine.

  Here are the details on how to download AzureDiag using PowerShell

  - [Install the Azure Az PowerShell module](https://learn.microsoft.com/en-us/powershell/azure/install-az-ps?view=azps-9.5.0)

  - Run the following to log in from your client using your default web browser

      ```powershell
        $LoginContext = Connect-AzAccount
      ```

  - Use the following to connect to the storage account where the package is stored and copy it to your local desktop.
  - Run the following command to download AzureDiag to your local machine.

    ```powershell
    $StorageContext = New-AzStorageContext –StorageAccountName SQLAnalyzer
    Get-AzStorageBlobContent –Context $StorageContext –Container “sqlblob” -Blob “AzureDiag-release.zip”
    ```

  - Once you have collected the data from the execution of the AzureDiag module, you will need to have the customer zip up and upload the data securely to you for review.
  - [SQL Analyzer](https://microsoft.sharepoint.com/:f:/r/teams/DataAIPremierOfferings/Production/Maintain/POP/SQL_Server_Performance_Tuning_and_Optimization_Clinic/Tools/SQLAnalyzer?csf=1&web=1&e=prrOWS) is used to analyze the data collected.
    - Check out the [PTO Delivery Guide](https://microsoft.sharepoint.com/:w:/r/teams/DataAIPremierOfferings/Production/Maintain/POP/SQL_Server_Performance_Tuning_and_Optimization_Clinic/DeliveryGuide/Delivery%20Guide_v1%20-%20PTO%20Clinic.docx?d=w6c346510ca7e424f924468a3dfc57ec7&csf=1&web=1&e=bRpfP8) for more information on the requirements and guidance around the SQL Analyzer tool.
    - This will be under the topic *Data Analysis and Reporting*. You will find details on how to configure and run SQL Analyzer on page 16 of the delivery guide for the SQL Performance Tuning and Optimization clinic.
  
  > **Warning**
  >
  > SQL Analyzer tool is an internal tool and cannot be sent to the customer.

  - SQL Analyzer uses [SQL Nexus](https://github.com/microsoft/SqlNexus) and the [RML (Replay Markup Language)](https://github.com/Microsoft/SqlNexus/wiki/RML-Utility) tools to process and load the data in your local SQL Server instance.
  - This tool will send the output to the following folder on the "C" drive - **C:\PSSDiagExporter**.
    - This path can be modified by changing the path for ***\<ExportFolder\>*** in the SQLAnalyzerConfig.xml.
  - If successful, this module will create the following files for review with the customer:
    - PerfmonCounters.docx
    - PerfmonSummary.txt
    - SQLNexus.log
    - SQLNexus.xls
  - There will also be a **Findings** document within this folder. This document can be used to build the closeout report for the customer.
  
>**Note**
>
> You will want to focus your analysis on the SQLNexus.xls file, as this is going to contain most of the troubleshooting data from the collection.

#### **E. Closeout 🏁**

- Summarize the issue(s)
- Summarize the results
- Summarize the steps or actions taken to reach a resolution
- Share any supporting or additional documentation that can benefit the customer
- Create the close-out document and share it with the customer and account team.
- For the SQL Performance Troubleshooting Clinic, you will want to send the findings to the report that was generated by the SQL Analyzer after you have cleaned up and included any additional information
  - This could include any problematic statements, index recommendations, configuration changes, etc
- You may also provide the Excel file generated from the SQL Nexus tool.
- For the Azure SQL Security and Governance delivery, you can use the following [sample report](https://microsoft.sharepoint.com/:f:/r/teams/DataAIPremierOfferings/Production/Maintain/POP/Azure_SQL_Security_and_Governance_Clinic/Deliverables/SampleReport?csf=1&web=1&e=5M3YWG)
- Include the following items:
  - All findings and tasks you have executed
  - Current problems and resolution
  - Feedbacks
  - Transfer presentation/documents to the customer

#### **F. Additional References 📖**

  The below documentation can assist you and customer by providing valuable information and references:

- [Sql Assessment](https://github.com/microsoft/azuredatastudio/tree/main/extensions/sql-assessment)
- [SQL Assessment API](https://learn.microsoft.com/en-us/sql/tools/sql-assessment-api/sql-assessment-api-overview?view=sql-server-ver16)
- [Overview of Microsoft Defender for Azure SQL](https://learn.microsoft.com/en-us/azure/defender-for-cloud/defender-for-sql-introduction)

#### Appendix

