# Meta-Circular Evaluators - Concepts <!-- omit in toc -->

<details>
<summary>Table of Contents</summary>

- [Syntaxs for Assignments](#syntaxs-for-assignments)
  - [Concrete Syntax for Assigments](#concrete-syntax-for-assigments)
  - [Abstract Syntax for Assigments](#abstract-syntax-for-assigments)

</details>

## Syntaxs for Assignments

### Concrete Syntax for Assigments

<!-- explicar a diferença entre concrete syntax e abstract syntax -->
A concrete syntax é a forma como o código é escrito.

<details>
<summary>Examples:</summary>

```
a := b
a = b
a <- b
(set! a b)
```

</details>

### Abstract Syntax for Assigments

A abstract syntax é a forma como o código é representado internamente.

<details>
<summary>Examples:</summary>

```
(define (set? expression)
    (eq? (car expression) 'set!))
```
