##------------------------------------------------------------------------------
## Default input //
##------------------------------------------------------------------------------

## This is ideal for rapid prototyping. All list elements are mapped to 
## publicly available fields.

inst <- createR6Class(input = list(x = 1, y = 2))
inst

##------------------------------------------------------------------------------
## Special input format //
##------------------------------------------------------------------------------

## For more fine control over the class structure.

input <- list(
  public = list(x = 10, foo = function() private$bar()),
  private = list(bar = function() "Hello World!"),
  active = list(
    x2 = function(value) {
      if (missing(value)) return(self$x * 2) else self$x <- value/2
    }
  )
)

## To see what's actually going on:
(inst <- createR6Class(input))
(inst <- inst$new())

inst$x
inst$foo
inst$foo()
inst$x2
inst$x2 <- 100
inst$x

##------------------------------------------------------------------------------
## Return expression //
##------------------------------------------------------------------------------

## Useful for lazy evaluation
(inst <- createR6Class(input, lazy = TRUE))
(inst <- eval(inst))
(inst <- inst$new())

##------------------------------------------------------------------------------
## Explicit name //
##------------------------------------------------------------------------------

createR6Class(input, name = "TestClass")

##------------------------------------------------------------------------------
## Empty //
##------------------------------------------------------------------------------

createR6Class(lazy = TRUE)
