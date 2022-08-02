# Linux Cluster Monitoring Agent
This project is under development. Since this project follows the GitFlow, the final work will be merged to the main branch after Team Code Team.

# Introduction
The purpose of the Linux Cluster Monitoring Agent is to assist the Jarvis Linux Cluster Administration team in efficiently managing their assigned Linux cluster, and plan for future changes. To accomplish this, the agent collects, and monitors the hardware of each host in the Linux cluster, and stores the collected information in a containerized relational database. The minimum viable product consists of various bash scripts to start, and stop the container, collect the hardware specifications of each host to be ran once upon installation, and collect hardware usage every minute. The information will be stored in a PostgreSQL database inside a docker container. Pre-made SQL queries are included to answer common business questions such as detecting when the agent has failed. the collected information will be used by the Cluster Administration team to gather insights on the state of the Linux cluster as a whole, and can be used to write reports, and other documents than will be of interest to the LCA manager.

The following technologies have been used in the implementation of the product:
- Linux nodes using the CentOS distribution make up each Linux cluster
- Google Cloud Platform to deploy each node
- Bash scripts used to collect hardware information from each node
- PostgreSQL 
- Docker container
- IntelliJ to code the bash scripts, and SQL queries


# Quick Start
Use markdown code block for your quick-start commands
- Start a psql instance using psql_docker.sh
- Create tables using ddl.sql
- Insert hardware specs data into the DB using host_info.sh
- Insert hardware usage data into the DB using host_usage.sh
- Crontab setup

# Implemenation
Discuss how you implement the project.
## Architecture
Draw a cluster diagram with three Linux hosts, a DB, and agents (use draw.io website). Image must be saved to the `assets` directory.

## Scripts
Shell script description and usage (use markdown code block for script usage)
- psql_docker.sh
- host_info.sh
- host_usage.sh
- crontab
- queries.sql (describe what business problem you are trying to resolve)

## Database Modeling
Describe the schema of each table using markdown table syntax (do not put any sql code)
- `host_info`
- `host_usage`

# Test
How did you test your bash scripts and SQL queries? What was the result?

# Deployment
How did you deploy your app? (e.g. Github, crontab, docker)

# Improvements
Write at least three things you want to improve 
e.g. 
- handle hardware update 
- blah
- blah