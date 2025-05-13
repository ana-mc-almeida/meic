# Questions

### Integration using files and Message Oriented Middleware have one common feature:

a) The same performance
b) Broker based on the content of the file/message
c) Publish and subscribe pattern of communication
d) The receiver may crash, but the communication may still occur later

Correct answer: d) The receiver may crash, but the communication may still occur later

### The main characteristics of a Message Oriented Middleware system is:

a) Both the client and the servers must be running simultaneously
b) The interaction is always request‐reply
c) The integration tolerates server crash failures
d) The system tolerates client failures but not cluster failures

Correct answer: d) The system tolerates client failures but not cluster failures

### The main characteristics of a synchronous message system is:

a) Both the client and the servers must be running simultaneously
b) The interaction requires a callback
c) The integration tolerates server crash failures
d) The system tolerates client failures but not cluster failures

Correct answer: a) Both the client and the servers must be running simultaneously

### Regarding Message Oriented Middleware Publish and Subscribe:

a) A Consumer subscribes a topic then it may send messages
b) A Producer sends a message to a topic and all the subscriber servers are notified
c) A Producer sends a message to a static list of servers defined in the MOM and all servers are notified.
d) A Producer sends a message to a queue associated with a topic, where all published messages can be read by the Consumers

Correct answer: d) A Producer sends a message to a queue associated with a topic, where all published messages can be read by the Consumers

### Regarding Kafka:

a) As in a Message Oriented Middleware, in Kafka you can send a message to a particular queue or instead to a topic
b) Partitions allow parallelism for the senders of events
c) Topic and partitions are alternative concepts; one can send message to a topic or to a partition independently
d) The reading offset is incremented by Kafka whenever a message is consumed

Correct answer: a) As in a Message Oriented Middleware, in Kafka you can send a message to a particular queue or instead to a topic

### Regarding Kafka:

a) As in a Message Oriented Middleware, in Kafka you can send a message to a
particular consumer group
b) Partitions allow parallelism for the senders of events
c) Topic and partitions are alternative concepts; one can send message to a topic
or to a partition independently
d) The writing offset is incremented by Kafka whenever a message is produced

Correct answer: d) The writing offset is incremented by Kafka whenever a message is produced

### Regarding Kafka and fault tolerance mechanisms:

a) Having multiple partitions on a Topic improves availability
b) Brokers replicate the entire Topic to improve reliability
c) A Partition may be replicated and updated with a primary backup protocol that
assures availability
d) The replication protocol assures that all replicas are always coherent

Correct answer: d) The replication protocol assures that all replicas are always coherent

### Regarding Kafka and consumer group:

a) A consumer group is a set of consumers, and all those consumers can read
events from all partitions
b) Kafka management is unaware of the number of consumers in a consumer
group
c) When a consumer fails, the rebalance may create inconsistency in the stream of
events consumed
d) When a consumer fails, Kafka detects the occurrence and synchronizes the offset in all consumers

Correct answer: d) When a consumer fails, Kafka detects the occurrence and synchronizes the offset in all consumers

### Regarding Kafka and consumer group:

a) A consumer group is a set of consumers, and all those consumers can read
events from all partitions
b) Kafka management is aware of the number of consumers in a consumer group
c) When a consumer fails, the rebalance may create inconsistency in the stream of
events consumed
d) A consumer within a consumer group can produce new messages

Correct answer: b) Kafka management is aware of the number of consumers in a consumer group

### Consider that a Kafka topic has been created with 5 partitions:

a) A producer must know the number of partitions to send a message to the topic
b) A consumer reading from all the partition cannot be assured of the strict order
of the messages it reads
c) The system must have 5 brokers one for each partition
d) A consumer group reading the topic must have 5 consumers

Correct answer: b) A consumer reading from all the partition cannot be assured of the strict order of the messages it reads

> MISSING 2 QUESTIONS THAT HAVE IMAGES

### Consider the following phrase: “In a consumer group, the members can consume different partitions to create redundancy”. Do you consider this sentence correct? Justify your answer

No, its to increase performance

### Consider the following phrase: “Although it’s possible to increase the number of partitions over time, one has to be careful if messages are produced with keys”. What is the reason to use a key when sending a message to Kafka?

To meta-identify the messages and to allow balancing partitions policeies

### Why does one have to be careful if the number of partitions is increased over time.Explain your answer.

Due to the non-sequence that is offered within the topic. Each
partition key increase monotonically, but not in the overall of the partition

### Consider the following phrase: “All partition in a topic must be read by a consumer”.What happens when a consumer crashes? Explain clearly what does Kafka in this situation.

The reading offset is kept to resume the consuming after a crash. This offset can
be stored in kafka cluster explicitly or implicitly

> MISSING 2 QUESTIONS THAT HAVE CODE
