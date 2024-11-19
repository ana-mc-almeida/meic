# Material Summary: Back-of-the-Envelope Estimation (SDI1) <!-- omit in toc -->

> This file summarizes the Chapter 2 of [SDI1](https://drive.google.com/file/d/1vQ4NP1zXIjR7OsQ2arEK-qbDIvu3PxRB/view?usp=drive_link).

<details>
<summary>Table of Contents</summary>

- [What is Back-of-the-Envelope Estimation?](#what-is-back-of-the-envelope-estimation)
- [Power of 2](#power-of-2)
- [Latency Numbers Every Programmer Should Know](#latency-numbers-every-programmer-should-know)
- [Availability Numbers](#availability-numbers)
- [Example](#example)
  - [Some tips](#some-tips)

</details>

## What is Back-of-the-Envelope Estimation?

The back-of-the-envelope estimation is a technique used to make quick calculations to estimate the **system capacity** or **performance requirements**.

It's very common used in interviews to test the candidate's ability to estimate the capacity of a system.

To carry out a good back-of-the-envolope estimation, the following concepts are important:
- Power of 2
- Latency Numbers Every Programmer Should Know
- Availability Numbers

## Power of 2

To know the data volume of a system, it is important to know the power of 2.

- A byte is a sequence of 8 bits.
- An ASCII character is 1 byte.

| Power of 2 | Value | Short Name | Full Name |
| ---------- | ----: | ---------- | --------- |
| 2^0        | 1     | 1B         | 1 Byte   |
| 2^10       | 1024  | 1KB        | 1 Kilobyte |
| 2^20       | 1,048,576 | 1MB    | 1 Megabyte |
| 2^30       | 1,073,741,824 | 1GB | 1 Gigabyte |
| 2^40       | 1,099,511,627,776 | 1TB | 1 Terabyte |
| 2^50       | 1,125,899,906,842,624 | 1PB | 1 Petabyte |

## Latency Numbers Every Programmer Should Know

Literally you should know these numbers by heart. They are important to understand the performance of a system.

| Operation                              | Time (ns)       | Time (µs) | Time (ms) 
|---------------------------------------:|-----------------|-----------|-----------
| L1 cache reference                     | 0.5             | -         | -         
| Branch mispredict                      | 5               | -         | -         
| L2 cache reference                     | 7               | -         | -         
| Mutex lock/unlock                      | 100             | -         | -         
| Main memory reference                  | 100             | -         | -         
| Compress 1K bytes with Zippy           | 10,000          | 10        | -         
| Send 2K bytes over 1 Gbps network      | 20,000          | 20        | -         
| Read 1 MB sequentially from memory     | 250,000         | 250       | -         
| Round trip within same datacenter      | 500,000         | 500       | 0.5       
| Disk seek                              | 10,000,000      | 10,000    | 10        
| Read 1 MB sequentially from network    | 10,000,000      | 10,000    | 10        
| Read 1 MB sequentially from disk       | 30,000,000      | 30,000    | 30        
| Send packet CA->Netherlands->CA        | 150,000,000     | 150,000   | 150       

> This values may be outdated as computer systems evolve.

```
ns = nanosecond = 10^-9 seconds
µs = microsecond = 10^-6 seconds = 1000 ns
ms = millisecond = 10^-3 seconds = 1000 µs = 1,000,000 ns
```

Some conlusions from these numbers:
- Disk operations are slow.
- Try to avoid disk seeks.
- If possible, compress data before sending it over the network.
- It takes time do send data over the network.

## Availability Numbers

Availability is the probability that a system is operational at a given time and its given in percentage.  
100% availability means the system is always operational.

The uptime is measure with the **number of nines**:

Availability | Downtime per day  | Downtime per year | Downtime per year (complete) | Downtime per day (complete) |
-------------|-------------------|-------------------|------------------------------|-----------------------------|
99%          | 14.40 minutes     | 3.65 days         | 3 days 15 hours 36 minutes   | 14 minutes 24 seconds       |
99.9%        | 1.44 minutes      | 8.77 hours        | 8 hours 45 minutes 36 seconds| 1 minute 26.4 seconds       |
99.99%       | 8.64 seconds      | 52.60 minutes     | 52 minutes 33.6 seconds      | 8.64 seconds                |
99.999%      | 0.86 seconds = 864.00 miliseconds | 5.26 minutes | 5 minutes 15.36 seconds | 0.864 seconds = 864.00 miliseconds |
99.9999%     | 0.086 seconds = 86.40 miliseconds | 31.56 seconds | 31 seconds 33.6 miliseconds | 0.0864 seconds = 86.40 miliseconds |

## Example

Calculate the media storage for Twitter with these assumptions:
- 300 million users per month.
- 50% of the users use Twitter daily.
- On average, a user tweets 2 times a day.
- 10% of the tweets have media attached.
- The data is stored for 5 years.



1. Calculate the Queries per Second (QPS) for the media storage:
  1. Daily active users: 300 million * 50% = 150 million users
  2. Tweets per day: 150 million users * 2 tweets = 300 million tweets
  3. Tweets per second: 300 million tweets / 24 hours / 3600 seconds = 3,472.22 = ~3,500 tweets per second
  4. Peek QPS: 2 * QPS = 7,000
2. Average Tweet Size:
   1. tweet_id: 64 Bytes (64 characters)
   2. text: 140 Bytes (140 characters)
   3. media: 1 MB
3. Media Storage per day:
   1. 300 million tweets * 10% * 1 MB = 30 TB per day
4. 5 years of storage:
   1. 30 TB * 365 days * 5 years = 54,750 TB = 54.75 PB = ~55 PB

### Some tips

- It's ok to round numbers to make the calculations easier.
- Always write down the assumptions.
- Don't forget to label the units.