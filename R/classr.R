#' @title
#' Interfaces and functionality for creating class instances
#'
#' @description
#' This package features a central interface for which other
#' packages can implement methods that facilitate the systematic
#' creation of class instances.
#' 
#' @details 
#' The core functions/methods of this package: 
#'  \itemize{
#'    \item{\code{\link[classr]{createInstance}}: }{
#'      Simple way of creating arbitrary class instances. It is mainly 
#'      designed for the use of "on the fly" S3 classes rather than formal 
#'      S4 or S4 Reference Classes.
#'    }
#'    \item{\code{\link[classr]{ensureClassRegistration}}: }{
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