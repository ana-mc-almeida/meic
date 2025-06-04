## What is it and explain in detail how does it work?

### Terraform state persistency schema

**What is it?**: A structure that defines how Terraform tracks the state of infrastructure resources.
**How does it work?**: Terraform stores the current state of infrastructure in a state file (`terraform.tfstate`). This file records metadata, resource dependencies, and attributes. When changes are applied, Terraform compares the current configuration with the stored state to generate an execution plan. This file can be local or remote (e.g., in an S3 bucket), enabling collaboration and consistency.

### REST API

**What is it?**: A web-based API following the principles of Representational State Transfer.
**How does it work?**: REST APIs use standard HTTP methods (GET, POST, PUT, DELETE) to manipulate resources identified by URIs. They are stateless, meaning each request contains all information needed for processing, and responses are typically formatted in JSON or XML.

### AWS S3 storage service

**What is it?**: Amazon Simple Storage Service (S3) is an object storage service.
**How does it work?**: S3 stores data as objects in buckets. Each object has a key (identifier), data, and metadata. It provides high durability and scalability and supports operations like PUT, GET, and DELETE via API or SDK. Common use cases include static website hosting, backup, and data lakes.

### Business process engine

**What is it?**: A software system that executes and manages business process models.
**How does it work?**: It interprets models (e.g., BPMN), executes tasks (manual or automated), tracks state, and supports events, timers, gateways, and human interactions. It ensures workflows follow defined logic and transitions across states until completion.

### Authorization of a business process engine

**What is it?**: The mechanism that controls user or system permissions within the engine.
**How does it work?**: It verifies whether a given user, role, or service account has rights to perform certain actions (e.g., start a process, complete a task). This can involve role-based access control (RBAC) and integration with identity providers for authentication.

### Access Authorization

**What is it?**: The process of determining user privileges for accessing a resource or service.
**How does it work?**: After authentication, the system checks policies or roles to decide if the user can access a resource. This often includes permission levels (read, write, execute) and is enforced via mechanisms like access tokens, ACLs, or OAuth scopes.

### Identity management

**What is it?**: The administration of user identities and their associated access permissions.
**How does it work?**: It involves user provisioning, authentication, authorization, and lifecycle management. Identity providers (e.g., Keycloak, AWS IAM) handle user credentials, groups, and roles, often integrated with SSO, MFA, and directory services (LDAP, Active Directory).

### Business process

**What is it?**: A set of structured activities or tasks that produce a specific service or product.
**How does it work?**: Defined using models (e.g., BPMN), executed in sequence or parallel, with decisions, loops, and event-based transitions. It can include automated services and human involvement and aims at achieving business goals efficiently.

### Camunda form

**What is it?**: A UI form associated with user tasks in Camunda processes.
**How does it work?**: Defined using Camunda Forms or external form frameworks (e.g., Angular, React), the form collects input from users and submits it back to the process engine to move the workflow forward.

### Camunda http-connector

**What is it?**: A built-in service task type in Camunda to make HTTP requests.
**How does it work?**: Configured using process model properties (e.g., URL, method, headers, payload), the connector sends an HTTP request during process execution and uses the response to influence the process flow or variables.

### Camunda user interaction task

**What is it?**: A BPMN task where a human user is required to perform an action.
**How does it work?**: When a process reaches this task, it pauses and assigns the task to a user (based on roles or groups). The user interacts via the task list UI or an external app. Once completed, the process resumes.

### Camunda service task

**What is it?**: An automated task in BPMN executed by the engine without user involvement.
**How does it work?**: Executes external logic such as calling REST APIs, invoking Java delegates, or using connectors. Used for automation, like sending emails, triggering jobs, or processing data.

### Correlation ID of a process using Camunda business key

**What is it?**: A unique identifier used to correlate messages or interactions with specific process instances.
**How does it work?**: The `businessKey` is set at process start and can be used to find or correlate events (like messages) to that instance. Useful for tracking, debugging, or linking external events.

### Kubernetes

**What is it?**: An open-source container orchestration platform.
**How does it work?**: Kubernetes manages the deployment, scaling, and lifecycle of containerized applications. It abstracts infrastructure, schedules containers in Pods, handles service discovery, load balancing, storage, and rolling updates via declarative YAML configurations.

### Serverless API invocation process. What is cold start and warm execution?

**What is it?**: The process of invoking APIs in serverless environments like AWS Lambda.
**How does it work?**: On first invocation or after a period of inactivity, the platform initializes the function's runtime environment (cold start), which causes latency. After initial warm-up, subsequent invocations reuse the runtime (warm execution), resulting in lower latency. Cold starts impact performance and are influenced by factors like language runtime, memory size, and concurrency.
