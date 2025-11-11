# Tutorial 3: Kafka Distributed

All commands for this lab are using the `ec2-44-223-22-176.compute-1.amazonaws.com`.
Just replace it with your own IP or DNS name.

All comands for this lab are using `clicks` topic.
Just replace it with your own topic name.

## A. Listing all topics

```
sudo /usr/local/kafka/bin/kafka-topics.sh --list --bootstrap-server localhost:9092
```

## B. Creating one topic with multiple partitions

```
sudo /usr/local/kafka/bin/kafka-topics.sh --create --bootstrap-server ec2-44-223-22-176.compute-1.amazonaws.com:9092 -replication-factor 1 --partitions 8 --topic clicks
```

## C. Adding partitions for a specific topic

```
sudo /usr/local/kafka/bin/kafka-topics.sh --alter --bootstrap-server ec2-44-223-22-176.compute-1.amazonaws.com:9092 --partitions 10 --topic clicks
```

## D. Deleting one topic

```
sudo /usr/local/kafka/bin/kafka-topics.sh --delete --bootstrap-server ec2-44-223-22-176.compute-1.amazonaws.com:9092 --topic clicks
```

## E. Listing the count of partitions for a specific topic

```
/usr/local/kafka/bin/kafka-topics.sh --describe --bootstrap-server ec2-44-223-22-176.compute-1.amazonaws.com:9092 --topic clicks
```

## F. Producing messages to a specific topic with multiple partitions

```
/usr/local/kafka/bin/kafka-console-producer.sh --broker-list ec2-44-223-22-176.compute-1.amazonaws.com:9092 --topic clicks
```

## G. Consuming messages from a topic with multiple partitions

```
/usr/local/kafka/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic selledProductByCustomer --from-beginning
```

## H. Listing the consumer groups

```
sudo /usr/local/kafka/bin/kafka-consumer-groups.sh --bootstrap-server ec2-44-223-22-176.compute-1.amazonaws.com:9092 -list
```

## I. Listing the consumer-ids from a specific consumer group

```
sudo /usr/local/kafka/bin/kafka-consumer-groups.sh --bootstrap-server ec2-44-223-22-176.compute-1.amazonaws.com:9092 -describe -group console-consumer-<consumer_id>
```
