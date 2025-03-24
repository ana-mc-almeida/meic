# Notes Pratical Class 14/03

- O stor vai dar upload dos slides de ontem

---

```
foo(A->A+1, X, Y)

IGUAL

foo(X,Y) DO A
    A = A + 1
END
```

Portanto

```
to_escape(BUM->...)

IGUAL

to_escape() DO BUM
    ...
END
```

We can do:
```
foo(F, X, Y) = 1 + F(42)

> to_escape() DO BUM
      1 + foo(BUM, 3,4)
  END
```

and this will return `42` (just like replace `BUM` with a `throw` in java)

---

`->` to create anonymous functions 

`=> ` to create a pair

---

Nossa função `error` deve extender a julia function `error` para lidar com outras coisas que não strings

type piracy

```
Base.Error(c::?) = ...
```

Dica: começar por implementar uma `myErrorFunction` e só mais no final do projeto é que passamos isso para uma extensão do `Error` de Julia