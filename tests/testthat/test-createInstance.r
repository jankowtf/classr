context("createInstance")
test_that("createInstance", {

  expect_is(res <- createInstance("TestClass", r6 = FALSE), "TestClass")
  expect_equal(ls(res), character())
  expect_equal(class(res), c("TestClass", "environment"))
  expect_is(res <- createInstance("TestClass", 
    obj = list(x = TRUE), r6 = FALSE), "TestClass")
  
  ## Strict //
  expect_error(createInstance("TestClass", strict = TRUE))
  ensureClassRegistration(cl = "TestClass")
  expect_is(res <- createInstance(cl = "TestClass", strict = TRUE), "TestClass")
  
})

test_that("createInstance/R6", {
  
  expect_is(res <- createInstance("TestClass"), "TestClass")
  expect_equal(ls(res$data), character())
  expect_equal(class(res), c("TestClass", ".Internal", "R6"))
  
  expect_is(res <- createInstance("TestClass", 
    obj = list(x = TRUE)), "TestClass")
  ls(res$data)
    
})
