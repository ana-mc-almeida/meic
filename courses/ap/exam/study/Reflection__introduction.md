# Reflection - Introduction <!-- omit in toc -->

<details>
<summary>Table of Contents</summary>

- [Reflection](#reflection)
  - [Reflection Systems](#reflection-systems)
  - [Introspection](#introspection)
  - [Intercession](#intercession)
- [Reification](#reification)
  - [Structural Reification](#structural-reification)
  - [Behavioral Reification](#behavioral-reification)

</details>

<br>

> Antes de ler isto, convém perceberes alguns [reflection concepts](Reflection__concepts.md).

## Reflection

É o processo de raciocinar e agir sobre si próprio.

### Reflection Systems

É um sistema que consegue alterar a sua própria estrutura e comportamento enquanto está a correr.

Isto é, um meta-system que se tem a si próprio como domínio (object system).

> Há dois níveis de reflection: [introspetion](#introspection) e [intercession](#intercession)

### Introspection

Habilidade do próprio programa **ver** a sua própria estrutura interna e comportamento.

Exemplo: quantos parâmetros é que a função `foo` tem?

### Intercession

Habilidade do próprio programa **alterar** a sua própria estrutura interna e comportamento.

Exemplo: alterar a class esta instância para `Bar`

## Reification

Criação de uma entidade que representa, no meta-system, uma entidade do object system.

Exemplos:
- Reification de classes: qual é a classe desta instância?
- Reification de métodos: quais são os métodos desta classe?
- Reification da stack: quais foram os métodos que foram chamados que causaram este bug?
- Reification do lexical environment: quais são os valores das variavies desta função?

> A reification é uma pré-condição para a reflection.

Há dois níveis de reification: [structural reification](#structural-reification) e [behavioral reification](#behavioral-reification)

### Structural Reification

Habilidade do systema de reify a sua própria **estrutura**.

Exemplo: Quais são as instancias das variaveis desta classe?

### Behavioral Reification

Habilidade do systema de reify a sua própria **execução**.

Exemplo: Quais são os _error handlers_ disponiveis neste momento?

Nota: intercession é um tipo de behavioral reification. <!-- TODO: check if this is true -->

