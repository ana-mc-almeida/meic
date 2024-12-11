# Notes Problem Class 9 <!-- omit in toc -->

<details>
<summary>Tabel of Contents</summary>

- [Functionalities](#functionalities)
- [Qualities](#qualities)
- [Context](#context)

</details>


### Functionalities

- Notifications: Product updates, etc
- Notifications format: SMS, push, email 
- Device types: iOS, Android and Laptop
- Actors: client applications, schedulers
- OPT-OUT functionality
- Actor: APNS, FCM, SMS service, email service
- Store device tokens
- Output - Payload
- Signup functionality
- Repository persistent (structure): device tokens, email, phone, notifications, settings, etc
- Notification API
- Verify user info in sign up


### Qualities

- **Scalability** (the same as modifiability)
- **Performance**:
  - Normal operation & Peak load (during peak load limit event response)
  - **Throughput**: (10M push + 1M SMS + 5M emails) / per day 
    - It means I need to have 10x more resources for push than for SMS, to achieve same latency
- **Modifiability**: 
  - Add and remove third party services during runtime.
    - this could also be integrability because it is about external systems
  - Adding a new third party service during deisgn time.
- **Availability**:
  - Crash notification system.
  - Crash thrid party service
    - send at least one notification to the user
- **Modifiability**:
  - Increase in number of notifications per device type
  - Increase in number of users
- **Performance** - bottlenecks: Payload generation, syncrhonous send of notifications over internet
- **Security**: spam

### Context

- Notification system
- User receives notifications
- Device types: iOS, Android and Laptop
- Actors: client applications
- Third--party services
