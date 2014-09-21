context("createInstance-1")
test_that("createInstance", {

  expect_is(res <- createInstance(cl = "TestClass"), "TestClass")
  expect_equal(ls(res), character())
  expect_equal(class(res), c("TestClass", "environment"))
  expect_is(res <- createInstance(cl = "TestClass", 
    obj = list(x = TRUE)), "TestClass")
  
  ## Strict //
  expect_error(createInstance(cl = "TestClass", strict = TRUE))
  ensureClassRegistration(cl = "TestClass")
  expect_is(res <- createInstance(cl = "TestClass", strict = TRUE), "TestClass")
  
  }
)
