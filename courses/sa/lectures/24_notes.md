# Notes Lecture 24 <!-- omit in toc -->

<details>
<summary>Table of Contents</summary>

- [Distributed Transactions](#distributed-transactions)
  - [Two-Phase Commit](#two-phase-commit)
  - [Try-Confirm/Cancel](#try-confirmcancel)
  - [Sagas](#sagas)
- [Event Sourcing](#event-sourcing)

</details>

<br>

- Microservices
- Distributed Transactions
  - Two-Phase Commit
    - Commit Protocol
  - Try-Confirm/Cancel
  - Sagas
- Event Sourcing

Audit = LOG

Use **Sharding** to allow 1.000.000 Transactions per second

## Distributed Transactions

### Two-Phase Commit

| --- | Do Operation | Prepare | Commit  |
| --- | --- | --- | --- |
A |
B |

**Problem**: Does not scale because of the locks (because there is isolation)

### Try-Confirm/Cancel

Concorrent

| --- | First | Second |
| --- | --- | --- |
A |
B |

The NOP for B in the first phase is to confirm that the account exists

**Problem:** 

### Sagas

Sequential

It's easier to sync

## Event Sourcing

Does not solve the problem of distributed transactions

