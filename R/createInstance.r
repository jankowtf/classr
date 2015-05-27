.Internal <- R6Class(
  classname = ".Internal",
  portable = TRUE,
  public = list(
    data = new.env(parent = emptyenv()),
    initialize = function(...) {
      input <- list(...)
      if (length(input)) {
# print(input)        
        if (is.null(names(input)) || any(names(input) == "")) {
          input <- unlist(input, recursive = FALSE)
        }
        sapply(seq(along = input), function(ii) {
          assign(names(input)[ii], input[[ii]], envir = self$data)
        })
      }
      NULL
    }
  )
)

#' @title
#' Create Class Instance
#'
#' @description 
#' Creates an instance of a specific class.
#'   	
#' @param cl \strong{Signature argument}.
#'    Object containing class information.
#'    This usually corresponds to the name of a class.
#' @param obj \strong{Signature argument}.
#'    Object containing object information that is relevant in the context
#'    of instantiating.
#'    This usually corresponds to an object that should be used "as is" as the 
#'    actual instance object and for which only the class path should be 
#'    updated.
#' @param strict \code{\link{logical}}.
#'    \code{TRUE}: error if \code{cl} is not a class (checked by \code{isClass});
#'    \code{FALSE}: no class existence check.
#' @template threedot
#' @example inst/examples/createInstance.r
#' @seealso \code{
#'   	\link[classr]{createInstance-missing-method}
#' }
#' @template author
#' @template references
#' @export 
setGeneric(
  name = "createInstance",
  signature = c(
    "cl",
    "obj"
  ),
  def = function(
    cl,
    # obj = new.env(parent = emptyenv()),
    obj = if (!r6) new.env(parent = emptyenv()) else .Internal$new(),
    strict = FALSE,
    r6 = TRUE,
    ...
  ) {
    standardGeneric("createInstance")       
  }
)

#' @title
#' Create Class Instance
#'
#' @description 
#' See generic: \code{\link[classr]{createInstance}}
#'      
#' @inheritParams createInstance
#' @param cl \code{\link{character}}.
#' @param obj \code{\link{missing}}.
#' @return See method 
#'    \code{\link{createInstance-character-ANY}}.
#' @example inst/examples/createInstance.r
#' @seealso \code{
#'    \link[classr]{createInstance}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "createInstance", 
  signature = signature(
    cl = "character",
    obj = "missing"
  ), 
  definition = function(
    cl,
    obj,
    strict,
    r6,
    ...
  ) {

  createInstance(
    cl = cl,
    obj = obj,
    r6 = r6,
    strict = strict,
    ...
  )
    
  }
)

#' @title
#' Create Class Instance
#'
#' @description 
#' See generic: \code{\link[classr]{createInstance}}
#'   	 
#' @inheritParams createInstance
#' @param cl \code{\link{character}}.
#' @param cl \code{\link{ANY}}.
#' @return \code{\link{ANY}}. Either \code{obj} with modified class path or
#'    an object that is actually an empty \code{\link{environment}} but has an 
#'    updated class path with class \code{cl} being the first element.
#' @example inst/examples/createInstance.r
#' @seealso \code{
#'    \link[classr]{createInstance}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "createInstance", 
  signature = signature(
    cl = "character",
    obj = "ANY"
  ), 
  definition = function(
    cl,
    obj,
    strict,
    r6,
    ...
  ) {

  if (strict) {
    if (!isClass(cl)) {
      stop(paste0("[", Sys.getpid(), "] ", gsub("-|:| ", "", Sys.time()), 
         "/classr/createInstance> Not a class: ", cl))
    }
  }
  if (class(obj) != ".Internal" && r6) {
    obj <- .Internal$new(obj)
  }
  class(obj) <- unique(c(cl, class(obj)))
  obj
    
  }
)
