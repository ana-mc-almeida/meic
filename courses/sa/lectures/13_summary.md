# Material Study: Generalization Styles <!-- omit in toc -->

<details>
<summary>Table of Contents</summary>

- [Generalization Style](#generalization-style)
  - [Overview](#overview)
  - [Elements, Relations, and Properties](#elements-relations-and-properties)
  - [What the Generalization Styles is For](#what-the-generalization-styles-is-for)
  - [Notations for the Generalization Style](#notations-for-the-generalization-style)
  - [Relation to Other Styles](#relation-to-other-styles)
- [Aspect Style](#aspect-style)
  - [Overview](#overview-1)
  - [Elements, Relations, and Properties](#elements-relations-and-properties-1)
  - [What the Aspect Styles is For](#what-the-aspect-styles-is-for)
  - [Notations for the Aspect Style](#notations-for-the-aspect-style)
  - [Relation to Other Styles](#relation-to-other-styles-1)

</details>

<br>

This class will talk about module styles.  
In [class 11](11_notes.md) we talked about [Decomposition](11_summary.md#decomposition-style) and [Data Model](11_summary.md#data-model-style) styles.  
In [class 12](12_summary.md) we talked about [Uses](12_summary.md#uses-style) and [Layered](12_summary.md#layered-style) styles.  
In this class we will focus on Generalization Styles.

There are 6 importante module styles:
1. [Decomposition](./11_summary.md#decomposition-styles)
2. [Uses](./12_summary.md#uses-style)
3. [Generalization](./13_summary.md#generalization-style)
4. [Layered](./12_summary.md#layered-style)
5. [Aspects](./13_summary.md#aspect-style)
6. [Data Model](./11_summary.md#data-model-style)

## Generalization Style

### Overview

This style focus on the **is-a** relation between elements. It is used to define **common properties** and **variations** between elements.  
The parent element owns the common properties and the child elements own the variations.  
A change in the parent element will affect all child elements.

### Elements, Relations, and Properties

TODO

### What the Generalization Styles is For

- Express inheritance in **object-oriented designs**.
- Incrementally describe evolution and **extension**.
- Provide *global* structure that accommodates **local variations**.
- Find **reusable** modules.

###  Notations for the Generalization Style

UML

### Relation to Other Styles

This style complement other module views like [uses](12_summary.md#uses-style) and [decomposition](11_summary.md#decomposition-style) styles. However, for complext hierarchies modules is better to just use the decomposition style in one diagram.

## Aspect Style

### Overview

TODO

### Elements, Relations, and Properties

TODO

### What the Aspect Styles is For

TODO

### Notations for the Aspect Style

TODO

### Relation to Other Styles

TODO