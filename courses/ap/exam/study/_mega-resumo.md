# Mega Resumo <!-- omit in toc -->

**Table of Contents:**
- [Reflection](#reflection)
    - [Introspection](#introspection)
    - [Intercession](#intercession)
  - [Reification](#reification)
    - [Structural Reification](#structural-reification)
    - [Behavioral Reification](#behavioral-reification)
  - [Memoization](#memoization)
  - [Javassist](#javassist)
  - [Multiple Dispatch](#multiple-dispatch)
    - [Static Dispatch](#static-dispatch)
    - [Dynamic Dispatch](#dynamic-dispatch)
  - [Single Dispatch](#single-dispatch)
    - [Double Dispatch](#double-dispatch)
- [CLOS - Common Lisp Object System](#clos---common-lisp-object-system)
  - [Generic Functions](#generic-functions)
      - [Promotion](#promotion)
      - [Instance Specialization](#instance-specialization)
    - [Methods](#methods)
    - [Method Combination](#method-combination)
      - [Effective Method](#effective-method)
      - [Standard Method Combination](#standard-method-combination)
        - [Primary Methods](#primary-methods)
        - [Auxiliary Methods](#auxiliary-methods)
      - [Simple Method Combination](#simple-method-combination)
      - [User-Defined Method Combination](#user-defined-method-combination)
  - [Classes](#classes)
    - [Slots](#slots)
    - [Mixins](#mixins)
    - [Class Inheritance](#class-inheritance)
    - [Meta Classes](#meta-classes)
  - [Dynamic Objects](#dynamic-objects)
- [Meta Circular Evaluator](#meta-circular-evaluator)
  - [Scopes](#scopes)
    - [Downwards Funarg Problem](#downwards-funarg-problem)
    - [Upwards Funarg Problem](#upwards-funarg-problem)
  - [Symbols](#symbols)
  - [Macro](#macro)
  - [Templates](#templates)
  - [Continuation](#continuation)
    - [Implicit Continuation - Direct Style](#implicit-continuation---direct-style)
    - [Explicit Continuation - Continuation Passing Style](#explicit-continuation---continuation-passing-style)
  - [Non-Deterministic Programs](#non-deterministic-programs)
- [Julia](#julia)
  - [Sintaxe](#sintaxe)

## Reflection

É o processo de raciocinar e agir sobre si próprio.

Há dois níveis de reflection: [introspetion](#introspection) e [intercession](#intercession)

#### Introspection

A habilidade do próprio programa **ver** a sua própria estrutura interna e comportamento.
- Exemplo: quantos parâmetros é que a função `foo` tem?

#### Intercession
A habilidade do próprio programa **alterar** a sua própria estrutura interna e comportamento.
- Exemplo: alterar a class esta instância para `Bar`

### Reification

A criação de uma entidade que representa, no meta-system, uma entidade do object system.

Pode-se criar entidades que representam Classes, Métodos, Variáveis, etc.

Há dois níveis de reification: [structural reification](#structural-reification) e [behavioral reification](#behavioral-reification)

#### Structural Reification

A habilidade do sistema de reify a sua própria **estrutura** (parte estática do sistema)
- Exemplo: qual é a classe desta instância?
- Exemplo: quais são os métodos desta classe?

#### Behavioral Reification
A habilidade do sistema de reify a sua própria **execução** (parte dinâmica do sistema)
- Exemplo: quais foram os métodos que foram chamados que causaram este bug?
- Exemplo: quais são os valores das variáveis desta função?

### Memoization

A técnica de armazenar o resultado de uma função para evitar cálculos repetidos.

- Exemplo: se a função `foo` for chamada com os mesmos parâmetros, o resultado é armazenado e não é necessário calcular novamente.
- Exemplo: para calcular a fib(5) iriamos precisar de calcular a fib(3) duas vezes: fib(5) = fib(4) + fib(3) = fib(3) + fib(2) + fib(3)

É uma má ideia aplicarmos memoization a funções que fazem chamadas externas ou que têm efeitos colaterais, uma vez que o resultado pode não ser o mesmo.

### Javassist

Javassist é uma biblioteca Java que permite modificar os ficheiros bytecode, permitindo assim intercession em **load time** ou **run time** - única forma de termos intersection em Java.

O código injetado utiliza um template de código (uma string) que é inserido no bytecode.
- Exemplo: adicionar um método a uma classe existente

### Multiple Dispatch

É o processo de escolher a implementação de um método com base no tipo de todos os argumentos.

#### Static Dispatch

É o processo de escolher a implementação de um método **ao compilar**.

#### Dynamic Dispatch

É o processo de escolher a implementação de um método **em runtime**.

### Single Dispatch

A função chamada depende apenas **objeto que a chamou**.

#### Double Dispatch

A função chamada depende do tipo em tempo de execução de **dois objetos**. 

Permite simular multiple dispatch em linguagens com single dispatch (como Java)

## CLOS - Common Lisp Object System

### Generic Functions

Uma generic function é uma função que pode ter várias implementações, dependendo do tipo dos argumentos com que é chamada - pensar como se fosse uma interface.

Exemplo: num plug-in de Minecraft, podemos ter uma generic function `interact` que pode ter várias implementações, dependendo da entidade com a qual estamos a interagir (um bloco, um jogador, um mob, etc).

##### Promotion

Ajusta os tipos dos argumentos para que sejam do mesmo tipo.
- Exemplo: se tivermos a receber um int e um float, o int é convertido para float.
- Exemplo: na função `interact`, se tivermos um jogador e um mob, o jogador é convertido para mob.

##### Instance Specialization

CommonLisp permite distinguir funções pelas instâncias dos argumentos, isto é, pelo valor dos argumentos.
- Exemplo: podemos ter uma implementação para quando o argumento é `0`, outra para quando o argumento é `1` e outra para os restantes valores.
- Exemplo: na função `interact`, podemos ter uma implementação para quando estamos a interagir com um bloco de terra, outra para quando estamos a interagir com um bloco de pedra e outra para os restantes blocos.

#### Methods

Um método é uma implementação de uma generic function para um conjunto específico de tipos de argumentos.
- Exemplo: `interact` pode ter um método para quando estamos a interagir com um bloco e outro para quando estamos a interagir com um jogador.

#### Method Combination

Quando multiplos métodos podem aplicar-se à mesma chamada de uma generic function.
- Exemplo: ao interagir com um bloco de terra, podemos ter um método que faz algo quando o bloco é de terra e outro para quando é qualquer bloco.

##### Effective Method

Resultado final da combinação de métodos.

##### Standard Method Combination

###### Primary Methods

São os métodos principais. O método mais específico é chamado (com base nos tipos dos argumentos), mas podem ser combinados com métodos auxiliares.

###### Auxiliary Methods

Complementam os métodos principais com:
- `:before` — Executados antes do método primário.
- `:after` — Executados depois do método primário.
- `:around` — Podem envolver completamente o método primário, podendo até decidir se ele deve ser chamado ou não (call-next-method).

##### Simple Method Combination

TODO

##### User-Defined Method Combination

TODO

### Classes

TODO

#### Slots

Atributos de uma classe.

#### Mixins

São classes que podem ser herdadas por outras classes, mas não podem ser instanciadas.

#### Class Inheritance

Classes podem herdar de mais do que uma classe, permitindo a reutilização de código e a criação de hierarquias de classes.

#### Meta Classes

Classes que definem o comportamento de outras classes.
- Exemplo: `class` é uma meta class que define o comportamento de todas as classes como `string`, `int`, etc.

### Dynamic Objects

Objetos que podem ser alterados em tempo de execução.
- Exemplo: podemos adicionar ou remover métodos a um objeto em tempo de execução.

## Meta Circular Evaluator

### Scopes

Scopes são o contexto em que uma variável é definida

#### Downwards Funarg Problem

Quando uma função é passada como argumento para outra função e tenta utilizar variaveis que foram definidas no seu scope original, mas que não estão disponíveis no scope da função que a chamou.

Assim, as dependencias *descem* para o scope da função que a chamou.
- Exemplo: se tivermos uma função `foo` que recebe uma função `bar` como argumento, e `bar` tenta aceder a uma variável que foi definida no scope de `foo`, mas não está disponível no scope de `bar`, teremos um downwards funarg problem.

#### Upwards Funarg Problem

Quando uma função é retornada como resultado de outra função e tenta utilizar variaveis que foram definidas no seu scope original, mas que não estão disponíveis no scope da função que a chamou.

Assim, as dependencias *sobem* para fora do scope onde estão as suas variaveis.

### Symbols

TODO

### Macro

Ao contrário de function calls, as macro calls não avaliam os argumentos e, ao invés disso, apenas avaliam o resultado.

É útil para short-circuit evaluation, isto é, quando não necessáriamente precisamos de avaliar todos os argumentos.
Exemplo: `and` e `or` são macros que não avaliam todos os argumentos, apenas o necessário.

### Templates

Templates são strings que podem ser utilizadas para gerar código em tempo de execução.
- Exemplo: podemos ter um template que gera código para uma função que recebe dois argumentos e retorna a soma deles.

Em lisp pode fazer-se com quotes, backquotes.

### Continuation

Uma continuation é uma representação do estado de execução de um programa em um determinado ponto.

Podemos manipular as continuations para alterar o fluxo de execução do programa.

#### Implicit Continuation - Direct Style

Cada chamada de função é seguida por uma chamada a outra função e o programa continua a execução normalmente.

#### Explicit Continuation - Continuation Passing Style

Passamos explicitamente a continuation como argumento para a função.
- Exemplo: `call/cc` é uma função que recebe uma continuation como argumento e a chama quando necessário.

### Non-Deterministic Programs

Programas que podem ter múltiplos resultados, dependendo do estado do programa.
- Exemplo: um programa que gera números aleatórios pode ter múltiplos resultados, dependendo do estado do gerador de números aleatórios.

Em lisp, utiliza-se `amb` e `fail` para representar a não-determinismo.
- `amb` é uma macro que representa uma escolha entre múltiplos resultados.
- `fail` é uma macro que representa uma falha na execução do programa.

Exemplo:
```lisp
(integer-starting-from (n) 
    (amb n (integer-starting-from (+ n 1)))
)

> (integer-starting-from 0)
0
> (integer-starting-from 1)
5
> fail
4
```

## Julia

### Sintaxe

Em comparação com python:

- `function foo(x::Int)` é o mesmo que `def foo(x: int)`.
- `if x == 1` é o mesmo que `if x == 1:` mas depois precisas de fazer `end` para fechar o if.