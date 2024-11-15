# Notes Lecture 2

Main topics: 
- Software Elements
- Relations between Software Elements
- Properties of Software Elements and Relations
- How this **reasons** about systemic qualities

## Software Elements

Can be [Modules](#modules) or [Components and Connectors](#components-and-connectors)

### Modules

A piece of software that has a well-defined interface and a well-defined implementation.

- **Interface**: the way the module interacts with the rest of the system
- **Encapsulate**: the implementation is hidden from the rest of the system. Makes it possible to modify the implementation without affecting the rest of the system. This allows **modifiability** and maintainability.

### Components and Connectors

- Components have a **life cycle**.
- Connectors are **protocols** that allow components to communicate.
  - middleware: a software layer that allows components to communicate.
  - some protocols **properties**:
    - reliability
    - availability
    - performance
    - security