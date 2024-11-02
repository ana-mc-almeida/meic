# Designing a Data Warehouse - Measures <!-- omit in toc -->

> This file complements the [Designing a Data Warehouse](./data-warehouse-design.md) file.

<details>
<summary>Table of Contents</summary>

- [What is a Measure?](#what-is-a-measure)
- [Types of Measures](#types-of-measures)
  - [Additive Measures](#additive-measures)
  - [Semi-additive Measures](#semi-additive-measures)
  - [Non-additive Measures](#non-additive-measures)
  - [Derived Measures](#derived-measures)
- [Aggregation Functions](#aggregation-functions)

</details>

## What is a Measure?

A measure is associated with an aggregation function that computes several values into a single value.

Take place when we change the level of a hierarchy (granularity of the data).

The SUM function is the most common aggregation function however cannot be used for all measures, depending on the type of measure.

## Types of Measures

### Additive Measures

Can be aggregated through all dimensions using the **sum** function

Example:
- Sales amount along costumers, products, time, etc.

### Semi-additive Measures

Can be aggregated through some dimensions

Example:
- Stock amount cannot be summed along time

> Need to use other [aggregation functions](#aggregation-functions) instead of the SUM function

### Non-additive Measures

Cannot be aggregated through any dimension

Example:
- Unit price

> Need to use other [aggregation functions](#aggregation-functions) instead of the SUM function

### Derived Measures

Can be calculated from other measures

Example:
- Profit = Sales - Costs

## Aggregation Functions

- SUM
- AVG
- MIN
- MAX
- COUNT
- etc.