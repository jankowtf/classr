context("createInstance")
test_that("createInstance", {

  expect_is(res <- createInstance("TestClass"), "TestClass")
  expect_equal(ls(res), character())
  expect_equal(class(res), c("TestClass", "environment"))
  expect_is(res <- createInstance("TestClass", 
    input = list(x = TRUE), r6 = FALSE), "TestClass")
  
  ## Strict //
  expect_error(createInstance("TestClass", strict = TRUE))
#   ensureClassRegistration(cl = "TestClass")
#   expect_is(res <- createInstance(cl = "TestClass", strict = TRUE), "TestClass")
  # removeClass("TestClass")  
})
