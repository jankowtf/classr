##------------------------------------------------------------------------------
## Default instance "body" //
##------------------------------------------------------------------------------

res <- createInstance("TestClass")
res

ls(res)
ls(res$data)
class(res)

res <- createInstance("TestClass", r6 = FALSE)
res

ls(res)
class(res)

##------------------------------------------------------------------------------
## Explicit object as instance "body" //
##------------------------------------------------------------------------------

res <- createInstance(cl = "TestClass", 
  obj = list(x = TRUE, y = list(x_1 = 1, x_2 = 2)))
res 
ls(res$data)
res$data$x
res$data$y

res <- createInstance(cl = "TestClass", 
  obj = list(x = TRUE, y = list(x_1 = 1, x_2 = 2)), r6 = FALSE)
res 

## Strict //
try(createInstance(cl = "TestClass", strict = TRUE))

##------------------------------------------------------------------------------
## Underlying R6 class //
##------------------------------------------------------------------------------

.Internal$new()
x <- .Internal$new(a = 1, b = 2)
ls(x$data)
x$data$a
x$data$b


obj <- list(x = TRUE, y = list(x_1 = 1, x_2 = 2))
obj
input <- obj
if (is.null(names(input)) || any(names(input) == "")) {
  input <- unlist(input, recursive = FALSE)
}
ii=1
substitute(
  .Tmp <- R6Class(
    classname = ".Internal",
    portable = TRUE,
    public = PUBLIC
  ),
  list(PUBLIC = deparse(input, control = c("keepInteger", "keepNA")))
)
expr <- substitute(
  .Tmp <- R6Class(
    classname = ".Internal",
    portable = TRUE,
    public = PUBLIC
  ),
  list(PUBLIC = input)
)
eval(expr)
.Tmp$new()


