# SQL Challenge
## Module 9 Challenge
### Overview

This repository uses PostgreSQL to analyze data for the fictional company Pewlett Hackard and their employees from the 1980s and 1990s. First, I engaged in data modeling by creating an Entity Relationship Diagram using QuickDBD, which helped organize the connections between the 6 included csv files. From there, I took the data to the engineering step by developing the SQL schema and creating 6 tables for the given csv files in the file [schema.sql](EmployeeSQL/schema.sql), then imported the csv files into the newly created tables using PgAdmin. Finally, I was able to carry out the desired analysis through queries to the Postgres server in the file [analysis.sql](EmployeeSQL/analysis.sql).

### Outside Sources
The following code was developed solely by me, with limited assistance from other students (checked work on the ERD with Sophia Poretta and then our class instructor/TA). Most code was developed using tools seen in class, with the following exceptions:
- Basic research on one-to-many and many-to-many relatioships to bolster my understanding, using documentation on ERDs by IBM
- PostgreSQL documentation was used to check the object type for date in SQL. 
- I attempted to see if I could locate a method for importing from csv via PostgreSQL query, but it appeared that this was better done through SQLAlchemy, which is a later module.