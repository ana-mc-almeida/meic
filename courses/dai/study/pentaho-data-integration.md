# Pentaho Data Integration <!-- omit in toc -->


<details>
<summary> Table Of Contents </summary>

- [What is Pentaho Data Integration?](#what-is-pentaho-data-integration)
- [How it works](#how-it-works)
- [Steps](#steps)
  - [Table Input](#table-input)
  - [Text File Output](#text-file-output)
  - [Select Values](#select-values)
  - [Join Rows](#join-rows)
  - [Sort](#sort)
  - [Group By](#group-by)
  - [Filter Rows](#filter-rows)
  - [Insert/Update](#insertupdate)
  - [Dimension Lookup/Update](#dimension-lookupupdate)
  - [Calculator](#calculator)
  - [Value Mapper](#value-mapper)
  - [Database Lookup](#database-lookup)

</details>

## What is Pentaho Data Integration?

Pentaho Data Integration is a tool that allows you to create ETL processes.

## How it works

- Transformations work in a "streaming" way, meaning that they process one row at a time.
  - The first row can reach the end of the transformation before the second row starts.
  - There are some exceptions to this rule, like the `Group By` step, that needs to process all the rows before it can output anything.

- Transformations can be saved and executed multiple times.


## Steps

### Table Input

### Text File Output

### Select Values

### Join Rows

### Sort

### Group By

A step that groups rows based on the values of one or more fields.

Always needs to run a [Sort](#sort) step before it.

### Filter Rows

### Insert/Update

### Dimension Lookup/Update

### Calculator

### Value Mapper

### Database Lookup