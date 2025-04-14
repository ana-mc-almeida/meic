# Reflection In Java <!-- omit in toc -->

<details>
<summary>Table of Contents</summary>

- [Dispatch em Java](#dispatch-em-java)
  - [Double Dispatch](#double-dispatch)
    - [Desvantagens](#desvantagens)
  - [User defined method call mechanism](#user-defined-method-call-mechanism)

</details>

> Dei skip a como fazer introspection em Java porque não me parece relevante saber como programar em Java.

## Dispatch em Java

> Antes de ler isto, convém perceberes alguns [Dispatch Concepts](Reflection__concepts.md#dispatch)

Com `shapes` definidas como:
```java

class Shape {}

class Line extends Shape {}

class Circle extends Shape {}
```

A class `Device`:
```java
class Device {
    public void draw(Shape s) {
        System.err.println("draw what where?");
    }

    public void draw(Line l) {
        System.err.println("draw a line where?");
    }

    public void draw(Circle c) {
        System.err.println("draw a circle where?");
    }
}
```

A classes `Screen` que extende `Device`:
```java
class Screen extends Device {
    public void draw(Shape s) {
        System.err.println("draw what on screen?");
    }

    public void draw(Line l) {
        System.err.println("drawing a line on screen!");
    }

    public void draw(Circle c) {
        System.err.println("drawing a circle on screen!");
    }
}
```

E a class `Printer` que extende `Device`:
```java
class Printer extends Device {
    public void draw(Shape s) {
        System.err.println("draw what on printer?");
    }
    public void draw(Line l) {
        System.err.println("drawing a line on printer!");
    }
    public void draw(Circle c) {
        System.err.println("drawing a circle on printer!");
    }
}
``` 

Ao executarmos:

```java
Device[] devices = new Device[] { new Screen(), new Printer() };
Shape[] shapes = new Shape[] { new Line(), new Circle() };
for (Device device : devices) {
    for (Shape shape : shapes) {
        device.draw(shape);
    }
}
```

Obtemos:
```java
draw what on screen?
draw what on screen?
draw what on printer?
draw what on printer?
```

Porque o método chamado apenas depende do tipo do device e não do tipo do shape.

Isto acontece porque Java usa [dynamic dispatch](Reflection__concepts.md#dynamic-dispatch) para o receiver e [static dispatch](Reflection__concepts.md#static-dispatch) para os argumentos, o que significa que Java apenas suporta [single dispatch](Reflection__concepts.md#single-dispatch).

Se quisessemos implementar [multiple dispatch](Reflection__concepts.md#multiple-dispatch) em Java, teríamos de usar [double dispatch](Reflection__concepts.md#double-dispatch) ou definir um método que escolha o método que se adeque aos tipos mais "filhos" possíveis.

### Double Dispatch

Para implementar double dispatch em Java, começariamos por definir `Device` como uma classe abstract:
```java
abstract class Device {
    public abstract void draw(Shape s);
}
```

Para depois definir `Screen` como class que extende `Device` e que implementa o método draw com o receiver como `Shape`:
```java
class Screen extends Device {
    public void draw(Shape s) {
        s.draw(this);
    }
}
```

E o mesmo para a class `Printer`:
```java
class Printer extends Device {
    public void draw(Shape s) {
        s.draw(this);
    }
}
```

Por sua vez, a class `Shape` tem de ser definida como abstract e ter um método draw que recebe *cada um dos tipos de `Device`*:
```java
abstract class Shape {
    public abstract void draw(Screen s);
    public abstract void draw(Printer p);
}
```

Só depois é que podemos definir a classe `Line` que extende `Shape` e implementar o método draw para *cada um dos tipos de `Device`*:
```java
class Line extends Shape {
    public void draw(Screen s) {
        System.err.println("drawing a line on screen!");
    }

    public void draw(Printer p) {
        System.err.println("drawing a line on printer!");
    }
}
```

E o mesmo para a class `Circle`:
```java
class Circle extends Shape {
    public void draw(Screen s) {
        System.err.println("drawing a circle on screen!");
    }

    public void draw(Printer p) {
        System.err.println("drawing a circle on printer!");
    }
}
```

#### Desvantagens
- É relativamente fácil adicionar classes que extendam `Shape` mas para adicionar classes que extendam `Device` temos de adicionar métodos a `Shape` e a todas as classes que extendem `Shape`.
- Se fosse preciso fazer triple, quadruple ou n-ple dispatch, o número de combinações de metodos aumenta exponencialmente.

### User defined method call mechanism

> Cenas bué específicas de Java, ignorei mas tomem aí o código se estiverem interessados.

```java
class Device {
    public void draw(Shape s) {
        invoke(this, "draw", s);
    }

    static Object invoke(Object receiver, String name, Object arg) {
        try {
            Method method = bestMethod(receiver.getClass(), name, arg.getClass());
            return method.invoke(receiver, arg);
        } catch (NoSuchMethodException | IllegalAccessException | InvocationTargetException e) {
            throw new RuntimeException(e);
        }
    }

    static Method bestMethod(Class type, String name, Class argType) throws NoSuchMethodException {
        try {
            return type.getMethod(name, argType);
        } catch (NoSuchMethodException e) {
            if (argType == Object.class) {
                throw e;
            }
            else {
                return bestMethod(type, name, argType.getSuperclass());
            }
        }
    }

}
```