# Data Warehousing <!-- omit in toc -->

<details>
<summary>Table of Contents</summary>

- [OLAP vs OLTP](#olap-vs-oltp)
    - [Side by Side Comparison](#side-by-side-comparison)
- [Multi-dimensional Model](#multi-dimensional-model)
- [What is Data Warehousing?](#what-is-data-warehousing)
- [How to build a Data Warehouse](#how-to-build-a-data-warehouse)

</details>

## OLAP vs OLTP


- **OLTP** (Online Transaction Processing) is about processing transactions.
  - Perform CRUD operations on the data
  - CRUD stands for Create, Read, Update, Delete
- **OLAP** (Online Analytical Processing) is about analyzing data.
  - Select data from the database
  - Check the [OLAP Operations file](../study/OLAP-Cubes.md) for more information

#### Side by Side Comparison

--- | OLTP | OLAP
--- | --- | ---
**abbrev. for:** | Online Transaction Processing | Online Analytical Processing
**What it does?** | Processing transactions | Analyzing data
**How does it?** | Perform CRUD operations on the data | Select data from the database
**Number of transactions** | High | Low
**Type of queries** | Simple queries | Complex queries
**Query response time** | Very Fast | Slow because of the complexity of the queries (most of then are aggregations)
**Performance Metric** | Transactions per second | Query response time

## Multi-dimensional Model

Data can be analyzed in multiple **dimensions**.

When writing analytical queries over the database, we can have some limitations, like:
- Non-uniform treatment of dimensions
  - e.g. need of special functions for the time dimension
- Some calculations are done multiple times
  - e.g. calculating the total sales for each product
- Need of many joins to get the desired information
- Parallel queries are not efficient

## What is Data Warehousing?

Data Warehousing is about storing data in a structured way to facilitate the analysis of the data.

When using a Data Warehouse, we can:
- Separate [OLAP from OLTP](#olap-vs-oltp)
- Design an schema that is optimized for analytical queries

> Check some [schemas](#schemas) that can be used in a Data Warehouse

## How to build a Data Warehouse

1. **Design the Data Warehouse**
   - Define the schema with the dimensions and measures
2. **Implement an ETL process to populate the Data Warehouse**
    a. Extract data from the sources
    b. Transform the data to fit the schema
    c. Load the data into the Data Warehouse
