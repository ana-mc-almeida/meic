# Meta-Circular Evaluators <!-- omit in toc -->

<details>
<summary>Table of Contents</summary>

- [Conceitos](#conceitos)
  - [Macro](#macro)
    - [Name-mangling Techniques](#name-mangling-techniques)
    - [gensym](#gensym)
    - [Hygiene](#hygiene)
  - [Continuation](#continuation)
    - [Implicit Continuation](#implicit-continuation)
    - [Explicit Continuation](#explicit-continuation)


</details>

--- 

> Antes de leres este ficheiro convém estares a par de alguns [conceitos sobre metacircular evaluators](MetaCircular__concepts.md).

Um evaluater (or interpreter) é um programa que executa outro programa. 

Um **meta-circular evaluator** é um evaluator que é escrito na mesma linguagem que ele avalia.

Iremos implementar um evaluator que irá funcionar com [abstract syntax](MetaCircular__concepts.md#abstract-syntax-for-assigments), o que lhe permitirá não ser independente da [concrete syntax](MetaCircular__concepts.md#concrete-syntax-for-assigments) utilizada.


## Conceitos

### Macro

A **macro call** does not evaluate the arguments and computes a result that is evaluated.

Ao contrário disto, a **function call** evaluates the arguments and computes a result that is not evaluated.

#### Name-mangling Techniques

TODO

#### gensym

TODO

#### Hygiene

TODO

### Continuation 

TODO

#### Implicit Continuation

It's impossible for the program to influence the control flow from the callers to the callee.

Program in **direct style**.

#### Explicit Continuation

On each function call, the program decides what to do next.

Program in **continuation-passing style**.
