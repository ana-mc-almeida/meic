# Class scope test cases for the Terminal class

In order to test the Terminal class, we will use a Modal Class Test Pattern.

Steps:

1. [Generating the state model for CUT](./stateModel.png)
2. [Full expansion of conditional transition variants](truthTable.md)
   1. [Update the state model with the full expansion of conditional transition variants](./stateModel_after_truthTable.png)
3. [Generate transition tree](./transitionTree.png)
4. [Generate Conformance Test Suite](conformanceTestSuites.md#initial-conformance-test-suites)
5. [Develop test data for each path using Invariant Boundaries](./invariantBoundaries.md)
6. [Build Transition Table](./transitionTable.md)
7. [Add PSP to the transition tree](conformanceTestSuites.md#add-the-sneak-path-test-suite)
