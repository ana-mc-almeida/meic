# Class Scope Testing <!-- omit in toc -->

The purpose of class scope testing is to test the interactions of the methods in the class.

We should find the best sequence of methods to test.

<details>
<summary>Table of Contents</summary>

- [Class Modalities](#class-modalities)
  - [Message sequence constraints](#message-sequence-constraints)
  - [Domain constraints](#domain-constraints)
  - [Types of class modalities](#types-of-class-modalities)
    - [Non-modal class](#non-modal-class)
    - [Uni-modal class](#uni-modal-class)
    - [Quasi-modal class](#quasi-modal-class)
    - [Modal class](#modal-class)
- [Test Patterns](#test-patterns)
  - [Invariant Boundaries](#invariant-boundaries)
  - [Nonmodal Class Test](#nonmodal-class-test)
    - [FSM based testing](#fsm-based-testing)
  - [Modal Class Test](#modal-class-test)
  - [Quasi-modal Class Test](#quasi-modal-class-test)

</details>

## Class Modalities

TODO

#### Message sequence constraints

If the class will reject some sequence of message, based on the states of the objects.

Example: Timer cannot be stopped if it is not started.

#### Domain constraints

If the class will reject some messages, based on the current content of the object.

Example: A debit cannot be made on an account with balance smaller than the debit amount.

### Types of class modalities

#### Non-modal class

No constraints on the sequence of messages.

Example: A class that only has getters and setters.

#### Uni-modal class

The message sequence constraints are _independent_ of the domain constraints.

- Constrains based in **history**

> A class that has a method that can only be called if the object is in a certain state.

Example: in _TraficLight_ class, the method `turnRed` can only be called after the method `turnYellow` is called.

#### Quasi-modal class

The message sequence constraints are _dependent_ of the domain constraints but not necessarily of the history.

- Constrains based in **domain**

#### Modal class

The message sequence constraints are _dependent_ of the domain constraints and the history.

- Constrains based in **history** and **domain**

## Test Patterns

### Invariant Boundaries

Does not consider input/output relationship or message sequence

TODO

### Nonmodal Class Test

Does not constrain message sequences

TODO

#### FSM based testing

TODO

### Modal Class Test

Has fixed constraints on message sequence

TODO

### Quasi-modal Class Test

TODO
