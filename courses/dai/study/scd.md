# Slowly Changing Dimensions

## What is a Slowly Changing Dimension?

A SCD is used to track changes in data over time and to maintain a history of the data.

### Example

If we have a database from a store and a product changes its price, we want to keep track of the price changes over time.  
When getting the total price of a sale, we want to use the price that was valid at the time of the sale.

## How do deal with SCDs?

type 0 - retain original
type 1 - overwrite
type 2 - add row
type 3 - add column
type 4 - add mini-dimension
type 5 - add mini-dimension and foreign key
type 6 - extend type 2 with current value
type 7 - add foreign key to fact table

There are 7 types of SCDs.

The first 4 (from 0 to 3) are the most common and tipically are supperted by ETL tools.  
The other 3 are more complex and tipically are implemented by the data warehouse designer.

### Type 0 - Retain Original

Don't update the data, keep the original data.

> The data will not be updated. Nothing will change.

### Type 1 - Overwrite

Update the data with the new data.

> The history is lost.

### Type 2 - Add Row

Store multiple versions of the same data.

- The surrogate key is new but we can use the natural key to identify the row.
- Add columns 'FromDate' and 'ToDate' to the table to store the time period in which the data was valid.
  - May also add a 'RowStatus' column to indicate if the row is active or not (and make the query easier).

### Type 3 - Add Column

Add new column for each attribute that changes.

#### Example

If the price is updated from A to B:
- add a new column 'NewPrice' with the value B
- the 'Price' column will maintain the value A

Then, if the price is updated from B to C:
- the 'Price' column will update to B
- the 'NewPrice' column will update to C

> This only keeps the history of the 2 most recent values.

### Type 4 - Add Mini-Dimension

- Create a new table with the attributes that change frequently.
  - Each row of this table will be a **unique combination** of the values of the attributes represented in the    mini-dimension and will have a **surrogate key**.
- Add a foreign key to the original table that references the surrogate key of the mini-dimension table.

#### Example

If the price and the supplier of a product change frequently:
- create a mini-dimension table with the columns 'Price' and 'Supplier'
- add a foreign key to the original table that references the surrogate key of the mini-dimension table.

In the first moment, the price of product A is 10€ and the supplier is X, so we will have this in the mini-dimension table:
| SurrogateKey | Price | Supplier |
| --- | --- | --- |
| 1 | 10 | X |

And in the original table:
Time | Product  | MiniDimensionKey |
| --- | --- | --- |
1 | A | 1 |

If the price changes to 15€, we will have this in the mini-dimension table:
| SurrogateKey | Price | Supplier |
| --- | --- | --- |
| 1 | 10 | X |
| 2 | 15 | X |

And in the original table, the foreign key will be updated to 2:
| Time | Product  | MiniDimensionKey |
| --- | --- | --- |
| 1 | A | 1 |
| 2 | A | 2 |

Then, if the supplier changes to Y, we will have this in the mini-dimension table:
| SurrogateKey | Price | Supplier |
| --- | --- | --- |
| 1 | 10 | X |
| 2 | 15 | X |
| 3 | 15 | Y |

And in the original table, the foreign key will be updated to 3:
| Time | Product  | MiniDimensionKey |
| --- | --- | --- |
| 1 | A | 1 |
| 2 | A | 2 |
| 3 | A | 3 |

### Type 5 - Add Mini-Dimension and Foreign Key

Similar to type 4 but the original table will have a foreign key to the mini-dimension table.

> However, the fact table will have a foreign key to the mini-dimension table.

### Type 6 - Extend Type 2 with Current Value

Similar to [type 2](#type-2---add-row) but also add a column `Current` to indicate the surrogated key of the current value.

### Type 7 - Add Foreign Key to Fact Table

Just like [type 6](#type-6---extend-type-2-with-current-value) but use the attribute's natural key in the `Current` column.
