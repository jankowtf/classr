context("createR6Instance")
test_that("createR6Instance", {

  input <- list(
    public = list(x = 10, foo = function() private$bar()),
    private = list(bar = function() "Hello World!"),
    active = list(
      x2 = function(value) {
        if (missing(value)) return(self$x * 2) else self$x <- value/2
      }
    )
  )
  expect_is(res <- createR6Instance(input, lazy = TRUE), "call")
  expect_is(res <- createR6Instance(input), ".DerivedInternal")
  expect_identical(res$x, input$public$x)
  expect_equivalent(res$foo, input$public$foo)
  expect_identical(res$foo(), "Hello World!")
  expect_identical(res$x2, input$public$x * 2)
  expect_identical(res$x2 <- 100, 100)
  expect_identical(res$x, 100 / 2)
  
})

test_that("createR6Instance/named", {
  
  input <- list(x = 10, y = 20)
  expect_is(res <- createR6Instance(input, name = "TestClass"), "TestClass")
  expect_identical(ls(res), c("x", "y"))

})

test_that("createR6Instance/named", {
  
  expect_is(res <- createR6Instance(name = "TestClass"), "TestClass")
  expect_identical(ls(res), character())
})
