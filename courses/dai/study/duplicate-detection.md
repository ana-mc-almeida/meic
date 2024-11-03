# Duplicate Detection

1. Rename to have duplicated data
2. Remove same id
    - No not compare x-y and y-x, only compare IDx < IDy
3. Calculate the measures for each attribute (Check the [String Matching](../study/string-matching.md) file)
4. Combine the measures (when calculating it for more than one attribute)
5. Define and apply a threshold
6. Get the results
7. Delete duplicates