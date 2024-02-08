# DEZ-2024
## Week 1 - Basics and Setup


Tools needed :
  - Docker and Docker-Compose
    - 1.2.1 install and hello world
      > docker run hello-world \
      > docker build -t test:name .\
      > Docker run -it test:pandas \
      > Parameters and using of Dockerfile 
    - 1.2.2 ingesting NY Taxi data
      > Use of postgresql as server in Docker: 
```
      Docker run -it \
      -e POSTGRES_USER = "root" \
      -e POSTGRES_PASSWORD = "root" \
      -e POSTGRES_DB = "ny_taxi" \
      -v $(pwd)/ny_taxo_postgres_data:/var/lib/postgresql/data \
      -p 5432:5432 \
      postgres:13 
``` 
  - Using pandas to read CSV, create the postgresql structure then copy the contents using chunks reading
  - Using pgcli application in commands lines to check the POSTGRESQL database
    - 1.2.3 Connecting pgAdmin
      - Use of pgadmin
      - Install pgadmin in Docker :
```
      docker run -it \
        -e PGADMIN_DEFAULT_EMAIL="admin@admin.com" \
        -e PGADMIN_DEFAULT_PASSWORD="root" \
        -p 8080:80 \
        dpage/pgadmin4
```      
  - Need for network to connect the 2 dockers : pgAdmin with POSTGRESQL server
  - docker network create pg-network
    - 1.2.4 Dockerizing the ingestion
      Change the jupyter notebook to a script that could be launched in a docker
    - 1.2.5 running postgres and pgAdmin
      - Use of docker Compose
    - 1.2.6 SQL
  - Python 3 (e.g. via Anaconda)
  - Google Cloud SDK
  - Terraform








---
Tools and Docs

<details>
<summary>DOCS1</summary>      
  - [XYZ](https://url.com/) General
  - [XYW](url2) Lien 2
</details>

