### **Production Deployment Oversight for Modernizing your Data Estate with Azure SQL**

#### (Duration - 40 Hours) *Duration is an approximate, can be adjusted

[Learning Path and Accreditation](https://aka.ms/DAISP1CS2PDOLP)

#### **A. Objective**

Assess the Azure SQL MI workload to prepare for successful production deployment. Examine the technical and operational decision points for the deployment. Review and provide actionable recommendations to help reduce the downtime and risks to the solution in production. Ensure that the solution architecture deployment to Production takes place according to the validated and agreed-upon the Architecture Design activity.

#### **B. Pre-requisites**

[!INCLUDE [Pre-Delivery Checklist](~/VBD-FY24/CommonContent/PredeliveryChecklist.md)]


[!INCLUDE [Customer Scoping](~/VBD-FY24/CommonContent/ScopingGeneral.md)]


  Make sure that scoping call is conducted with the customer to understand the customer scenario and to verify if this MCEM activity aligns with the customer's situation.
  - To ensure a successful migration to Azure SQL, a scoping call with customer stakeholders and a Customer Success Account Manager (CSAM) should be scheduled to define the engagement scope. During the call, the following should be discussed:
  - Which Azure SQL offering is right for the customer's needs, such as:
  - SQL Server on Azure Virtual Machines, which allows for easy lift-and-shift of SQL workloads while maintaining 100% SQL Server compatibility and operating system-level access
  - SQL Server on Azure VMs and SQL Managed Instance, which are also now Azure Arc enabled for a hybrid approach
  - Whether the workload is ready to go into production according to Well-Architected pillars, including asking for:
  - Assessment results
  - Production deployment documents (Migration Methods) and details steps for analysis, such as online or offline
  - PoC results (if applicable)
  - Details of rollback plan
  - Migration tools that have been identified for the deployment, such as Azure Migrate, Azure SQL Migration Extension, Azure CLI, and PowerShell
  - Checkpoint or test cases to validate the migration details.
  - The scoping call should also clarify what is in scope and what is out of scope
  - It should be noted that during oversight activities, the CSAM will not have "hands-on" access to the keyboard.

    | **In Scope**  |
    |---------      |
    | Azure SQL MI migration deployment steps|

    | **Out of Scope**  |
    |---------          |
    | Application migration deployment steps|
  
    | **Success Criteria for Go-Live Engagement** 🏅 |
    |---------                                        |
    | Production deployment of the solution architecture is overseen Customer is guided and supported thought the Production deployment|

#### **C. Target Audience**

The target audience for this MCEM stage are:

|Customer Role                              |Required or Optional |
|---------                                  | :---------:         |
|Project sponsor and project manager        |    Required         |
|Application Architects |    Required         |
|Networking Specialist (on-premises and Azure)                      |    Required         |
|Security lead                       |    Optional         |

#### **D. Execution**

Schedule working sessions with the customer's technical point of contact.

- Delivery guidance for migration to Azure SQL or Arc-Enabled Data Services should involve several key steps to ensure successful production deployment:
- Evaluate the migration readiness by:
  - Analyzing the requirements
  - Evaluating the target i.e., VM Size, Azure SQL DB Size, MI Size, SQL Pools, etc.
  - Assessing the workload of the source i.e., CPU, IO, memory usage.
  - Analyzing the recommendations from DMA Analysis and pointing out blockers or warnings
  - Establishing a final migration plan, including chosen methods and tools
  - Ensuring authentication is configured.
  - Establishing a clear list of databases and a plan to assist with additional databases as time allows.
  - Ensuring the workload meets Well-Architected pillars before going into production.
- During the production deployment phase:
  - Ensure account CSAs/CSAM are present in critical stages to provide support in case of any issues.
  - Oversee the deployment steps.
  - Provide technical guidance if blocked items are encountered.

Raise a [UAT ticket](https://microsoft.sharepoint.com/teams/UnifiedActionTracker/SitePages/UAT-Video-Portal.aspx?ga=1) for any [technical Feedback](https://microsoft.sharepoint.com/:p:/t/CS_PMO/Ef4V5V7fSp9Lgr3u01UrMaABEilQwO37ykZ9O00IckhuoA?e=izbk88) or product blockers with long running CRIs in production.

#### **E. Closeout 🏁**

- Have a close out session with customer stakeholders, and review with the customer the success of the activities.

What is Next?

- Recommend VBD: Go-Live Assessment for Migration to Azure SQL or Arc-Enabled Data Services.
- Recommend VBD: Solution Optimization for Migration to Azure SQL or Arc-Enabled Data Services.

#### **F. Additional References 📖**

- [Azure SQL MI - Migration guides](https://learn.microsoft.com/en-us/azure/azure-sql/migration-guides/managed-instance/sql-server-to-managed-instance-overview?view=azuresql)
- [Azure SQL Modernization and migration support](https://microsoft.sharepoint.com/teams/DataAIPremierOfferings/Production/Forms/AllItems.aspx?csf=1&web=1&e=8PopGg&cid=7995fc44%2D67b3%2D471b%2D8ce3%2D3dcafb5ca7dd&RootFolder=%2Fteams%2FDataAIPremierOfferings%2FProduction%2FMaintain%2FPOP%2FData%5FPlatform%5FModernization%5FMigration%5FSupport%5Ffor%5FSQL&FolderCTID=0x0120005DEE6E735948C742B444255C4F0E4125)
- [SQL + Apps Migration Factory Program](https://microsoft.sharepoint.com/:p:/t/CSUDataAI/EfsXO89mgupKnt-xWmpd3MMB4hX0SBj2RTMqSHyDlFnHuw?e=GHSXCG)
  - [To nominate a customer for the program please use the following](https://forms.microsoft.com/Pages/ResponsePage.aspx?id=v4j5cvGGr0GRqy180BHbRxm4WhL9M3lNojmWESFteXFUOFBUU0VZVUZUNTc2T1hWUEsxT0dUQThIWi4u)
- [Ninja Documents](https://microsoft.sharepoint.com/teams/DSNinja/SitePages/Database-Platform-Ninja-Engineering-Assets.aspx)

#### Appendix

Review the documents and assets below to help you.