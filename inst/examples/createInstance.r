\dontrun{

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

}
