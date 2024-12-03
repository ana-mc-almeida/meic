# Material Study: Decomposition and Data Model Styles <!-- omit in toc -->

<details>
<summary>Table of Contents</summary>

- [Decomposition Style](#decomposition-style)
  - [Overview](#overview)
  - [Elements, Relations, and Properties](#elements-relations-and-properties)
  - [What the Decomposition Styles is For](#what-the-decomposition-styles-is-for)
  - [Notations for the Decomposition Style](#notations-for-the-decomposition-style)
    - [Informal Notation](#informal-notation)
    - [UML Notation](#uml-notation)
  - [Relation to Other Styles](#relation-to-other-styles)
- [Data Model Style](#data-model-style)
  - [Overview](#overview-1)
  - [Elements, Relations, and Properties](#elements-relations-and-properties-1)
  - [What the Data Model Style is For](#what-the-data-model-style-is-for)
  - [Notations for the Data Model Style](#notations-for-the-data-model-style)
    - [Entity-Relationship Diagrams (ERDs)](#entity-relationship-diagrams-erds)
    - [UML Class Diagrams](#uml-class-diagrams)
    - [Table Representation](#table-representation)
  - [Relation to Other Styles](#relation-to-other-styles-1)

</details>

<br>

There are 6 importante module styles:
1. [Decomposition](#decomposition-styles)
2. [Uses](./12_summary.md#uses-style)
3. [Generalization](./13_summary.md#generalization-style)
4. [Layered](./12_summary.md#layered-style)
5. [Aspects](./13_summary.md#aspect-style)
6. [Data Model](#data-model-style)
In this class we will focus on [Decomposition](#decomposition-style) and [Data Model](#data-model-style) Styles. Find other styles in the [summary of class 12](12_summary.md) and [summary of class 13](13_summary.md).

## Decomposition Style

### Overview

This style focuses on the **is-part-of** relation between elements. It is used to decompose a system into smaller parts, which can be developed and maintained independently. The main goal is to reduce complexity and increase modifiability.

Some criteria to choose a decomposition style are:
- **Achivement of certain quality attributes**: Decomposition can improve modularity, allowing for better scalability, performance, and testability.
- **Build-versus-buy decisions**: Some modules can be bought (or reused from older projects or open source projects) instead of built. This can reduce costs and time but the modules to be implemented must be compatible with the rest of the system.
- **Product line implementation**: Common modules can be reused in different products.
- **Team allocation**: In order to allow multiple responsabilities to be implemented in parallel, the system can be divided into parts that can be developed by different teams.

A useful design heuristic holds that a module is small enough if it could be discarded and begun again if the programmer(s) assigned to implement it left the project.

### Elements, Relations, and Properties

The elements of the decomposition style **modules**.  
Some modules that aggregate other modules are called **subsystems**.

The principal relation is **is-part-of**. Must be garantied that an element is part of at most one other element.

The visibility of a module is the set of modules that can access it. The visibility of a module can be restricted to a set of modules, or it can be open to all modules in the system.

### What the Decomposition Styles is For

TODO

### Notations for the Decomposition Style

#### Informal Notation

Modules are represented as rectangles with the module name inside. The **is-part-of** relation is represented by a line connecting the module to its parent module.

#### UML Notation

In UML, modules are represented as classes. The **is-part-of** relation is represented by a line with a diamond at the parent module end.

### Relation to Other Styles

Decomposition style can complement other styles.
Can also be connected to components and connectors views.

## Data Model Style

### Overview

The Data Model Style focuses on how data is structured and how it relates within a system. It emphasizes the organization, storage, and relationships between data elements, making it foundational for systems that rely on data management and manipulation.

This style is particularly important for:

- Defining data integrity and consistency across a system.
- Supporting scalability by providing clear, structured representations of data.
- Aligning the data structure with business rules and requirements.
Data models typically represent entities, their properties, and the relationships between them.

### Elements, Relations, and Properties

Elements in the Data Model Style include:
- **Entities**: Represent real-world objects or concepts.
- **Attributes**: Properties or characteristics of entities.
- **Keys**: Unique identifiers for entities.

Relations in data models define how entities are connected or related to each other. Common types of relations include:
- **One-to-One**: Each entity in one set is related to exactly one entity in another set.
- **One-to-Many**: Each entity in one set is related to multiple entities in another set.
- **Many-to-Many**: Multiple entities in one set are related to multiple entities in another set.

Properties of data models include:
- **Cardinality**: Describes the number of instances of one entity that can be related to another entity.
- **Constraints**: Rules that define the valid relationships between entities.

### What the Data Model Style is For

TODO

### Notations for the Data Model Style

#### Entity-Relationship Diagrams (ERDs)

ERDs are a common notation for representing data models. They use symbols to represent entities, attributes, and relationships between entities. Key components of ERDs include:
- **Rectangles**: Represent entities.
- **Ovals**: Represent attributes.
- **Diamonds**: Represent relationships.

#### UML Class Diagrams

UML class diagrams can also be used to represent data models. In class diagrams, entities are represented as classes, attributes as class properties, and relationships as associations between classes.

- **Classes**: Represent entities.
- **Attributes**: Represent properties of entities.
- **Associations**: Represent relationships between entities.

#### Table Representation

Data models can also be represented in tabular form, with tables representing entities and columns representing attributes. Relationships between entities can be indicated through foreign keys.

### Relation to Other Styles  

- **Component-and-Connector Views**: Data models often support or interact with components and connectors by defining the data structures that components will process or exchange.  
- **Module Views**: Modules may encapsulate data entities or manage specific parts of the data model.  
- **Decomposition Style**: The data model may align with the system decomposition by mapping entities to modules or subsystem