# Views <!-- omit in toc -->


<details> 
<summary> Table Of Contents </summary>

- [What is a view?](#what-is-a-view)
    - [Creating a view](#creating-a-view)
    - [Querying a view](#querying-a-view)
    - [Dropping a view](#dropping-a-view)
- [View Expansion (or view unfolding)](#view-expansion-or-view-unfolding)
    - [Example](#example)
- [Security](#security)
    - [Example](#example-1)
- [Data Independence](#data-independence)
- [Views over views](#views-over-views)
    - [Example](#example-2)
</details>

## What is a view?

A view is a virtual table that associates a name to a query (a SELECT statement).  
As it is a virtual table, it does not store data and **their contents will change if the tables involved in the query change**.

#### Creating a view
```sql
CREATE OR REPLACE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;
```

#### Querying a view
```sql
SELECT * 
FROM view_name
WHERE condition;
```

#### Dropping a view
```sql
DROP VIEW view_name;
```

## View Expansion (or view unfolding)

Replace the view name with the query that defines the view.

#### Example

- View definition:
```sql
CREATE VIEW view1 AS
SELECT column1, column2
FROM table1
WHERE condition;
```

- Querying the view:
```sql
SELECT count(*)
FROM view1
WHERE column1;
```

- View expansion:
```sql
SELECT count(*)
FROM (
    SELECT column1, column2
    FROM table1
    WHERE condition
)
WHERE column1;
```

Note that for some cases, an unfolded query can be rewritten in a more simple way.

Also, the query optimizer can use the unfolded query to optimize the query execution.

## Security

- Views can be used to restrict access to certain columns of a table.
  - If a table has all the clients' information but you only want to show their names, you can create a view that only shows the names.
- Views can be used to restrict access to certain rows of a table.
  - If a table has all the clients' information but you only want to show the clients from a certain country, you can create a view that only shows the clients from that country.

#### Example

If a company has 2 apps, one for the VIP clients and other for the regular clients, they can create a view for each app that only shows the clients that belong to that app.  
This way, the developers of the VIP app will not have access to the regular clients' information and vice-versa.

## Data Independence

- Views map the data from the physical schema to a logical model.  
- Applications only know the views (logical model), not the tables (physical schema).
- This way, if the physical schema changes, the applications do not need to be changed.

## Views over views

Views can also be created over other views in the same way they are created over tables.

#### Example

- View definition:
```sql
CREATE VIEW view1 AS
SELECT column1, column2
FROM table1
WHERE condition;
```

- View over view definition:
```sql
CREATE VIEW view2 AS
SELECT column1
FROM view1
WHERE column2;
```
