# What are the differences between the concepts of?

## Docker image and docker container

- A **Docker image** is a _read-only template_ with the application and its dependencies. It's the blueprint for creating containers.
- A **Docker container** is a _running instance_ of a Docker image. It’s the live, executable unit that includes the application process and its isolated environment.

## Virtualization and containerization

- **Virtualization** runs _multiple operating systems_ on a single physical machine using hypervisors. Each virtual machine has its own OS and kernel.
- **Containerization** runs _multiple isolated applications_ on the same OS kernel, sharing it. Containers are lighter and faster to start than VMs.

## Microservices framework and serverless functions

- A **microservices framework** structures applications as a _set of independent services_ that run continuously, often on containers or VMs, communicating via APIs.
- **Serverless functions** are _event-driven, stateless_ functions executed on-demand. They scale automatically and only run when triggered, reducing idle compute time.

## Containers and serverless functions

- **Containers** package applications with all their dependencies and run _persistently_ or long-lived on orchestrators like Kubernetes.
- **Serverless functions** are _ephemeral_, invoked per event/request, and managed entirely by the cloud provider with no server visibility or lifecycle control.

## BPMN descriptive process and BPMN executable process

- A **BPMN descriptive process** is a _visual model_ used mainly for documentation or communication, not meant to be run by a process engine.
- A **BPMN executable process** is a _machine-readable_ version with precise technical details (e.g., task types, service calls) that can be executed by engines like Camunda.

## Pull and push for Camunda task execution

- **Pull**: External workers _poll_ the process engine (e.g., via Camunda External Task API) to fetch and execute tasks.
- **Push**: Tasks are _directly assigned_ to users or systems (e.g., user tasks in forms or service tasks calling Java delegates), without polling.

## BPMN pool and BPMN lane

- A **BPMN pool** represents a _participant_ in the process (e.g., an organization or system), defining boundaries of process responsibility.
- A **BPMN lane** is a _subdivision within a pool_, typically representing roles or departments. Lanes help organize tasks assigned to different actors within the same participant.
