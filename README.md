classr
======

Class instances for rapid prototyping.

## Installation

```
require("devtools")
devtools::install_github("Rappster/classr")
require("classr")
```

## Regular S3 instances

```
## Default instance "body" //
res <- createInstance("TestClass")
res

ls(res)
class(res)

## Explicit object as instance "body" //
res <- createInstance("TestClass", input = list(x = TRUE))
res 

## Strict //
try(createInstance("TestClass", strict = TRUE))
``` 

## R6 instances


### Default input

This is ideal for rapid prototyping. All list elements are mapped to publicly available fields.

```
inst <- createR6Instance(input = list(x = 1, y = 2))
inst
inst$x
inst$y
```

### Special input format

For more fine control over the class structure.

```
input <- list(
  public = list(x = 10, foo = function() private$bar()),
  private = list(bar = function() "Hello World!"),
  active = list(
    x2 = function(value) {
      if (missing(value)) return(self$x * 2) else self$x <- value/2
    }
  )
)

## Step by step to see what's actually going on //
inst <- createR6Instance(input, lazy = TRUE)
inst
class(inst)
## --> call

inst <- eval(inst)
inst
class(inst)
ls(inst)
## --> object generator

inst <- inst$new()
inst
ls(inst)
## --> instance

inst$x
inst$foo
inst$foo()
inst$x2
inst$x2 <- 100
inst$x
```

### Explicit name 

```
createR6Instance(input, name = "TestClass")
```

### Lazy evaluation

```
(inst <- createR6Instance(input, lazy = TRUE))
(inst <- eval(inst))
(inst <- inst$new())
```

### Empty

```
createR6Instance()
createR6Instance(lazy = TRUE)
```
