# Designing a Data Warehouse - Schemas <!-- omit in toc -->

> This file complements the [Designing a Data Warehouse](./data-warehouse-design.md) file.

<details>
<summary>Table of Contents</summary>

- [Star Schema](#star-schema)
- [Snowflake Schema](#snowflake-schema)
- [Constellation Schema](#constellation-schema)

</details>


### Star Schema

- Central table (**fact table**) with the measures (e.g. sales, quantity, etc.)
- Surrounding tables (**dimension tables**) with the dimensions (e.g. product, time, etc.)

This schema allows to only join the fact table with desired the dimension tables that are needed.

Some informations:
- The **key of the fact table** is a composite key of the keys of the dimension tables
- Dimension tables are usually small relative to the fact table size
- Dimension tables have redundant information (**are not normalized**)
- Update and Delete operations are rare in the Data Warehouse

### Snowflake Schema

- Similar to the star schema, but the dimension tables are normalized
  - Dimension tables are split into smaller dimension tables

### Constellation Schema

- Combination of multiple star schemas
- Used when there are multiple fact tables
