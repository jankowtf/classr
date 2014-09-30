#' @title
#' Ensure Class Registration
#'
#' @description 
#' Ensures that classes are registrated in a sense that they are recognized
#' by \code{\link[methods]{isClass}}.
#' 
#' @details
#' Esentially, this functions simply calls \code{\link[methods]{setOldClass}}
#' in order to register the classes. A call to this method might make sense
#' inside \code{\link[base]{.onLoad}} and \code{\link[base]{.onAttach}} of 
#' your packages.
#'   	
#' @param cl \strong{Signature argument}.
#'    Object containing class information.
#'    This usually corresponds to the name of a class.
#' @param strict \code{\link{logical}}.
#'    \code{TRUE}: error if \code{cl} is already a class 
#'    (checked by \code{isClass});
#'    \code{FALSE}: if class already exists it is not reset.
#' @param ... Further arguments passed to subsequent functions/methods.
#'    In particular: 
#'    \code{\link[methods]{setOldClass}}
#' @example inst/examples/ensureClassRegistration.r
#' @seealso \code{
#'   	\link[classr]{ensureClassRegistration-missing-method}
#' }
#' @template author
#' @template references
#' @export 
setGeneric(
  name = "ensureClassRegistration",
  signature = c(
    "cl"
  ),
  def = function(
    cl,
    strict = FALSE,
    ...
  ) {
    standardGeneric("ensureClassRegistration")       
  }
)

#' @title
#' Ensure Class Registration
#'
#' @description 
#' See generic: \code{\link[classr]{ensureClassRegistration}}
#'   	 
#' @inheritParams ensureClassRegistration
#' @param cl \code{\link{character}}.
#' @return \code{\link{logical}}. \code{TRUE}.
#' @example inst/examples/ensureClassRegistration.r
#' @seealso \code{
#'    \link[classr]{ensureClassRegistration}
#' }
#' @template author
#' @template references
#' @export
#' @import conditionr
setMethod(
  f = "ensureClassRegistration", 
  signature = signature(
    cl = "character"
  ), 
  definition = function(
    cl,
    strict,
    ...
  ) {

  sapply(cl, function(ii) {
    if (!isClass(cl)) {
      setOldClass(Classes = ii, ...)
#       foo(ii)
    } else {
      if (!strict) {
#         sysframes <- sys.frames()
        tryCatch(
          removeClass(ii, ...),
#           removeClass(ii, where = sysframes[[length(sysframes)]], ...),
          warning = function(cond) {
            
          },
          error = function(cond) {
            srch <- search()
            removeClass(ii, where = as.environment(srch[length(srch)]))
          }
        )
        setOldClass(Classes = ii, ...)
      } else {
        stop(paste0("[", Sys.getpid(), "] ", gsub("-|:| ", "", Sys.time()), 
           "/classr/ensureClassRegistration> Already a class: ", cl))
      }
    }
  })
  return(TRUE)
    
  }
)
