# Notes Lecture 10

Vamos ter todos os materiais para o projeto a partir de 13 de Dezembro.
Podemos mandar sempre as cenas ao stor a pedir feedback, mesmo que não seja nos dias do feedback.

Course Divided in 3 parts:
- 1st part: 
- 2nd part: representing the architecture
- 3rd part: microservices

structures:
- software elements
- relations between elements
- properties of elements

## Software Elements

- **Module**: a set of classes that work together to provide a set of services.
  - TODO: explain better
- **Component**: a set of modules that work together to provide a set of services.
  - TODO: explain better
- **Connector**: a set of components that work together to provide a set of services.
  - TODO: explain better

## Views

View = sketch of the system

### Viewtypes

**Module** viewtype - Units of implementation
- Modifiability
- Extensibility

**Component and connector** viewtype - Runtime behavior
- Availability
- Performance
- Security

**Component and connector** viewtype - Allocations
- Deployment
  - Hardware / Virtual Machines
  - Check costs
- Work Assignment
  - People
  - Check cost and time (management)
- Implementation
  - Files

#### Module Viewtype

Modules are units of implementation.

- Name
- Responsibility
- Interface / Usability
- Implementation 
  - Use X algorithm