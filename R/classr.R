#' @title
#' Class instances for rapid prototyping
#'
#' @description
#' The main intention this package is to facilitate rapid prototyping 
#' by providing central interfacees for the creation of S3 classes that 
#' provide some degree of structure while also being 
#' flexible enough to fit the needs of rapid prototyping.
#' 
#' @details 
#' The core functions/methods of this package: 
#'  \itemize{
#'    \item{\code{\link[classr]{createInstance}}: }{
#'    
#'      Simple way of creating arbitrary S3 class instances on the fly. 
#'    }
#'    \item{\code{\link[classr]{createR6Instance}}: }{
#'    
#'      Simple way of creating R6 class instances on the fly.
#'    }
#'    \item{\code{\link[classr]{ensureClassRegistration}}: }{
#'    
#'      Takes care of registering classes via \code{\link[methods]{setOldClass}}.
#'      It is mainly designed for the use of "on the fly" S3 classes rather 
#'      than formal S4 or S4 Reference Classes.
#'      A call to this function inside your package's \code{\link[base]{.onLoad}}
#'      or \code{\link[base]{.onAttach}} functions would make sure that all the
#'      S3 classes that you are using are registered properly. This in turn
#'      allows using them in combination with S4 methods.
#'    }
#' }
#' @template author
#' @template references
#' @docType package
#' @name classr
NULL
