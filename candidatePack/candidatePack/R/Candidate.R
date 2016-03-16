#' A Candidate object 
#' 
#' Objects of class \code{Candidate} are created by \code{addCandidate} functions
#'
#' 
#' An object of the class `Candidate' has the following slots:
#' \itemize{
#' \item \code{name} Name of the candidate
#' \item \code{delegatesWon} Number of delegates won by the candidate so far
#' \item \code{party} Candidate party
#' \item \code{delegatesNeeded} Number of delegates needed 
#' }
#'
#' @author Miguel Pereira: \email{m.pereira@@wustl.edu}
#' @aliases Candidate-class initialize,Candidate-method show,Candidate-method 
#' @rdname Candidate
#' @export
setClass(Class="Candidate",
         slots = c(
           name = "character",
           delegatesWon = "numeric",
           party = "character",
           delegatesNeeded = "numeric"
         ),
         prototype = prototype(
           name = character(),
           delegatesWon = numeric(),
           party = character(),
           delegatesNeeded = numeric()
         )
)


#' @export
setMethod("initialize", "Candidate", 
          function(.Object, name, delegatesWon, party){
            .Object@name <- name
            .Object@party <- party
            .Object@delegatesWon <- delegatesWon
            if(party=="Rep"){
              .Object@delegatesNeeded <- 1237
            }
            if(party=="Dem"){
              .Object@delegatesNeeded <- 2383
            }
            else {
              stop("Please specify the party properly: either 'Dem' or 'Rep'")
            }
            value=callNextMethod()
            return(value)
          }
) 

#' @export
setMethod(f="show",
          # Class the method is used for
          signature="Candidate",
          definition=function(object){
            showcand <- data.frame(object@name, object@delegatesWon, object@party, object@delegatesNeeded)
            colnames(showcand) <- c("Name","Delegates Won","Party","Delegates Needed")
            print(showcand)
          }   
)

#' @export
# Print method (print is a S3 function)
print.Candidate <- function(candidate){
  paste("Candidate",candidate@name,"is a",paste(candidate@party,".",sep=""), 
        "So Far,",candidate@name, "won", candidate@delegatesWon, "delegates.", sep=" ")
}