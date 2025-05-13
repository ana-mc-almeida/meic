# What is it and explain in detail how does it work?

## Terraform State Persistency

**What is it?**: Refers to how Terraform stores the state of managed infrastructure.
**How does it work?**: Terraform stores infrastructure state in a state file, which is used to determine necessary changes when running commands.

## Zookeeper and Kafka Integration

**What is it?**: Zookeeper coordinates distributed systems like Kafka.
**How does it work?**: Zookeeper manages metadata, broker coordination, leader election, and partition management in Kafka.

## The Role of Zookeeper

**What is it?**: Zookeeper is a distributed coordination service.
**How does it work?**: It ensures synchronization, configuration management, and leadership election within distributed systems like Kafka.

## Kafka Partition

**What is it?**: A Kafka partition is a unit of data storage within a Kafka topic.
**How does it work?**: Partitions allow Kafka to distribute data across brokers and scale horizontally.

## Kafka Consumer Group

**What is it?**: A Kafka Consumer Group is a collection of consumers that consume messages in parallel.
**How does it work?**: Consumers share partitions, ensuring each partition is processed by one consumer at a time.

## Kafka Message Key

**What is it?**: A Kafka message key is a value used to determine the partition for a message.
**How does it work?**: Kafka hashes the message key to decide which partition the message will go to.

## Kafka Message Offset

**What is it?**: The offset is a unique identifier for a Kafka message within a partition.
**How does it work?**: Each message is assigned an offset, which consumers track to ensure no message is missed.

## Kafka Commit Log

**What is it?**: A Kafka commit log is an ordered, immutable sequence of messages stored in partitions.
**How does it work?**: The commit log is append-only and stores messages persistently for durability and replayability.

## REST API

**What is it?**: A REST API is a web service using HTTP for communication.
**How does it work?**: It allows clients to perform CRUD operations on resources via HTTP methods like GET, POST, PUT, DELETE.

## Processing Rate between Kafka Producer and Kafka Consumer; Which One Has More Computational Consumption?

**What is it?**: Refers to the rate at which Kafka producers and consumers handle messages.
**How does it work?**: Kafka consumers tend to have higher computational consumption due to message processing and offset management.

## Kafka Consumer Group Rebalance

**What is it?**: Kafka Consumer Group Rebalance occurs when the group or partitions change.
**How does it work?**: When a consumer joins, leaves, or partitions change, Kafka redistributes partitions among consumers.

## Kafka Replication of Partitions in a Cluster

**What is it?**: Kafka replicates each partition across multiple brokers for fault tolerance.
**How does it work?**: Each partition has one leader and multiple followers; if the leader fails, a follower takes over.

## How to Size the Number of Kafka Brokers in a Kafka Cluster?

**What is it?**: Sizing brokers is about determining the number of brokers needed for scalability and fault tolerance.
**How does it work?**: The number of brokers depends on throughput, disk space, replication, and fault tolerance requirements.

## How to Size the Number of Kafka Partitions in a Kafka Topic?

**What is it?**: Sizing partitions is about distributing data and balancing load across consumers.
**How does it work?**: More partitions allow parallel processing but increase overhead; size based on expected load and consumer needs.

## Kafka Commit Log

**What is it?**: A Kafka commit log stores ordered messages in partitions for durability.
**How does it work?**: It’s append-only and ensures that messages are persistently stored, allowing replay and fault tolerance.

## What Are the Four Properties Required for a System to Be Considered a Reactive System?

**What is it?**: A reactive system is responsive, resilient, elastic, and message-driven.
**How does it work?**: These properties ensure that the system can scale, recover from failures, and remain responsive to events.

## Quarkus Non-blocking Database with Pipelining

**What is it?**: Quarkus provides asynchronous, non-blocking database access.
**How does it work?**: It uses reactive programming to send multiple database queries without waiting for each response, improving throughput.

## Quarkus Mutiny

**What is it?**: Mutiny is a reactive programming library for handling async operations in Quarkus.
**How does it work?**: It simplifies reactive patterns like `Uni` (single value) and `Multi` (stream of values) for non-blocking operations.

## Quarkus Unification of Reactive and Imperative Models

**What is it?**: Quarkus allows mixing reactive and imperative programming models.
**How does it work?**: Both models can be used in a single application, with Quarkus handling integration for seamless operation.

## Reactor Pattern

**What is it?**: The Reactor pattern handles multiple concurrent events using a single thread.
**How does it work?**: It uses an event loop to dispatch events to handlers, avoiding thread creation for each event.

## Proactor Pattern

**What is it?**: The Proactor pattern handles long-running, blocking I/O operations asynchronously.
**How does it work?**: It initiates operations and uses callbacks to handle results when the operation completes, ensuring non-blocking execution.
