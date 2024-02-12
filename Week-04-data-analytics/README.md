# DEZ-2024
## Week 4 - Data Analytics

### Prerequisites
By this stage of the course you should have already: 

- A running warehouse (BigQuery or postgres) 
- A set of running pipelines ingesting the project dataset (week 3 completed)
- The following datasets ingested from the course [Datasets list](https://github.com/DataTalksClub/nyc-tlc-data/): 
  * Yellow taxi data - Years 2019 and 2020
  * Green taxi data - Years 2019 and 2020 
  * fhv data - Year 2019. 

### 4.1.1 - Analytics Engineering Basics
- What is analytics engineering :
    - MPP : massively parallel processing (MPP) database
    - different tools like mage, sql-first ...
    - Roles in data team :
        - Data Engineer : prepare and maintain the infrastructure 
        - data analyst : uses data to answer question and solve problems
        - analytics engineer : gap between the software engineering skills and the business knowledge from data analyst/scientist
    - Tooling : 
        > Data Loading \
        > Data Storing: _Cloud data warehouses like Snowflake, BQ, Redshift_ \
        > Data modelling: _tools like dbt or Dataform_ \
        > data presentation: _BI tools like goolge data studio, Looker, Mode or Tableau_
    - ETL Vs ELT (see Week 2)
    - Kimball's Dimentional Modeling :
        - Objective L deliver data understandable to the business users
        - Approache : prioritise user understandability and query perf over non redundant data 
    - Element of Dimentional Modeling :
        - Facts table : measurements, metrics or facts ("verbs")
        - dimensions tables : corresponds to a business entity ("nouns")
    - Architecture of dimensional modeling (comparing with restaurant):
        - Stage area : raw data, not meant to exposed to everyone (stockage area)
        - processing area (kitchen) : from raw to data models
        - presentation area (dining hall) : final presentation, exposed to business stakeholders

### 4.1.2 - What is dbt :
- transformation workflow that allows anyone that knows SQL to deploy analytics code in the data warehouse
![alt text](image.png)
- how to use dbt :
    - dbt Core :
        - Builds and runs dbt project (.sql and .yml files)
        - SQL compuilation logic, macros and database adapters
        - omc;ide a CLI interface to run dbt command locally
    - dbt Cloud :
        - SaaS application to develop and manage dbt projcets
        - Web-based IDE
![alt text](image-1.png)

### 4.2.1 - Start Your dbt Project BigQuery and dbt Cloud
- Create a new dbt projcet