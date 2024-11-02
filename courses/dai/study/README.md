## Topics I need to study:

- [ ] [Views](./views.md)
- [ ] [Data Integration](./data-integration.md)
- [ ] ETL Tools
- [ ] String Matching
- [ ] Data Matching
- [ ] Duplicate Detection
- [ ] Data Profiling
- [ ] Data Warehousing
  - [ ] DW Design
- [ ] [OLAP Operations](./olap-operations.md)
- [ ] SCDs
- [ ] ETL for DW
- [ ] [MDX Queries](./mdx-queries.md)
- [ ] Reporting Tools

## Current questions

- What is a **mediated schema**?
  - A mediated schema is a schema that integrates data from multiple sources.
- What are **materialized** and **non-materialized views**?
  - Materialized views are views that store the result of the query in a table, while non-materialized views are just a query that is executed every time it is called.
- What is a **relational database**?
  - A relational database is a database that stores data in tables.
  - What other types of databases are there?
    - Document-oriented databases (e.g. MongoDB)
    - Graph databases (e.g. Neo4j)
    - Key-value stores (e.g. Redis)

## Technologies used

- Pentaho Data Integration
  - Allows you to create ETL processes
- DataCleaner
  - Tool for data profiling
- Pentaho Schema Workbench
  - Allows you to create OLAP cubes
- Pentaho Server (with saiku)
  - Used to visualize OLAP cubes
- Pentaho Report Designer
  - Used to create reports