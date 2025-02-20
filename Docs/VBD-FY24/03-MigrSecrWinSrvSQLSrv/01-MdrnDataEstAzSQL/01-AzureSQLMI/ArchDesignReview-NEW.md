## [Inspire & Design]

![MCEM Phase](~/VBD-FY24/media/MCEM-Inspire_Design.png)

### **Architecture Design and Review Session for Modernizing your Data Estate with Azure SQL**

#### (Duration - 24 hours) *Duration is an approximate, can be adjusted*

[Learning Path and Accreditation](https://aka.ms/DAISP1CS2ARSLP)

#### **A. Objective 🎯**

This guide will provide guidance and instructions to help you deliver an Architecture Design Session together with your customer. The Architecture Design Session aims to gain a clear understanding of the migration requirements and results in a draft architecture to migrate towards the Azure SQL Managed Instance.

- Understanding the customer’s business goals and key migration requirements.
- Understanding current architecture principles and design boundaries.
- Discover and understand customer workload and find possible migration paths.
- Deliver a PowerPoint presentation that covers high-level findings and a (draft) migration proposal.

#### **B. Prerequisites**


[!INCLUDE [Pre-Delivery Checklist](~/VBD-FY24/CommonContent/PredeliveryChecklist.md)]


[!INCLUDE [Customer Scoping](~/VBD-FY24/CommonContent/ScopingGeneral.md)]

  > **Note**
  >
  > It’s important to start setting expectations together with the customer for the delivery. Normally you will aim to get an overall understanding of the environment and help the customer set a baseline architecture for migrating their database(s) to Azure SQL Managed Instance. Within 24 hours you will not be able to analyze a full estate and create a full migration plan. Focus on the databases where the customer has a commitment to migrate and deep dive into the scoped set of databases.

  Make sure that scoping call is conducted with the customer to understand the customer scenario and to verify if this MCEM activity aligns with the customer's situation.

  - Organize a scoping call at least 2 weeks before the start of the engagement.
  - Discuss the agenda of the delivery with the customer. High-level the agenda of this 24-hour delivery is discovery and goals, solution architecture design session, create a prototype‐ready architecture design for the customer.
  - Define the customer participants that will be needed for the scoping call. Start with the roles you might have already worked with and pre-discuss this with them. When you’re going blank into the delivery, pre-discuss it with the Microsoft Data Specialist or Account Executive. Example list of roles you can consider inviting during the call: Project Sponsor, project manager, application and database architects, application and database administrator, data governance, storage, and technical leaders responsible for making decisions about project scope.
  - Set the expectations of the delivery:
    - What is the goal of the architecture design session?
    - What will be the timing of the migration project and the architecture migration session?
    - Figure out what data is already available about the current environment. For example: Database sizing, current hardware configuration, baselines created with monitoring tooling and any plans already created.
    - Decide what the outcomes of the session will be. For example:
      - A high-level plan for migrating the scoped environment towards Azure SQL Managed Instance.
      - A design of how a standard Azure SQL Managed Instance deployment will look for the organization.
  - If the customer doesn’t have any insight into the estate they would like to assess, decide what tool you can use to obtain the needed insights. A starting point can be [Azure Migrate](https://learn.microsoft.com/en-us/azure/migrate/migrate-services-overview) for a large estate or [Data Migration extension in Azure Data Studio](https://learn.microsoft.com/en-us/sql/azure-data-studio/extensions/azure-sql-migration-extension?view=sql-server-ver16) for a clear scoped set of databases.
  - If capturing metrics from the current environment is needed, make sure a representative number of timeslots are captured during peak-load hours and other key periods (business hours versus weekends). Decide with the customer how long data will be gathered for the environment. When the customer is only interested in feature compatibility, this can be skipped.
  - Discuss the requirements for any of the tools you will use during delivery. A separate workstation is preferred to connect to the SQL Server estate with tools like Azure Data Studio.
  - Discuss whether you’re allowed to move the data toward your own workstation or if you need to analyze the data within the customer environment.
  - Verify access to the customer environment
    - **Option I** – This is the best option and should be the default option. You are given access to the customer Azure SQL environment; this can be done through remote share or by giving you direct access to the Azure SQL environment.
    - **Option II** – You can work with the customer and have them execute the queries for you and they send you the results. As you can imagine this can create an overhead for the customer and might not be the most optimal option.
  - Set expectations regarding the oversight activity and the CSA will not have "hands-on" with the keyboard.

  At the end of scoping, set clear expectations on what is in scope and what is out of scope with the customer. Use the table below as a guide:

  | **In Scope**       |
  |---                 |
  | Architecture session for Azure SQL Managed Instance |

  | **Out of Scope**            |
  |---                          |
  |End to End Proof of concept  |
  |Performance troubleshooting  |
  |                             |

  | **Success Criteria**🏅  |
  |---                                                |
  |Based on these architecture design sessions, and depending on the validated scope, the customer team should feel empowered to move to the next stage, which can be implementing the architecture proposed, or developing a POC in their environment for the discussed architecture.|

#### **C. Target Audience**

Customer participants that will be needed for a successful delivery:

|Customer Role                              |Required or Optional |
|---------                                  | :---------:         |
|Project sponsor and/or project manager     |    Required         |
|Database and/or Application Architects     |    Required         |
|Networking Specialist                      |    Required         |
|Security architect/lead                    |    Optional         |
|Data Governance team member                |    Optional         |
|Storage/Backup team member                 |    Optional         |

#### **D. Execution**

The guidance will provide you with more details to drive the different steps of the architecture design session. During the 24-hour delivery, you can arrange the agenda as below. Feel free to add/remove hours when more analysis and discussion are needed.

> **Note**
>
> When the customer only wants to focus on discussing a new architecture and migration path: Keep the scope to understand the environment, get a clear view of the requirements, and drive a design/white-boarding session together with the customer.
> Don’t feel obliged to go through the Discovery/Analysis phase when the customer wants to focus on higher-level details. The goal of the Discovery and Analysis phase is to provide room for gathering important details that might not be easily obtained by talking to the customer.

1. ***Discovery*** – Focus on understanding the environment and the current challenges.  
2. ***Analysis*** - Analyzing and organizing all the data obtained and discussing this with the technical team.  
3. ***Designing and Architecture*** – Use the information from your analysis as a starting point to create a draft architecture. Execute this preferably together with the customer in a (Teams) room with a whiteboard. Explain the available options, and determine a potential deployment model and migration path.
4. ***Report*** - During the last day you can continue with building the presentation, discuss open questions, and present the outcomes of your analysis to close the delivery.

**Step 1 - Discovery**
You can use the Data Platform Modernization Assessment delivery guide for SQL as a reference for how to perform an assessment.

1. During the scoping call, the delivery context was scoped to what server(s) and SQL Server instances will be considered for the migration towards Azure SQL Managed Instance.
2. Obtain documentation and understanding of the current environment. Need to understand:
   1. Recovery Point Objectives, Recovery Time Objectives, and Recovery Level Objectives.
   2. Infrastructure and constraints (security, compliance)
   3. Current state of the solution (support, challenges)
   4. Personas, relevant business processes
3. Execute a discovery using the tools discussed during the scoping call. This will be the start of creating an inventory and input for your analysis on feature parity:
   1. Do we see any databases that use features that are not compatible with Azure SQL Managed Instance?
   2. Do we see other components within the assessed SQL Server environment that need to be addressed in a separate delivery? Examples: Integration Services (SSIS), Reporting Services, and Analysis Services.
4. Review together with the customer what databases and applications in the discovery can be tagged for Retirement/Sunset or simply not to be migrated at this point.
5. When there are doubts on migration feasibility towards Azure SQL Managed Instance, review the [Data Workload Classification](https://www.microsoft.com/en-us/download/confirmation.aspx?id=103130) questions to obtain more decision points and review the possibility to target a different Azure SQL platform. Use this as input for your discovery process, not as a customer-facing tool
6. Review together with the customer what connection paths will be used for applications towards the Azure SQL Managed Instance. Will applications also be migrated to Azure? Or are applications staying on-premises?
7. #### Leverage : CSU Migration Factory [Details](https://aka.ms/CSUMigrationFactory )
##### [Migration factory Delivery Guidance](https://eng.ms/docs/microsoft-customer-partner-solutions-mcaps-core/customer-experience-and-support/customer-success/data-ai/resource-center/csu-mf/sql-mf/readme#architecture-design-and-review-session-for-migrating-your-data-estate-to-azure-sql)
The CSU Migration Factory offers a swift and reliable implementation method tailored to facilitate the seamless transfer of data workloads during the Rehost migration, all delivered by Microsoft Customer Success experts at no expense.This is an extended solution for migration, assuring faster execution and top-notch optimization for quality results. 

**Step 2 – Analysis**
Take some time to go through all the details you have gathered. Focus on the details that will influence the new architecture and important decision points for the new architecture.

- Structure the information gathered during the discovery phase.
- Source environment overview and configuration
- Migration compatibility blockers
- Assessment results
- SKU recommendation

**Step 3 – Designing an architecture**
Using the gathered information, we can now work towards a draft architecture and outline key features to be implemented for Azure SQL Managed Instance.

  > **Note**
  >
  > Don’t feel limited to sitting behind your laptop and drawing lines in PowerPoint, it’s encouraged to schedule a meeting with the customer and draw a potential architecture together with the customer on a whiteboard.
Input for the architecture can be the [Well-Architected Framework](https://microsoft.sharepoint.com/:f:/r/teams/DataAIPremierOfferings/Production/Maintain/Assessment_Program/Well-Architected%20Assessment%20for%20Data%20Platforms?csf=1&web=1&e=Y8M5SN). Some possible ideas on mapping this towards Azure SQL Managed Instance can be found below. More assessment questions can be found at [Data Services | Well-Architected Review](https://learn.microsoft.com/en-us/assessments/azure-architecture-review-data/) and make sure to discuss with the customer all the five WAF pillars:

- *Reliability*
- *Security*
- *Cost Optimization*
- *Operational Excellence*
- *Performance*

Some examples for each pillar:

| WAF Pillar      | Description |
| :-----------: | :----------- |
| Reliability      | <li>Use the [Business-Critical Tier](https://learn.microsoft.com/en-us/azure/azure-sql/database/service-tiers-sql-database-vcore?view=azuresql#business-critical) for higher resiliency</li><li>Configure a secondary instance and an [Auto failover group](https://learn.microsoft.com/en-us/azure/azure-sql/database/auto-failover-group-sql-db?view=azuresql&tabs=azure-powershell)</li> <li>Application and database RPO and RTO are aligned with business requirements </li> |
| Security        | <li>Use [Azure Active Directory](https://learn.microsoft.com/en-us/azure/azure-sql/database/authentication-aad-overview?view=azuresql) whenever possible because you can centrally manage the identities of database users.</li><li>When possible, avoid using SQL authentication.</li><li>Explain how [Microsoft Defender for SQL](https://learn.microsoft.com/en-us/azure/azure-sql/database/azure-defender-for-sql?view=azuresql) provides a set of advanced SQL security capabilities, including SQL Vulnerability Assessment and Advanced Threat Protection.</li><li> Use Microsoft managed keys or Customer managed keys for [data encryption](https://learn.microsoft.com/en-us/azure/azure-sql/database/transparent-data-encryption-tde-overview?view=azuresql&tabs=azure-portal)</li> |
| Performance | <li>For low latency workloads consider [Business Critical tier](https://learn.microsoft.com/en-us/azure/azure-sql/database/service-tiers-sql-database-vcore?view=azuresql#business-critical).</li><li>Use read-only replicas to offload [read-only query workloads](https://learn.microsoft.com/en-us/azure/azure-sql/database/read-scale-out?view=azuresql).</li><li>Define schedules for index and statistics maintenance.</li><li> How monitoring tool will be integrated if the customer already has one otherwise discuss a monitoring solution</li> |
| Operational Excellence | <li>Create a representative test and acceptance environment.</li><li>Determine the possible lifespan of the Azure SQL Managed Instance and apply [reserved capacity](https://learn.microsoft.com/en-us/azure/azure-sql/database/reserved-capacity-overview?view=azuresql).</li><li>Define the configuration of the Azure SQL Managed Instance with Infrastructure as Code.</li> |
| Cost Optimization | <li>Apply for Azure Hybrid Benefit when licenses are already available.</li><li>Determine the possible lifespan of the Azure SQL Managed Instance and apply [reserved capacity](https://learn.microsoft.com/en-us/azure/azure-sql/database/reserved-capacity-overview?view=azuresql).</li>|

**Step 4 - Reporting**
During this step we will focus on finalizing the deliverables of the architecture design session:

- Building the PowerPoint deck or a Visio document for the close-out session during the last meeting of the delivery.  
- During the reporting phase we will focus on highlighting key metrics of the existing environment.
- Building on top of the current environment, present key findings that will influence the architecture in Azure.  
- Summarize blocking or affecting issues you encounter.
- Include the decision for online vs. offline migration for the set of databases and the tooling or features recommended.

**What is Next?**

- Propose follow-up Value Based Deliveries:
  - Customized Workshop for Migration to Azure SQL Arc-Enabled Data Services
  - Proof of Concept for Migration to Azure SQL or Arc-Enabled Data Services
- If the customer is early on their journey, an Azure Landing Zone VBD can be an important next step.

#### **E. Closeout 🏁**

The delivery will be finalized with a close-out presentation that will highlight the work that has been done during the 4 steps and present the designed architecture. Feel free to use the [example PowerPoint](link to PPT) or build your own PowerPoint deck with Microsoft branded components. A basic agenda for the close-out session:

- Present objectives and explain the discovery.
- Present a high-level overview and key metrics of the current environment.
- Present key findings that might block or need more analysis before migration.
- Propose an architecture and migration path of the scoped environment towards Azure SQL Managed Instance. Connect the dots for the customer. Show how product features enable migration.
- Discuss the next steps of the customer.
- Share the outcomes with the CSAM (Customer Success Account Manager) and the account team.

#### **F. Additional References 📖**

  The below documentation can assist you and customer by providing valuable information and references:

- [Migrate databases with Azure SQL migration extension for Azure Data Studio](https://learn.microsoft.com/en-us/azure/dms/migration-using-azure-data-studio?tabs=azure-sql-db)
- [Design workload architectures before migration.](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/migrate/migration-considerations/assess/architect)
- [Migration overview: SQL Server to Azure SQL Managed Instance](https://learn.microsoft.com/en-us/azure/azure-sql/migration-guides/managed-instance/sql-server-to-managed-instance-overview?view=azuresql)
- [Features of SQL Database](https://learn.microsoft.com/en-us/azure/azure-sql/database/features-comparison?view=azuresql)
- [T-SQL differences between SQL Server and Azure SQL Managed Instance](https://learn.microsoft.com/en-us/azure/azure-sql/managed-instance/transact-sql-tsql-differences-sql-server?view=azuresql)
- [Data Workload Assessment Model and Tool](https://www.microsoft.com/en-us/download/details.aspx?id=103130)
- [Cloud adoption framework - design workload architectures before migration](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/migrate/migration-considerations/assess/architect)
- [Business-Critical Tier](https://learn.microsoft.com/en-us/azure/azure-sql/database/service-tiers-sql-database-vcore?view=azuresql#business-critical)
- [Auto failover group](https://learn.microsoft.com/en-us/azure/azure-sql/database/auto-failover-group-sql-db?view=azuresql&tabs=azure-powershell)
- [Azure Active Directory](https://learn.microsoft.com/en-us/azure/azure-sql/database/authentication-aad-overview?view=azuresql)
- [Microsoft Defender for SQL](https://learn.microsoft.com/en-us/azure/azure-sql/database/azure-defender-for-sql?view=azuresql)
- [Data encryption](https://learn.microsoft.com/en-us/azure/azure-sql/database/transparent-data-encryption-tde-overview?view=azuresql&tabs=azure-portal)
- [Use read-only replicas to offload read-only query workloads](https://learn.microsoft.com/en-us/azure/azure-sql/database/read-scale-out?view=azuresql)
- [Azure Policy built-in definitions for Azure SQL Managed Instance](https://learn.microsoft.com/en-us/azure/azure-sql/database/policy-reference?view=azuresql)
- [Azure Policy Regulatory Compliance controls for Azure SQL Managed Instance](https://learn.microsoft.com/en-us/azure/azure-sql/database/security-controls-policy?view=azuresql).
- [Save costs for resources with reserved capacity - Azure SQL Managed Instance](https://learn.microsoft.com/en-us/azure/azure-sql/database/reserved-capacity-overview?view=azuresql)

#### Appendix

Review the documents and assets below to help you.

- Get familiar with the differences and migration paths between on-premises SQL Server and Azure SQL Managed Instance:
  - [Migration overview](https://learn.microsoft.com/en-us/azure/azure-sql/migration-guides/managed-instance/sql-server-to-managed-instance-overview?view=azuresql)
  - [Features comparison](https://learn.microsoft.com/en-us/azure/azure-sql/database/features-comparison?view=azuresql)
  - [T-SQL differences](https://learn.microsoft.com/en-us/azure/azure-sql/managed-instance/transact-sql-tsql-differences-sql-server?view=azuresql)
- Tools and Material
  - [Azure Data Studio with Azure SQL migration extension](https://learn.microsoft.com/en-us/sql/azure-data-studio/extensions/azure-sql-migration-extension?view=sql-server-ver16) supplies an interface to do an Assessment and [Migrate databases](https://learn.microsoft.com/en-us/azure/dms/migration-using-azure-data-studio?tabs=azure-sql-db) through a wizard-like experience.  
  - [Azure Migrate Discovery and assessment tool](https://learn.microsoft.com/en-us/azure/migrate/migrate-services-overview#azure-migrate-discovery-and-assessment-tool) can be used to assess a larger customer estate of the customer. Most of the time used in combination with a bigger infrastructure migration. Be aware that migrations towards Azure SQL Managed Instance are focused on a per-database migration, scope, and scaling.
  - An overview that can help with defining clarifying questions around the customer workload and environment is the [Data Workload Assessment Model and Tool](https://www.microsoft.com/en-us/download/details.aspx?id=103130).
  - Migration can be done by using the [Azure Database Migration Service (DMS)](https://learn.microsoft.com/en-us/azure/dms/dms-overview).
  - Cloud adoption framework [design workload architectures before migration](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/migrate/migration-considerations/assess/architect). Supplies guiding principles and provides a great starting point.
  - Use [IconCloud  Azure Icons](https://iconcloud.design/browse/Azure%20Icons) to help you draw an architecture
  - Depending on the Microsoft region, we also have a sales play that will deliver a Solution Assessment by Microsoft. For example: [Western Europe solution assessment](https://microsoft.sharepoint.com/teams/SolutionAssessments-WE/SitePages/Home.aspx). The data gathered during this assessment can be used as input for the architecture migration session. It will give insights into the current architecture and provides a first estimation for moving the SQL Servers toward Azure SQL Managed Instance. A solution assessment (depending on the type of customer and region) can be requested through [OneAsk](http://aka.ms/oneask)
