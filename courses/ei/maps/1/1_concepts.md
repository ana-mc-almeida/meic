# What are the differences between the concepts of?

## MOM: Time Decoupling vs. Asynchronous Communications

- **Time Decoupling** separates the sender and receiver in time, allowing the message to be processed later, while **Asynchronous Communication** ensures no waiting for an immediate response from the receiver but doesn’t necessarily decouple the timing of activities.

## Kafka: Fire-and-Forget vs. Synchronous Messages vs. Asynchronous Messages

- **Fire-and-Forget** involves sending a message without waiting for a response, while **Synchronous Messages** require an immediate acknowledgment, and **Asynchronous Messages** allow sending without blocking the sender and acknowledging later.

## Kafka Broker vs. Kafka Cluster

- A **Kafka Broker** is a single server that handles messages, while a **Kafka Cluster** is a group of brokers working together for scalability and redundancy.

## Blocking Network I/O vs. Multithreaded Blocking Network I/O vs. Non-Blocking Network I/O

- **Blocking Network I/O** makes a thread wait for I/O to complete, **Multithreaded Blocking I/O** uses multiple threads for separate I/O tasks, and **Non-Blocking Network I/O** allows a thread to continue processing without waiting for I/O to finish.

## Reactor Pattern vs. Proactor Pattern

- The **Reactor Pattern** uses an event loop to handle I/O events synchronously, while the **Proactor Pattern** initiates asynchronous I/O operations and handles them upon completion.
