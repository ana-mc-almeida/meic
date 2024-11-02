# Data Integration <!-- omit in toc -->


<details> 
<summary> Table Of Contents </summary>

- [What is Data Integration?](#what-is-data-integration)
  - [Example of the need for Data Integration](#example-of-the-need-for-data-integration)
- [Schema Matching](#schema-matching)
  - [Mediated Schema](#mediated-schema)
  - [Wrapper](#wrapper)
- [Schema Mapping](#schema-mapping)
- [Data Mapping](#data-mapping)

</details>

## What is Data Integration?

Data Integration is the process of combining data from different sources.

The data sources do not need to be relational databases, can be any type of data source.

### Example of the need for Data Integration

1. Company A merges with Company B
2. Company A has a database with information about its **employees**
3. Company B has a database with information about other **companies**
4. We want to combine the information from **both databases** to have a single database with information about employees and companies

## Schema Matching

Identifying correspondences between the attributes of the schemas that we want to integrate.

### Mediated Schema

The schema that results from the integration of the schemas that we want to integrate.

### Wrapper

Views that facilitate the access to the data in the **original schemas**.  
(A component that is responsible for translating the queries that are made to the mediated schema into queries that are made to the original schemas.)

## Schema Mapping

Transformations (queries) that populate the **mediated schema** with the data from the original schemas.

## Data Mapping

When comparing data from distinct sources, we need to identify the correspondences between the data.
- Merge / approximate duplicates
- Convert data (to a common format)
  - e.g. salary in dollars to salary in euros
  - e.g. date in the format `dd/mm/yyyy` to the format `yyyy-mm-dd`

