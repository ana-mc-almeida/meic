# Notes Problem Class 9 <!-- omit in toc -->

<details>
<summary>Tabel of Contents</summary>

- [Functionalities](#functionalities)
  - [Main functionality](#main-functionality)
  - [Constraints](#constraints)
- [Qualities](#qualities)
  - [Performance](#performance)
    - [P1:](#p1)
    - [P2:](#p2)
  - [Integrability](#integrability)
    - [I1:](#i1)
    - [I2:](#i2)
  - [Modifiability](#modifiability)
    - [M1: (Scalability)](#m1-scalability)
  - [Availability](#availability)
    - [A2:](#a2)
  - [Security](#security)
    - [S1:](#s1)
    - [S2:](#s2)
- [Context](#context)

</details>


## Functionalities

- **Notifications**: Product updates, etc
- **Notifications format**: SMS, push, email 
- **Device types**: iOS, Android and Laptop
- **Actors**: client applications, schedulers
- OPT-OUT functionality
- **Actor**: APNS, FCM, SMS service, email service
- Store device tokens
- **Output**: Payload
- Signup functionality
- Repository persistent (structure): device tokens, email, phone, notifications, settings, etc
- Notification API
- Verify user info in sign up

### Main functionality

- OPT-OUT
- User register
- Send notificaation **(most important)**

A client application sends a notification text to its subscribers devices (iOS, Android, Laptop/Desktop) according to the respective format (push, SMS, email)

### Constraints

- The notification delivery to the devices is done through intermediate third party services: APM, FCM, SMS service and email service.
- The push communication is done using the device tokens.

## Qualities

- **Scalability** (the same as modifiability)
- **Performance**:
  - Normal operation & Peak load (during peak load limit event response)
  - **Throughput**: (10M push + 1M SMS + 5M emails) / per day 
    - It means I need to have 10x more resources for push than for SMS, to achieve same latency
- **Modifiability**: 
  - Add and remove third party services during **runtime**.
    - this could also be integrability because it is about external systems
  - Adding a new third party service during **design time**.
- **Availability**:
  - Crash notification system.
  - Crash thrid party service
    - send at least one notification to the user
- **Modifiability**:
  - Increase in number of notifications per device type
  - Increase in number of users
- **Performance** - bottlenecks: Payload generation, syncrhonous send of notifications over internet
- **Security**: spam


### Performance

Fazem-se dois scenarios para performance, um para normal operation e outro para peak load.

#### P1:
- **Source:** Client application
- **Stimulus:** Send notification -> Periodic
- **Artifact:** Notification system
- **Environment:** Normal mode
- **Response:** Notification is delivered
- **Response measure:**
  - **Throughput:** 120 Push/s, 12 SMS/s, 60 email/s
  - **Latency:** 1 minute on average

#### P2:
- **Source:** Client application
- **Stimulus:** Send notification -> Stochastic
- **Artifact:** Notification system
- **Environment:** Peak load
- **Response:** Notification is delivered
- **Response measure:**
  - **Throughput:** 240 Push/s, 24 SMS/s, 120 email/s
  - **Latency:** 5 minutes on average

### Integrability

#### I1:
- **Source:** Third-party service vendor
- **Stimulus:** Integrate new version of third party service.
- **Artifact:** Notification system and Third party service.
- **Environment:** Runtime
- **Response:** Components are correctly exchanging information.
- **Response measure:** cost 0, some performance overhead. Arround 5 minutes to recover.

#### I2:
- **Source:** Government (In China you cant use FCM for android for example)
- **Stimulus:** Add new type of third-party of existing device type.
- **Artifact:** Notification system and Third party service.
- **Environment:** Integration for same API, Development for different API's
- **Response:** Components are correctly exchanging information.
- **Response measure:** Considering the development case we would need to change the notification system to connect with the new third-party service API. 2 month effort.

### Modifiability

#### M1: (Scalability)
- **Stimulus:** Change the number of notifications for a particular device.

### Availability

#### A2:
- **Stimulus:** Third-party service crash
- **Response:** Notifications are stored and retried.
- **Response measure:** at least once.

### Security

#### S1:
- **Stimulus:** send spam notifications
- **Response:** spam is detected and avoided.
- **Response measure:** detected after 5 notifications.

#### S2:
- **Stimulus:** Send a notification for a non-subscriber
- **Response:** Stop it. The notification should be registered in the send notification phase and not in the register phase.

## Context

- Notification system
- User receives notifications
- Device types: iOS, Android and Laptop
- Actors: client applications
- Third-party services
