# ETL Tools <!-- omit in toc -->

<details> 
<summary> Table Of Contents </summary>

- [What is ETL?](#what-is-etl)
- [Data Integration vs Data Warehousing](#data-integration-vs-data-warehousing)
  - [Data Integration (non-materialized views)](#data-integration-non-materialized-views)
  - [Data Warehousing (materialized views)](#data-warehousing-materialized-views)


</details>

## What is ETL?

```
    E       T       L  
Extract Transform  Load
```

An ETL process is a process that extracts data from one or more sources, transforms it, and loads it into a target system.

One ETL process can be composed of many transformations.

> As an general rule, **filtering rows**, **selecting columns**, and **joining tables** are should be **executed in the database**, not in the ETL tool **unless** the data comes from multiple sources or when the processing is too complex to implement in SQL.

## Data Integration vs Data Warehousing

### Data Integration (non-materialized views)

Uses views to integrate data from different sources.

1. Define the mediated schema
2. Define the schema mappings between the original schemas (or wrappers) and the mediated schema.
3. Write queries to populate the mediated schema with the data from the original schemas.
4. Write query over the mediated schema.
5. **Results are always up-to-date.**

### Data Warehousing (materialized views)

Data Warehousing is about storing data in a structured way to facilitate the analysis of the data.

1. Design the Data Warehouse
2. Implement an ETL process to populate the Data Warehouse
3. Write queries over the Data Warehouse
4. **Run ETL process periodically to keep the Data Warehouse up-to-date**