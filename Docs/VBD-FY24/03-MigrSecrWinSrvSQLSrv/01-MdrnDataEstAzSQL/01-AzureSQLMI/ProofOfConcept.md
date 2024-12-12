### **Proof of Concept for Modernizing your Data Estate with Azure SQL**

#### (Duration - 24 Hours) *Duration is an approximate, can be adjusted

[Learning Path and Accreditation](https://aka.ms/DAISP1CS2PoCLP)

#### **A. Objective**

This guide will provide details and instructions to help you deliver a successful Proof of Concept for your customer. The Proof of Concept must accomplish the following objectives :

- Deploy a functional version of your solution in a small scale to determine its feasibility & reinforce design decisions
- Demonstrate the business and technical value of the solution.

#### **B. Pre-requisites**

[!INCLUDE [Pre-Delivery Checklist](~/VBD-FY24/CommonContent/PredeliveryChecklist.md)]


[!INCLUDE [Customer Scoping](~/VBD-FY24/CommonContent/ScopingGeneral.md)]


  At the end of scoping, set clear expectations on what is in scope and what is out of scope with the customer. Use the table below as a guide:

  | **In Scope** |
  |---------     |
  |Deploy a functional small‐scale version of the solution |
  |Demonstrate small data migration along with best practices (Note - The workload to be migrated should be small enough to allow the synchronization to happen in a day) |
  |Demonstrate the business and technical value of the solution |

  | **Out of Scope**  |
  |---------          |
  |Landing Zone creation or VPN infrastructure setup and ExpressRoute configuration for hybrid connectivity with Azure |
  |Migrate workloads with terabytes of data |

  | **Success Criteria** 🏅 |
  |--------- |
  |Deliver a small prototype of the solution proposed to prove the feasibility of the solution |

#### **C. Target Audience**

  Having the right customer participants in the engagement is essential for success. Ensure the customer roles outlined in the next table are available and able to participate in the workshop.

  |Customer Role | Required or Optional|
  |----          |----                 |
  |Project Sponsor and/or Project Manager | Required|
  |Database Architects                    | Required|
  |Application Architects                 | Optional|
  |Database Administrators                | Required|
  |Infrastructure Architects              | Optional|
  |Security Architects                    | Optional|

#### **D. Execution**

Deliver a functional small‐scale version of the solution that can be used to determine its feasibility and reinforce design decisions within the agreed scope. Demonstrate the business and technical value of the solution.

- Accelerate and deploy a [Proof-of-Concept](https://aka.ms/SQLMigrationPoC) environment of SQL Server migration to Azure SQL Managed Instance with encapsulated best practices and step-by-step execution steps that will enable you to test, adjust and fully deploy the automated solution at scale.
- [Automate migration from SQL On-Prem to SQL Managed Instance](https://dev.azure.com/CEandS/Azure-Data-Migrations/_wiki/wikis/Automate-SQL-MI-Migration/871/Introduction) to help customers who are running SQL Server 2016 and below where they can’t opt for zero downtime migration using AlwaysOn Distributed Availability group replica.
  
POC success leads to presenting the results to stakeholders, while failure offers two choices:

- Retrying the POC by redefining goals, scope, or architecture;
- conducting a post-mortem to learn from the experience.

In order to assist the customer with this scenario, below are various **deliveries, documents, and other assets** that you can leverage. Please note you are not limited to or bound by the below deliveries.  You have the freedom to use the below deliveries, come up with your own custom deliveries, mix and match, etc. to reach a solution that is favorable to the customer.

| Delivery Type | Delivery Name | Customer Level | Target Audience | Delivery Method| Use Case | Outcome
| --- | --- | --- | --- | --- | ---| ---|
| POC | [SQL Server database migration one-click PoC](https://aka.ms/SQLMigrationPoC) | Beginning, Intermediate, Advanced| Database Administrator, Database Developer, Database and/or Application Architects, Database Engineer, Data Analyst, Data Governance team members, Cloud Architect, Networking Specialist, Security architect | Hands-on and POC| Accelerate and deploy a Proof-of-Concept environment of SQL Server migration to Azure SQL Managed Instance with encapsulated best practices | Successful POC migration & validation of design decisions of customer's database with small dataset to Azure |
| Activate | [Activate Data Platform Modernization for SQL](https://microsoft.sharepoint.com/:f:/r/teams/DataAIPremierOfferings/Production/Plan/Activate/Activate_Data_Platform_Modernization_for_SQL?csf=1&web=1&e=bKdXv7) | Beginning, Intermediate, Advanced | Database Administrator, Database Developer, Database and/or Application Architects, Database Engineer, Data Analyst, Data Governance team members, Cloud Architect, Networking Specialist, Security architect | Hands-on and PPT Driven             | This delivery is suitable for demonstrating Azure Database for PostgresSQL samples | Validation of design decisions |
| POC |[Automate Migration from SQL On-Prem to SQL Managed Instance](https://dev.azure.com/CEandS/Azure-Data-Migrations/_wiki/wikis/Automate-SQL-MI-Migration/871/Introduction) | Beginning, Intermediate, Advanced| Database Administrator, Database Developer, Database and/or Application Architects, Database Engineer, Data Analyst, Data Governance team members, Cloud Architect, Networking Specialist, Security architect | Hands-on and POC |  Provide SQL MI migration automation using Log Replay Service. The automation script should help customer to accomplish seamless SQL MI migration POC from one or multiple SQL On-Prem environment. | Successful POC migration & validation of design decisions of customer's database with small dataset to Azure |
| POC |[Guided-SQL Hackathon for SQL Modernization](https://github.com/Azure/SQL-Modernisation-Hack) | Beginning, Intermediate, Advanced| Database Administrator, Database Developer, Database and/or Application Architects, Database Engineer, Data Analyst, Data Governance team members, Cloud Architect, Networking Specialist, Security architect | Hands-on and PPT Driven |This delivery is suitable for demonstrating Azure Migration and SQL MI Administration,Perf.Optimization and Security in a modular way   | Validation of design decisions and validation of value platform databases |

#### **E. Closeout 🏁**

- Email the customer contact with a slide deck and material consisting of POC details(scope, success criteria, POC result, design decisions & validations)
- Any offline answers to customer questions
- Review VBD opportunity feedback with the CSAM and account CSA for scheduling any future engagements

#### **F. Additional References 📖**

  The below documentation can assist you and customer by providing valuable information and references:

- [SQL Server database migration one-click PoC](https://aka.ms/SQLMigrationPoC)
- [Migrate SQL Server to an Azure SQL Managed Instance online using DMS](https://learn.microsoft.com/en-us/azure/dms/tutorial-sql-server-managed-instance-online-ads)
- [Migration overview: SQL Server to Azure SQL Managed Instance](https://learn.microsoft.com/en-us/azure/azure-sql/migration-guides/managed-instance/sql-server-to-managed-instance-overview?view=azuresql)
- [Compare options for migration](https://learn.microsoft.com/en-us/azure/azure-sql/migration-guides/managed-instance/sql-server-to-managed-instance-overview?view=azuresql#migration-tools)
