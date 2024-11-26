# Material Summary: Security <!-- omit in toc -->

<details>
<summary>Table of Contents</summary>

- [Security General Scenarios](#security-general-scenarios)
- [Security Tactics](#security-tactics)
  - [Detect Attacks](#detect-attacks)
  - [Resist Attacks](#resist-attacks)
  - [React to Attacks](#react-to-attacks)
  - [Recover from Attacks](#recover-from-attacks)


</details>

<br>

Security can be characterized by this 3 properties (CIA):
- **Confidentiality**: Ensuring that information is only accessible to those who are authorized to have access.
- **Integrity**: Ensuring that information is not altered by unauthorized means.
- **Availability**: Ensuring that information is available when needed.

## Security General Scenarios

Portion of Scenario | Description | Example
------------------- | ----------- | -------
**Source** | Who is the attacker | External attacker, internal attacker, etc.
**Stimulus** | What is the attack | Unauthorized access, unauthorized modification, etc.
**Artifact** | What is the target of the attack | Data, software, hardware, etc.
**Environment** | What is the state of the system when the attack occurs | Normal operation, maintenance, etc.
**Response** | What is the response to the attack? Does it garantee the CIA properties? | 
**Response Measure** | What is the measure of the response? | How much time does it take to detect the attack? How much time does it take to recover from the attack? etc

## Security Tactics

### Detect Attacks

- **Detect intrusions**: TODO
- **Detect service denial**: TODO
- **Verify message integrity**: TODO
- **Detect message delivery anomalies**: TODO

### Resist Attacks

- **Identify actors**: TODO
- **Authenticate actors**: TODO
- **Authorize actors**: TODO
- **Limit access**: TODO
- **Limit data exposure**: TODO
- **Encrypt data**: TODO
- **Separate entities**: TODO
- **Validate input**: TODO
- **Change credentials**: TODO

### React to Attacks

- **Revoke access**: TODO
- **Restrict login**: TODO
- **Inform actors**: TODO

### Recover from Attacks

- [Availability Tactics](5_summary.md)
- **Audit**: Keep records of the user's actions, system's actions, etc.
- **Non-repudiation**: Ensure that the user cannot deny the actions he/she has taken.