# Notes - P8 cute <!-- omit in toc -->

<details>

<summary>Table of Contents</summary>

- [Apresentação](#apresentação)
  - [Cover slide](#cover-slide)
  - [Agenda](#agenda)
  - [2. What is the technical problem?](#2-what-is-the-technical-problem)
    - [2.1 Why is it hard? (motivation)](#21-why-is-it-hard-motivation)
    - [2.2 What are the previous solutions and why are they inadequate?](#22-what-are-the-previous-solutions-and-why-are-they-inadequate)
      - [Random testingAlém disso, quando o programa utiliza ponteiros, as expressões geradas podem tornar-se demasiado complexas ou até mesmo indecidíveis.](#random-testingalém-disso-quando-o-programa-utiliza-ponteiros-as-expressões-geradas-podem-tornar-se-demasiado-complexas-ou-até-mesmo-indecidíveis)
      - [Symbolic execution](#symbolic-execution)
    - [Concrete and symbolic execution](#concrete-and-symbolic-execution)
  - [3. What is the proposed solution?](#3-what-is-the-proposed-solution)
  - [4. What is the work's evaluation of the proposed solution?](#4-what-is-the-works-evaluation-of-the-proposed-solution)
  - [5. What are the contributions?](#5-what-are-the-contributions)
  - [Conclusão](#conclusão)

</details>

## Apresentação

### Cover slide

Olá nós somos o grupo 19 e hoje vimos falar sobre CUTE uma ferramenta que tem como objetivo a execução de unit tests de funções com inputs complexos como memory graphs.

O objetivo desta ferramenta é explorar de forma eficiente o maior número de caminhos de execução possíveis de uma função, para encontrar bugs e falhas.

### Agenda

Durante esta apresentação irei começar por falar vos sobre as soluções exististentes antes da criação deste paper.

De seguida, apresentaremos a solução proposta.

Passaremos para a sua implementação e avaliação experimental e, por fim, falaremos sobre algumas conclusões.

### 2. What is the technical problem?

#### 2.1 Why is it hard? (motivation)

Este é um trabalho díficil e as soluções anteriores são inadequadas por diversos motiovos, os quais passarei a explicar.

#### 2.2 What are the previous solutions and why are they inadequate?

##### Random testingAlém disso, quando o programa utiliza ponteiros, as expressões geradas podem tornar-se demasiado complexas ou até mesmo indecidíveis.

A primeira solução que irei falar é a testagem aleatória, que consiste na execução de testes unitários com valores de input escolhidos de forma aleatória entre os valores do domínio do input.

Esta abordagem é bastante ineficiente uma vez que, por um lado, gera valores que exploram os mesmos caminhos e, por outro, a probabilidade de serem selecionados valores que de facto exploram os caminhos onde os bugs estão é muito baixa.

##### Symbolic execution

A segunda solução é a execução simbólica, que consiste em executar o código com inputs simbólicos e gerar expressões lógicas que representam as condições de execução do código.

Esta abordagem é bastante eficiente para explorar todos os caminhos de execução do código, mas tem o problema de ser muito lenta e consumir muitos recursos computacionais, especialmente quando se trata de funções com muitos caminhos de execução ou com manipulação de estruturas de dados dinâmicas.

#### Concrete and symbolic execution

Passando para soluções que se assemelam mais à proposta deste paper, temos abordagens que misturam execução concreta com execução simbólica, ao que chamamos de concolic execution.

A primeira, proposta por **Larson and Austin approach** consistia em correr o programa com inputs concretos fornecidos pelo utilizador e, à medida que o programa era executado, restrições simbólicos iam sendo recolhidas.

Estas constraints podiam depois ser resolvidas para tentar identificar inputs alternativos que levassem a comportamentos problemáticos, mas, esta técnica não foi concebida para uma exploração sistemática de todos os caminhos possíveis do programa.

Com o benefício de ter mais cobertura de código do que apenas o random testing e sem os custos associados a uma execução simbólica completa, esta abordagem ainda assim não conseguia explorar todos os caminhos do programa de forma eficiente.

Outra abordagem, proposta por **Godefroid** e outros, era semelhante à de Larson and Austin, mas com uma diferença importante: após cada execução, uma das condições de execução era negada para forçar a próxima execução a seguir um caminho diferente, permitindo assim uma exploração mais completa dos caminhos do programa.

Contudo, esta abordagem revelou-se difícil de aplicar quando os inputs do programa são estruturas de dados complexas com ponteiros uma vez que não possui mecanismos para gerar ou representar corretamente grafos de memória.

### 3. What is the proposed solution?

> Tiago's part

### 4. What is the work's evaluation of the proposed solution?

> Rodrigo's part

### 5. What are the contributions?

> Rodrigo's part

### Conclusão

> Rodrigo's part
