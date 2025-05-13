## What is it and explain in detail how does it work?

### Terraform State Persistency

**What is it?**
Terraform state persistency refers to how Terraform keeps track of the infrastructure it manages. It stores the state of your infrastructure in a state file, which Terraform uses to know what resources exist and their current configurations.

**How does it work?**
When you run Terraform commands (e.g., `terraform apply`), Terraform compares the desired state (as defined in your configuration files) to the actual state (stored in the state file) and applies the necessary changes. The state file is updated after each run to reflect the current infrastructure. The state file can be stored locally, but it's recommended to use remote storage (such as AWS S3 or HashiCorp Consul) for better security and collaboration.

---

### Zookeeper and Kafka Integration

**What is it?**
Zookeeper is a distributed coordination service used by Apache Kafka to manage and coordinate distributed systems.

**How does it work?**
Kafka relies on Zookeeper for various tasks such as managing broker metadata, leader election, partition management, and consumer group coordination. Zookeeper ensures that Kafka brokers are aware of each other and helps maintain the overall health of the Kafka cluster. Zookeeper keeps track of which broker is the leader for each partition and ensures that all replicas are synchronized.

---

### The Role of Zookeeper

**What is it?**
Zookeeper is a distributed coordination service that helps manage and synchronize distributed systems.

**How does it work?**
Zookeeper is primarily used in distributed systems to provide consistent configuration management, synchronization, and naming services. It helps ensure that all nodes in a distributed system agree on the current state of shared data. In Kafka, Zookeeper helps with the coordination of distributed brokers, ensuring leader election for partitions, maintaining metadata for brokers, and coordinating consumer groups.

---

### Kafka Partition

**What is it?**
A Kafka partition is a unit of data storage within a Kafka topic, and it allows Kafka to scale by distributing data across multiple brokers.

**How does it work?**
A Kafka topic can be divided into multiple partitions, with each partition being hosted on a Kafka broker. Each partition is an ordered, immutable sequence of records, and records within a partition are identified by a unique offset. By distributing partitions across multiple brokers, Kafka can horizontally scale and allow for parallel processing, which increases throughput and fault tolerance.

---

### Kafka Consumer Group

**What is it?**
A Kafka Consumer Group is a group of consumers that work together to consume messages from one or more Kafka topics.

**How does it work?**
Each consumer in the group processes messages from a subset of partitions in a topic. Kafka ensures that each partition is consumed by only one consumer within a group, thus enabling parallel processing. If a consumer fails, Kafka will reassign the partitions it was consuming to other consumers in the group, ensuring that no message is lost and load balancing is maintained.

---

### Kafka Message Key

**What is it?**
A Kafka message key is a piece of data used to determine the partition in which the message will be stored.

**How does it work?**
When producing messages to Kafka, the message key determines how messages are distributed across partitions. Kafka uses a hash of the message key to decide the partition in which the message will reside. This ensures that messages with the same key are always written to the same partition, maintaining order.

---

### Kafka Message Offset

**What is it?**
The offset is a unique identifier for each message within a Kafka partition.

**How does it work?**
Each message in a Kafka partition is assigned a sequential offset. Consumers track their progress by remembering the offset of the last message they processed. This allows consumers to pick up where they left off, ensuring they don’t miss any messages or process the same message twice.

---

### Kafka Commit Log

**What is it?**
The Kafka commit log is a sequence of immutable messages stored in Kafka partitions.

**How does it work?**
Each Kafka broker stores a commit log for each partition, which contains a chronological sequence of messages. The commit log is append-only, meaning messages are always added at the end. Kafka guarantees durability by persisting messages on disk. This commit log is the foundation for Kafka’s ability to replay messages, maintain ordering, and handle fault tolerance.

---

### REST API

**What is it?**
REST (Representational State Transfer) API is a web service API that adheres to the principles of REST, using HTTP as its communication protocol.

**How does it work?**
A REST API allows clients to interact with a server using HTTP methods like GET, POST, PUT, DELETE, etc. It defines a set of resources (e.g., /users, /products) and allows clients to perform operations on them by making HTTP requests. REST APIs are stateless, meaning each request from the client must contain all the information needed to process the request.

---

### Processing Rate between Kafka Producer and Kafka Consumer; Which One Has More Computational Consumption?

**What is it?**
The processing rate refers to how quickly Kafka producers and consumers handle messages.

**How does it work?**
Generally, the Kafka consumer has a higher computational consumption because it is responsible for consuming messages, processing them, and potentially acknowledging them (committing offsets). Producers typically have lower computational consumption as they only need to send messages to Kafka brokers, but their performance depends on how frequently messages are produced and how much data is being sent.

---

### Kafka Consumer Group Rebalance

**What is it?**
Kafka Consumer Group Rebalance occurs when the set of consumers in a group changes or when the number of partitions changes.

**How does it work?**
When a consumer joins or leaves a consumer group, or when partitions are added or removed from a topic, Kafka rebalances the consumer group by redistributing the partitions among the available consumers. This ensures that each partition is consumed by exactly one consumer in the group. Rebalances can introduce latency during the process.

---

### Kafka Replication of Partitions in a Cluster

**What is it?**
Kafka replication ensures that each partition has multiple copies (replicas) across different brokers in the Kafka cluster.

**How does it work?**
Each partition has a leader replica and one or more follower replicas. The leader handles all read and write requests, while followers replicate the leader’s messages. This replication ensures fault tolerance, as if a broker or partition leader fails, one of the followers can take over as the new leader.

---

### How to Size the Number of Kafka Brokers in a Kafka Cluster?

**What is it?**
Sizing the number of Kafka brokers determines the scalability and fault tolerance of a Kafka cluster.

**How does it work?**
To size the Kafka brokers, you should consider the total throughput (messages per second), disk capacity, replication factor, and fault tolerance. Typically, a Kafka cluster requires at least three brokers to provide fault tolerance, but more brokers may be necessary depending on the expected traffic. Monitoring tools can help to assess broker utilization and adjust the number of brokers accordingly.

---

### How to Size the Number of Kafka Partitions in a Kafka Topic?

**What is it?**
Kafka partitions determine how data is distributed and processed across Kafka brokers.

**How does it work?**
The number of partitions should be based on factors like throughput, parallelism, and consumer scalability. More partitions allow for higher parallel processing but increase overhead for Kafka’s internal management. Consider the number of consumers and the rate of message production when sizing partitions. Monitoring Kafka’s performance and adjusting the number of partitions as traffic grows is a good practice.

---

### Kafka Commit Log

**What is it?**
Kafka Commit Log refers to the persistent log of messages stored within Kafka partitions.

**How does it work?**
The commit log is an ordered, append-only sequence of records. Kafka ensures durability and fault tolerance by persisting this log on disk. Each record has an offset, and Kafka guarantees that consumers can always replay the messages in the log, providing data integrity and recoverability.

---

### What Are the Four Properties Required for a System to Be Considered a Reactive System?

**What is it?**
A Reactive System is an application that is responsive, resilient, elastic, and message-driven.

**How does it work?**

1. **Responsive**: The system responds in a timely manner, ensuring low-latency interactions.
2. **Resilient**: The system stays responsive in the face of failure, providing fault tolerance.
3. **Elastic**: The system can scale up or down in response to demand.
4. **Message-driven**: The system uses asynchronous message-passing to decouple components, ensuring loose coupling.

---

### Quarkus Non-blocking Database with Pipelining

**What is it?**
Quarkus provides non-blocking database access using reactive programming techniques to improve scalability.

**How does it work?**
Quarkus integrates with reactive libraries (such as Vert.x or Mutiny) to provide asynchronous database access. Pipelining allows multiple queries to be sent to the database before waiting for a response, improving throughput.

---

### Quarkus Mutiny

**What is it?**
Mutiny is a reactive programming library used with Quarkus for handling asynchronous data flows.

**How does it work?**
Mutiny enables the handling of asynchronous operations through reactive streams, allowing operations to be non-blocking and efficient. It simplifies the use of reactive patterns such as `Uni` (single-value async result) and `Multi` (stream of values).

---

### Quarkus Unification of Reactive and Imperative Models

**What is it?**
Quarkus allows you to mix reactive and imperative programming styles.

**How does it work?**
Yes, it’s possible to use both models in Quarkus. For instance, you can create an imperative service for traditional request-response patterns and use reactive models for handling high-concurrency, I/O-bound operations. Quarkus provides seamless integration, allowing you to combine both approaches in a single application for maximum efficiency. You can do it by mixing imperative and reactive code, with Quarkus handling the underlying complexities.

---

### Reactor Pattern

**What is it?**
The Reactor pattern is a design pattern used to handle multiple concurrent events (such as requests or messages) using a single thread. It allows a program to handle many simultaneous I/O operations without creating a new thread for each one.

**How does it work?**
In the Reactor pattern, a central event loop waits for events (e.g., input/output, network connections). When an event occurs, the event loop dispatches it to a specific handler (callback function) designed to process that event. Instead of creating a new thread for each event, the event handlers are executed on the same thread, making the system more efficient by reducing overhead. This pattern is commonly used in high-performance, scalable applications like network servers and asynchronous I/O systems.

The key advantage of the Reactor pattern is that it can handle a large number of concurrent operations with minimal resource consumption (e.g., thread management). It's especially useful in systems with many I/O-bound tasks.

---

### Proactor Pattern

**What is it?**
The Proactor pattern is a variant of the Reactor pattern and is used in asynchronous systems. While both patterns handle I/O events, the Proactor pattern is specifically designed to handle long-running, blocking I/O operations in a non-blocking manner.

**How does it work?**
In the Proactor pattern, when an event occurs, the system doesn't immediately invoke a handler. Instead, it initiates an asynchronous operation and provides a continuation (callback) that should be executed once the operation is complete. This allows the system to continue processing other tasks while waiting for the long-running I/O operation to complete.

The Proactor pattern is useful when dealing with complex or lengthy operations that would otherwise block the main thread (e.g., file downloads, database queries, etc.). By using asynchronous callbacks, it prevents blocking and improves overall system responsiveness.

The Proactor pattern essentially delegates the handling of long-running tasks to another thread or system, allowing the main application flow to remain non-blocking and more scalable. This is particularly beneficial in systems that require both non-blocking and blocking operations.
