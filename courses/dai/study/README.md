## Topics I need to study:

- [x] [Views](./views.md)
- [x] [Data Integration](./data-integration.md)
- [x] [ETL Tools](./etl-tools.md)
- [x] [String Matching](./string-matching.md)
- [ ] Data Matching
- [x] [Duplicate Detection](./duplicate-detection.md)
- [x] [Data Profiling](./data-profiling.md)
- [x] [Data Warehousing](./data-warehousing.md)
  - [x] [DW Design](./data-warehouse-design.md)
- [ ] [OLAP Operations](./OLAP-Cubes.md)
- [x] [SCDs](./scd.md)
- [ ] ETL for DW
- [ ] [MDX Queries](./MDX-Queries.md)
- [ ] Reporting Tools

## Questions

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