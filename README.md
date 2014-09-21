classr
======

Interfaces and functionality for creating class instances

## Installation

```
require("devtools")
devtools::install_github("Rappster/classr")
require("classr")
```

## Quick intro

```
## Default instance "body" //
res <- createInstance(cl = "TestClass")
res

ls(res)
class(res)

## Explicit object as instance "body" //
res <- createInstance(cl = "TestClass", obj = list(x = TRUE))
res 

## Strict //
try(createInstance(cl = "TestClass", strict = TRUE))
``` 
