# Notes Problem Class 11 <!-- omit in toc -->

Continue to analize the [Notification System](./9_notes.md)

<details>
<summary> Table of Contents </summary>

- [Round 1:](#round-1)
  - [Iteration 1:](#iteration-1)
    - [Send notifcation - Code to send the notification](#send-notifcation---code-to-send-the-notification)
  - [Iteraction 2](#iteraction-2)
- [Round 2:](#round-2)
  - [Iteration 1:](#iteration-1-1)
  - [Iteration 2:](#iteration-2)
- [Round 3:](#round-3)
  - [Iteration 1](#iteration-1-2)
  - [Iteration 2](#iteration-2-1)
  - [Iteration 3](#iteration-3)
  - [Iteration 4](#iteration-4)
- [Round 4:](#round-4)
- [Round 5:](#round-5)
- [Round 6:](#round-6)
- [Round 7:](#round-7)
  - [Iteration 1](#iteration-1-3)
  - [Iteration 2](#iteration-2-2)

</details>

<br>

> Spam it's kinda of an availability attack
> 
> Availability must be the last attribute to be discussed

## Round 1: 
**Goal:** Fully functional system  
**Attributes:** F1, S2

### Iteration 1:
**Purpose**: Identify responsabilities

#### Send notifcation - Code to send the notification
- API: define API and the structure of the payload (not in the book)
- Process: receive the information
- Users: get users from information
- Generate: create the notifcation text
  - May be different for: Push, SMS, Email
- Devices: send the notification for each device
  - Must have one for each device: APN, FCM, SMS, Email

<br>

Process uses: (uses view)
- Users
- Generate
- Devices

### Iteraction 2
**Purpose:** Authentication and authorization

- Notification Database (repository):
  - Relational Database
  - User -1---*- Device
- Notification Web Server Supports Authentication and Authorization
  - Authorization is an **aspect** of process

## Round 2:
**Goal:** Support plug and unplug of third parties services and new third-party services  
**Attributes**: I1, I2

### Iteration 1:
**Purpose:** Integrate new version of third party service - I1

### Iteration 2:
**Purpose:** Add new type of third-party of existing device type - I2

- Devices splited into:
  - Common (_uses_ specific)
  - Specific
    - APN, FCM, SMS, Email


## Round 3:
**Goal**: Support normal mode and peak load performance  
**Attributes**: P1, P2

> Bottlenecks:
> - Generate payload
> - User database accesses
> - Communication with third-party services

### Iteration 1
**Purpose**: Support normal mode performance - P1

Solve **generate payload** bottleneck:
- Generator uses template

**Tactic:** increase efficiency

### Iteration 2
**Purpose**: Support normal mode performance - P1

Solve user database accesses bottleneck:
- Add notification user cache repository

**Tactic:** maintain multiple copies of data

### Iteration 3
**Purpose**: Support normal mode performance - P1

Solve communication with third-party services bottleneck:
- Add notification queue
  - Threads properties: process 200 notifications per second
  - Queue properties: size = 200 + ?

**Tactic:** introduce concurrency

### Iteration 4
**Purpose**: Support peak load performance - P2

**Tactic:** multiple copies of computation

Dinamicaly change because the performance is stochastic

## Round 4:
**Goal**: Have a scalable system  
**Attributes**: M1

- Increase number of instances of the notification web server
  - Allow several instances of the server modules
  - KAFKA queue

## Round 5:
**Goal**: Robust communication with third-party services  
**Attributes**: A2

**Task**: Retry

Add a notification log with **key value store** to garantee that the notification is sent **at least once**

1. Send notification from the queue
2. Register in the log
3. Remove from the queue
4. If the response is ok, add response to the log
5. Notifications that are in the log and don't have a response after 5 minutos, add to the queue again

## Round 6:
**Goal**: Handle spam attacks  
**Attributes**: S1

**Tactic**: Limit access

- Add module `Limit Access`
  - Add property to server: limit access OR
  - This module can be executed in the connector (request with limit access)

## Round 7:
**Goal**: Have high avalability  
**Attributes**: A1

### Iteration 1
- Database property: master / slave

### Iteration 2
- Add request store
  - Only return to the client after stor request

OR

- Add queue to requests

Use `request store` if want some preprocessing.

