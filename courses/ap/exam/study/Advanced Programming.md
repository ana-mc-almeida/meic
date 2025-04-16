# Advanced Programming <!-- omit in toc -->

<details>
<summary>Table of Contents</summary>

- [Non-Trivial Concepts](#non-trivial-concepts)
  - [Introspection](#introspection)
  - [Intercession](#intercession)
  - [Meta-Programming](#meta-programming)
  - [Macros](#macros)
  - [Multiple Dispatch](#multiple-dispatch)
  - [Method Combination](#method-combination)
  - [Multiple Inheritance](#multiple-inheritance)
  - [Mixins](#mixins)
  - [Lazy Evaluation](#lazy-evaluation)
  - [Non-Deterministic Evaluation](#non-deterministic-evaluation)
  - [Meta-circular Evaluators](#meta-circular-evaluators)
- [Dúvidas](#dúvidas)

</details>

## Non-Trivial Concepts

### Introspection

Check the [Reflection introduction file](Reflection__introduction.md#introspection)

### Intercession

Check the [Reflection introduction file](Reflection__introduction.md#intercession)

### Meta-Programming

Meta-programming is the process of writing programs that manipulate other programs (or themselves) as their data.

This programs are called **meta-programs** and are essential in a [Computational Meta-System](Reflection__concepts.md#computational-meta-system).

### Macros

Check the [Mata-Circular Evaluators file](MetaCircular.md#macro)

### Multiple Dispatch

Check the [Reflection introduction file](Reflection__concepts.md#multiple-dispatch)

### Method Combination

Check the [CLOS file](CLOS.md#method-combination)

### Multiple Inheritance

TODO: Check the [CLOS file](CLOS.md#class-inheritance--meta-classes)

### Mixins

TODO: Check the [CLOS file](CLOS.md#mixins)

### Lazy Evaluation

O stor não fala em lado nenhum mas o bestie chatGPT diz que é uma técnica de programação onde a avaliação de uma expressão é adiada até que o seu valor seja realmente necessário. Isso pode ajudar a evitar cálculos desnecessários e a melhorar o desempenho do programa.

### Non-Deterministic Evaluation

A partir do slide 1112 dos metacircular slides.

### Meta-circular Evaluators

Check the [Meta-Circular Evaluators file](MetaCircular.md)

## Dúvidas

- [ ] O que é `short-circuit evaluation`?
- [x] O que é um `callee`?
  - É a função que é chamada dentro de outra função (a `caller`).
    - **Caller**: A função que faz a chamada.
    - **Callee**: A função que é chamada.
