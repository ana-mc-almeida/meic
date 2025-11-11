# Notes Lecture 01: Introduction to Multi-Agent Systems <!-- omit in toc -->

<details>
<summary> Table of Contents </summary>

- [Motivation](#motivation)
  - [Ongoing Trends](#ongoing-trends)
    - [Ubiquity](#ubiquity)
    - [Interconnection](#interconnection)
    - [Inteligence](#inteligence)
    - [Delegation](#delegation)
    - [Human-orientation](#human-orientation)
- [Definitions](#definitions)
  - [Agent](#agent)
    - [Simple agents](#simple-agents)
    - [Inteligent Agents](#inteligent-agents)
      - [Reactive](#reactive)
      - [Pro-active](#pro-active)
      - [Social](#social)
    - [Agents Properties](#agents-properties)
      - [Coordination](#coordination)
      - [Cooperation](#cooperation)
      - [Negotiation](#negotiation)
      - [Autonomy](#autonomy)
      - [Adaptivity](#adaptivity)
      - [Rationality](#rationality)
      - [Curiosity](#curiosity)
      - [Believability](#believability)
      - [Mobility](#mobility)
    - [Applications](#applications)
  - [Environment](#environment)
    - [Environment Properties](#environment-properties)
      - [Accessible](#accessible)
      - [Deterministic](#deterministic)
      - [Static](#static)
      - [Discreate](#discreate)
      - [Episodic](#episodic)
  - [Multi-agent Systems](#multi-agent-systems)

</details>

## Motivation

### Ongoing Trends

#### Ubiquity

Have tecnology everywhere (cars, fridges, etc)

#### Interconnection

Systems talking with systems instead of only standing alone (internet, phones, etc)

#### Inteligence

They are just smart ig (chatGPT)

#### Delegation

Allow to be the tecnology to do stuff for us (kitchen robots, cars drivers, etc)

#### Human-orientation

Nowladays we don't have to write low code anymore.

## Definitions

### Agent

System that can act autonomously.

This means that an agent it's able to figure out what to do in order to achieve it's goal without constantly being told what to do.

An agent interacts with the enviroment in a sequence of `sense-decide-act-sense-decide-act-sense-etc`

#### Simple agents

Trivial from a decision-making prespective.

Examples: screen-saver or thermostat

#### Inteligent Agents

##### Reactive

An agent that respondes to changes in the environmnet.

`stimulus -> response rule`

##### Pro-active

Takes initiative and attempts to achieve goals

##### Social

Agent has the ability to **cooperate**, **cordinate** and **negotiate** with other agents (and possibly humans)

#### Agents Properties

##### Coordination

Managing interdependencies between activities.

Example: a non-sharable resource in the enviroment needs to have it's use coordinated

##### Cooperation

Working together to achieve a shared goal

##### Negotiation

Trying to reach agreemnents

##### Autonomy

Act independently

##### Adaptivity

Learn from experience to better interact with an environment

##### Rationality

Act in a way that maximizes something

##### Curiosity

Engage creative, imaginative or inquisitive reasoning

##### Believability

Create a suspension of disbelief, leading a user ti accept the agent as an alive or real character

##### Mobility

Change it's location in the environment

#### Applications

Agents can exist in:

- Physical space: robots
- Cyberspace: software and interface agents
- Simulated physical space: traffic simulators
- Hybrid: virtual agents interacting with humans

### Environment

An agent interacts with an environment using **perceptors** (sensor inputs) and **effetores** (action outputs)

#### Environment Properties

##### Accessible

If an agent can obtain complete and accurate data about the enviroment state.

Most environments are **inaccessible**

##### Deterministic

If an action has a single guaranteed effect

##### Static

If the environmet does _not_ change during the agents deliberating

In contrast, if the environment _does_ change, it's called **dynamic**

##### Discreate

If there are an fixed number or possible actions

Otherwise, it's called **continuos**

##### Episodic

If the world can be divided in different intervals where one episode has no influence on the others.

### Multi-agent Systems

Set of [agents](#agent) that interact with one another.

The agens must **cooperate**, **coordinate** and **negotiate** with each other.
