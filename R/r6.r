#' @title
#' .Internal
#'
#' @description
#' Internal default class.
#' 
#' @section Methods:
#' \code{\link[rapi]{initialize}}
#'    
#' @field data \code{\link{environment}}.
#'  Central environment where actual objects are assigned to.
#' @template author
#' @template references
#' @import R6
#' @export 

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
#' Define R6 classes on the fly
#'
#' @description 
#' Creates R6 class generator objects on the fly.
#'   	
#' @param input \code{\link{list}}. 
#'  Input for class fields. If elements with names \emph{public}, 
#'  \emph{private} and \emph{active} are found, then the respective values
#'  will be used as respective arguments value in the call to 
#'  \code{\link[R6]{R6Class}}. Otherwise the list will be mapped to 
#'  public fields (see examples).
#' @param name \code{\link{character}}.
#'  Class name.
#' @param lazy \code{\link{logical}}.
#'  \code{TRUE}: evaluate expression and thus return object generator; 
#'  \code{FALSE}: return expression that will generate the object generator.
#' @example inst/examples/createR6Class.r
#' @seealso \code{\link[classr]{createR6Instance}}
#' @template author
#' @template references
#' @export 

createR6Class <- function(
  input, 
  name = ".DerivedInternal",
  lazy = FALSE
) {
  if (missing(input)) {
    input <- list()
  }
  nms <- names(input)
  tmp <- list()
  
  public <- FALSE
  if (any(grepl("public", nms))) {
    tmp$public <- input$public 
    public <- TRUE
  } 
  private <- FALSE      
  if (any(grepl("private", nms))) {
    tmp$private <- input$private 
    private <- TRUE
  }
  active <- FALSE      
  if (any(grepl("active", nms))) {
    tmp$active <- input$active 
    active <- TRUE
  }
  expr <- substitute(
    R6Class(
      classname = CLASSNAME,
      portable = TRUE,
      public = PUBLIC,
      private = PRIVATE,
      active = ACTIVE
    ),
    list(
      CLASSNAME = name,
      PUBLIC = if (public) tmp$public else input,
      PRIVATE = if (private) tmp$private else NULL,
      ACTIVE = if (active) tmp$active else NULL
    )
  )
  if (!lazy) {
    eval(expr)
  } else {
    expr
  }
}

#' @title
#' Create R6 class instances
#'
#' @description 
#' Creates an instance of an R6 class defined on the fly via 
#' \code{\link[classr]{createR6Class}}.
#'   	
#' @param input \code{\link{list}}. 
#'  Input for class fields. If elements with names \emph{public}, 
#'  \emph{private} and \emph{active} are found, then the respective values
#'  will be used as respective arguments value in the call to 
#'  \code{\link[R6]{R6Class}}. Otherwise the list will be mapped to 
#'  public fields (see examples).
#' @param name \code{\link{character}}.
#'  Class name.
#' @param lazy \code{\link{logical}}.
#'  \code{TRUE}: evaluate expression and thus return object generator; 
#'  \code{FALSE}: return expression that will generate the object generator.
#' @example inst/examples/createR6Instance.r
#' @seealso \code{\link[classr]{createR6Class}}
#' @template author
#' @template references
#' @export 

createR6Instance <- function(
  input, 
  name = ".DerivedInternal",
  lazy = FALSE
) {
  out <- createR6Class(input = input, name = name, lazy = lazy)
  if (!lazy) {
    out$new()
  } else {
    out
  }
}
