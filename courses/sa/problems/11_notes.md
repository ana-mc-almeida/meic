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
- [Round 4:](#round-4)
- [Round 5:](#round-5)
- [Round 6:](#round-6)
- [Round 7:](#round-7)

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

## Round 4:
**Goal**: Have a scalable system  
**Attributes**: M1

## Round 5:
**Goal**: Robust communication with third-party services  
**Attributes**: A2

## Round 6:
**Goal**: Handle spam attacks  
**Attributes**: S1

## Round 7:
**Goal**: Have high avalability  
**Attributes**: A1


