# Material Summary: Back-of-the-Envelope Estimation (SAiP) <!-- omit in toc -->

> This file summarizes the Chapter 4 of [SAiP](https://drive.google.com/file/d/1d-dC03FWPuhMSR0YGsQ0IFAYFE9DTQPk/view?usp=drive_link)

<details>
<summary>Table of Contents</summary>

</details>

## Availaility

Availability is the probability that a system is operational at a given point in time.

It's close but differs from:
- **Reliability**: is the probability that a system will operate correctly for a given time interval. This mean that availability adds the notion of recover from failures to the concept of reliability.
- **Robustness or Resilient**: is the ability of a system to continue operating despite the presence of faults. It can masks or repair them. (check the difference between [failure and fault](#failure-vs-fault))
- **Security**: is the ability of a system to protect itself from malicious attacks.
- **Performance**
- **Safety**: limits the consequences of a failure.

### Failure vs Fault

- **Failure**: Deviation of a system from its expected behavior.
- **Fault**: A condition that causes a system to fail.
- **Error**: State between the fault and the failure.

We say that a systems has failured if it observed by a user.  
However, if a failure **could have been observed**, it is a failure, whether it was observed or not.

## Availability General Scenario

Portion of Scenario | Description | Possible Values
------------------- | ----------- | ---------------
**Source** | Specifies where the fault comes from | Hardware, Software, Environment, Human
**Stimulus** | The stimulus to an availability scenario is a fault | Fault: omission, crash, incorrect timing, incorrect response
**Artifact** | The artifact that is affected by the fault | Processors, communication channels, storage devices, etc
**Environment** | The environment in which the artifact operates. <br> Can also be interesting to know how the system behaves in other situations other than the normal one | Normal, startup, shutdown, repair mode, degraded operation, overload operation
**Response** | The desired system response to the fault | Prevent the fault <br> Detect the fault <br> - Log the fault <br> - Notify entities (people or systems) <br>- Recover from the fault <br> - Be temporarily unavailable <br> - etc.
**Response Measure** | The measure of the response | Time to detect, time to recover, time to notify, etc.

## Tactics for Availability

Check this in the [Lecture 5 Material Summary](./5_summary.md).