# Common Lisp Language <!-- omit in toc -->

<details>
<summary>Table of Contents</summary>

- [Function Definition - defun](#function-definition---defun)
- [Function Call](#function-call)
- [Print Function - symbol-function](#print-function---symbol-function)
- [Primeiro elemento da lista - car](#primeiro-elemento-da-lista---car)
- [Resto da lista - cdr](#resto-da-lista---cdr)
- [Set](#set)

</details>

## Function Definition - defun
```lisp
(defun foo(x)
  (+ x 3))
```

Will return
```lisp
foo
```

## Function Call
```lisp
(foo 2)
```
Will return
```lisp
5
```

## Print Function - symbol-function
```lisp
(symbol-function 'foo)
```
Will return
```lisp
(lambda (x) 
    (+ x 3))
```

## Primeiro elemento da lista - car
```lisp
(car (symbol-function 'foo))
```
Will return
```lisp
lamba
```

## Resto da lista - cdr
```lisp
(cdr (symbol-function 'foo))
```
Will return
```lisp
((x) (+ x 3))
```

<details>
<summary>Exemplos:</summary>

**Funcion Parameters - cadr**
```lisp
(cadr (symbol-function 'foo))
```
Will return
```lisp
(x)
```

<details>
<summary>Decomposição:</summary>

cadr = (car (cdr x))

Neste momento, a função foo é uma lista que contém o nome da função e os parâmetros.
```lisp
(lambda (x) (+ x 3))
```
1. 
```lisp
(cdr (symbol-function 'foo))
```
Will return
```lisp
((x) (+ x 3))
```
2. 
```lisp
(car (cdr (symbol-function 'foo)))
```
Will return
```lisp
(x)
```

---
</details>

**Called Function**
```lisp
(caaddr (symbol-function 'foo))
```
Will return
```lisp
(+)
```

<details>
<Summary>Decomposição:</Summary>

`caaddr = (car (car (cdr (cdr x))))`

Neste momento, a função foo é uma lista que contém o nome da função e os parâmetros.
```lisp
(lambda (x) (+ x 3))
```

1. 
```lisp
(cdr (symbol-function 'foo))
```
Will return
```lisp
((x) (+ x 3))
```

1. 
```lisp
(cdr (cdr (symbol-function 'foo)))
```
Will return
```lisp
(+ x 3)
```

1. 
```lisp
(car (cdr (cdr (symbol-function 'foo))))
```
Will return
```lisp
(+ x 3)
```

1. 
```lisp
(car (car (cdr (cdr (symbol-function 'foo)))))
```
Will return
```lisp
(+)
```
</details>

</details>

---

## Set

```lisp
(setcar (caddr (symbol-function 'foo)) -)
```

After this
```lisp
(foo 2)
```
Will return
```lisp
1
```

<details>
<summary>Decomposição:</summary>

`setcar = (set (car x) y)`

e

`caddr = (car (cdr (cdr x)))`

Neste momento, a função foo é uma lista que contém o nome da função e os parâmetros.
```lisp
(lambda (x) (+ x 3))
```
1. 
```lisp
(cdr (symbol-function 'foo))
```
Will return
```lisp
((x) (+ x 3))
```

2. 
```lisp
(cdr (cdr (symbol-function 'foo)))
```
Will return
```lisp
(+ x 3)
```
3. 
```lisp
(car (cdr (cdr (symbol-function 'foo))))
```
Will return
```lisp
(+)
```

</details>

<br>

> TODO: Missing backquote
> - `expr -> returns expr unevaluated except for subexpressions preceded by comma.
> - ,subexpr -> evaluates subexpr and inserts the value in the containing expression.
> - ,@subexpr -> evaluates subexpr and splices the value (a list) in the containing expression.
> Isto também existe em Julia. Vê o [ficheiro de Julia](Julia.md).
> Isto são os **templates** falados em [Meta-Circular Evaluators](MetaCircular.md).

---

# Other Sintaxs

## mapcar

TODO

## make-list 

Em especial tudo de `(add x (make-list (length x) :initial-element y)))`

## Tipo `t`

O tipo `t` é o supertipo de todos os tipos. Ou seja, pode ser qualquer tipo

## promote

O `promote` é uma função que converte um tipo para outro.

<details>
<summary>Exemplo:</summary>

```lisp
> (promote 1 1.5)
1.0
1.5

> (promote 1 '(1 2))
(1)
(1 2)
```
</details>