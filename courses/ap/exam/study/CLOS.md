# Common Lisp Object System (CLOS) <!-- omit in toc -->

<details>
<summary>Table of Contents</summary>

- [Multiple Dispatch](#multiple-dispatch)
  - [Generic Functions](#generic-functions)
  - [Promotion](#promotion)
  - [Instance Specialization](#instance-specialization)
  - [Method Combination](#method-combination)
- [Classes](#classes)
  - [Multiple Dispatch](#multiple-dispatch-1)
  - [Slots](#slots)
  - [Mixins](#mixins)
  - [Class Inheritance / Meta Classes](#class-inheritance--meta-classes)
  - [Dynamic Objects](#dynamic-objects)

</details>

<br>

> Antes de ler este ficheiro convém saber uns [conceitos básicos de Common Lisp](CommonLisp.md)


## Multiple Dispatch

### Generic Functions

Ao contrário de [Java](Reflection__java.md), o Common List **permite** [multiple dispatch](Reflection__concepts.md#multiple-dispatch), uma vez que permite definir funções genéricas.

<details>
<summary>Exemplo - função add:</summary>

```lisp
;; Começar por definir a função genérica
(defgeneric add (x y))

;; Somar números
;; (add 1 2) -> 3
(defmethod add ((x number) (y number))
  (+ x y)
)

;; Somar lists
;; (add '(1 2 3) '(4 5 6)) -> (5 7 9)
(defmethod add ((x list) (y list))
  (mapcar #'add x y)
)

;; Somar list com número
;; (add '(1 2) 3) -> (4 5)
(defmethod add ((x list) (y number))
  (add x (make-list (length x) :initial-element y))
)

;; Somar qualquer coisa com list
;; `t` representa qualquer tipo
;; (add 3 '(1 2)) -> (4 5)
(defmethod add ((x t) (y list))
  (add (make-list (length y) :initial-element x) y)
)

;; Somar vectores
;; (add #(1 2 3) #(4 5 6)) -> #(5 7 9)
(defmethod add ((x vector) (y vector))
  (map 'vector #'add x y)
)

;; Somar vectores com número
;; (add #(1 2 3) 4) -> #(5 6 7)
(defmethod add ((x vector) (y number))
  (add x (make-array (list (length x)) :initial-element y))
)

```
</details>

### Promotion

Como dá para ver no exemplo era bué chato repetir isto para todas as funções como subtract, multiply, divide, etc.

Para evitar isso usamos o `promote` que ajusta os tipos dos argumentos para que sejam do mesmo tipo.

<details>
<summary>Exemplo - função add com promote:</summary>

```lisp
;; Definir a função `promoting-call` que faz promote dos argumentos
(defun promoting-call (f x y)
    (multiple-value-bind (xp yp)
            (promote x y)
        (funcall f xp yp)
    )
)

;; Definir a função genérica promote
(defgeneric promote (x y)
    (:method ((x t) (y t))
        (error "No promotion for args (~S ~S) of classes (~S ~S)"
            x y
            (class-name (class-of x))
            (class-name (class-of y))
        )
    )
)

;; Definir as funções do promote
(defmethod promote ((x list) (y t))
    (values x (make-list (length x) :initial-element y))
)

(defmethod promote ((x t) (y list))
    (values (make-list (length y) :initial-element x) y)
)

(defmethod promote ((x vector) (y t))
    (values x (make-array (list (length x)) :initial-element y))
)

(defmethod promote ((x t) (y vector))
    (values (make-array (list (length y)) :initial-element x) y)
)

(defmethod promote ((x vector) (y list))
    (values x (coerce y 'vector))
)

(defmethod promote ((x list) (y vector))
    (values x (coerce y 'list))
)


;; Alterar a função genérica add para usar a promoting-call
(defgeneric add (x y)
    (:method ((x t) (y t))
        (promoting-call #'add x y)
    )
)

;; Definir apenas os métodos com argumentos do mesmo tipo
(defmethod add ((x number) (y number)) ...)
(defmethod add ((x list) (y list)) ...)
(defmethod add ((x vector) (y vector)) ...)

;; Depois podemos fazer a mesma cena para o subtract e outras funções
(defgeneric subtract (x y)
    (:method ((x t) (y t))
        (promoting-call #'subtract x y)
    )
)
(defmethod subtract ((x number) (y number)) ...)
(defmethod subtract ((x list) (y list)) ...)
(defmethod subtract ((x vector) (y vector)) ...)
```

</details>

### Instance Specialization

Também podemos distinguir funções pelas intâncias dos argumentos.

<details>
<summary>Exemplo - fact:</summary>

```lisp
(defgeneric fact (n))

(defmethod fact ((n integer))
    (* n (fact (1- n))))

(defmethod fact ((n (eql 0)))
    1)
```
</details>


> TODO: missing a memoization again - slide 100 até ao slide 106

### Method Combination

O Common Lisp tem um sistema de combinação de métodos que permite combinar vários métodos para uma função genérica utilizando as funções `:before`, `:after` e `:around`.

Os métodos com os símbolos `:before`, `:after` e `:around` são chamados **auxiliary methods** enquanto que os métodos normais são chamados **primary methods**.

<details>
<summary>Exemplo - método combination:</summary>

Tendo em conta a hierarquia dos tipos dos numeros:

<img src="Images/hierarchy numbers.png">

```lisp
(defgeneric explain (entity)
    (:method ((entity fixnum)) (format t "~S is a fixnum" entity))
    (:method ((entity rational)) (format t "~S is a rational" entity))
    (:method ((entity string)) (format t "~S is a string" entity))
)

(defmethod explain :after ((entity integer))
    (format t " (in binary, is ~B)" entity)
)

(defmethod explain :before ((entity number))
    (format t "The number ")
)

```

irá imprimir:

```lisp
> (explain 123)
The number 123 is a fixnum (in binary, is 1111011)
> (explain "Hi")
"Hi" is a string
> (explain 1/3)
The number 1/3 is a rational
```
</details>

> TODO: Saltei o pão do slide 128 até ao 168 porque está a explicar o que já tinha sido explicado das precedencias dos métodos e tal.
> Acho que a única coisa importante de reter é que ele começa sempre pelo mais espcífico e vai andando até o método não ter o `call-next-method`

> TODO: missing tudo das classes porque chato para caralho

## Classes

### Multiple Dispatch

TODO

### Slots

TODO

### Mixins

TODO

### Class Inheritance / Meta Classes

TODO

Basicamente é quando uma classe pode herdar características (atributos e métodos) de mais de uma classe base.

Diria que está explicado a partir do 214 dos CLOS slides.

### Dynamic Objects

TODO