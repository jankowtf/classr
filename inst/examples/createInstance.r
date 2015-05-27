##------------------------------------------------------------------------------
## Default instance "body" //
##------------------------------------------------------------------------------

res <- createInstance("TestClass")
res

ls(res)
class(res)

##------------------------------------------------------------------------------
## Explicit object as instance "body" //
##------------------------------------------------------------------------------

res <- createInstance("TestClass", 
  input = list(x = TRUE, y = list(x_1 = 1, x_2 = 2)))
res 

## Strict //
try(createInstance("TestClass", strict = TRUE))
