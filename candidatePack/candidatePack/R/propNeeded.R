#' Computes prooportion of remaining delegates necessary to win the nomination
#' 
#' The function calculates the proportion of remaining delegates needed by a presidential candidate to win the nomination
#'
#' @param candidate An object of the class Candidate'.
#' @param remainingDelegates The number of party delegates yet to be allocated in the candidate's party.
#'
#' @return The proportion of the delegates a given candidate still needs to secure her party's nomination
#' 
#' @author Miguel Pereira \email{m.pereira@@wustl.edu}
#' @examples
#' 
#' candidate.Bern <- createCandidate("Bernie Sanders", 180, "Dem")
#' propNeeded(candidate.Bern, 1000) 
#' 
#' @seealso \code{\link{createCandidate}}, \code{\link{Candidate}}
#' @rdname propNeeded
#' @aliases propNeeded,ANY-method
#' @export

setGeneric(name="propNeeded",
           def=function(candidate, remainingDelegates)
             {standardGeneric("propNeeded")}
           )

setMethod(f="propNeeded",
          definition=function(candidate, remainingDelegates){
            prop<-(candidate@delegatesNeeded-candidate@delegatesWon)/remainingDelegates
            return(ifelse(prop>1,
                  "Too late! Not enough delegates left.", prop))
          })