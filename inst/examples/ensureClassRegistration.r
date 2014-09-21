\dontrun{

## NOTE //
## Keeping the default for 'where'  that is used by 'setOldClass',
## i.e. simply *not* providing a value in the call to 'ensureClassRegistration',
## only works as long as your package has not been fully loaded yet
ensureClassRegistration(cl = "TestClass")
isClass("TestClass")
ensureClassRegistration(cl = "TestClass")
try(ensureClassRegistration(cl = "TestClass", strict = TRUE))
ensureClassRegistration(cl = c("TestClass1", "TestClass2"))
isClass("TestClass1")
isClass("TestClass2")

}
