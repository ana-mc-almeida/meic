# Reflection - Concepts <!-- omit in toc -->


**Table of contents:**
- [Computational Systems](#computational-systems)
  - [Computational Meta-System](#computational-meta-system)
- [Reflection](#reflection)
  - [Introspection](#introspection)
  - [Intercession](#intercession)
- [Reification](#reification)
  - [Structural Reification](#structural-reification)
  - [Behavioral Reification](#behavioral-reification)
- [Dispatch](#dispatch)
  - [Dynamic Dispatch](#dynamic-dispatch)
  - [Static Dispatch](#static-dispatch)
  - [Single Dispatch](#single-dispatch)
  - [Multiple Dispatch](#multiple-dispatch)


## Computational Systems

Um sistema que raciocina e age conforme um dado domínio.

Este domínio é composto pelas estruturas internas do sistema:
- Dados: entidades e relações
- Programas que manipulam esses dados
    - Um programa não é um sistema computacional enquanto que um programa a correr (running program) já o é, uma vez que o programa em si é só parte do sistema.

### Computational Meta-System

Um sistema computacional que tem como domínio outro sistema computacional.

A este sistema computacional que serve de domínio chamamos de _Object System_.

Exemplos de sistemas meta-computacionais:
- Debugger
- Profiler - ferramenta que analisa o desempenho de um programa
- Um compilador não é um sistema meta-computacional, uma vez que o seu domínio é um programa que por sua vez é só parte de um sistema computacional e não o sistema em si.

> De forma bastante simplificada, um computational meta-system é um sistema que reasons and acts about an running program.

## Reflection

Check the [Reflection introduction file](Reflection__introduction.md#reflection).

There are 2 levels of reflection:

### Introspection

Check the [Reflection introduction file](Reflection__introduction.md#introspection)

### Intercession

Check the [Reflection introduction file](Reflection__introduction.md#intercession)

## Reification

Check the [Reflection introduction file](Reflection__introduction.md#reification)

There are 2 levels of reification: 

### Structural Reification

Check the [Reflection introduction file](Reflection__introduction.md#structural-reification)

### Behavioral Reification

Check the [Reflection introduction file](Reflection__introduction.md#behavioral-reification)

## Dispatch

Estas explicações curtas podem ser melhor percebidas com o [exemplo em Java](Reflection__java.md#dispatch-em-java)

### Dynamic Dispatch

É o processo de escolher a implementação de um método **em runtime**.

### Static Dispatch

É o processo de escolher a implementação de um método **ao compilar**.

### Single Dispatch

A função chamada depende do **objeto que a chamou**.

### Multiple Dispatch

Quando a função chamada depende do **tipo de dois ou mais argumentos**.