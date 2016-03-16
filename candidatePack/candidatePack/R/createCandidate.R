#' Create object of class `Candidate'
#'
#' A function to create a new object of class Candidate, that automatically calculates 
#' how many delegates the candidate still needs to secure her party's nomination.
#'
#' @param name A string with the name of the presidential candidate. 
#' @param delegatesWon A numeric object with the number of delegates already won by the candidate.
#' @param party A string with the candidate's party. It accepts either 'Dem' or 'Rep' for the Democratic and Republican parties, respectively.
#'
#' @return An object of class `Candidate' that contains
#' \itemize{
#' \item \code{name} Name of the candidate
#' \item \code{delegatesWon} Number of delegates won by the candidate so far
#' \item \code{party} Candidate party
#' \item \code{delegatesNeeded} Number of delegates needed 
#'  }
#' @author Miguel Pereira \email{m.pereira@@wustl.edu}
#' @examples
#' 
#' createCandidate("Bernie Sanders", 140, "Dem") 
#' 
#' @rdname createCandidate
#' @aliases createCandidate,ANY-method
#' @export
#' 
setGeneric(name="createCandidate",
           def=function(name,delegatesWon,party)
             {standardGeneric("createCandidate")}
           )

setMethod(f="createCandidate",
          definition=function(name,delegatesWon,party){
            return(new("Candidate",name=name,delegatesWon=delegatesWon,party=party))
          })