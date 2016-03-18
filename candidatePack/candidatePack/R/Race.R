#' An object of class Race
#' 
#' Objects of class \code{Race} summarize the standing of the different candidates in a given primary race.
#'
#' 
#' An object of the class `Race' has the following slots:
#' \itemize{
#' \item \code{candidates} A list of objects of class `Candidate', of the same party.
#' \item \code{party} The party of the presidential candidates listed.
#' \item \code{remainingDelegates} The number of delegates left. 
#' }
#' 
#' @examples
#' kasich <- new("Candidate", name="Kasich", delegatesWon=63, party="Rep")
#' miguel <- new("Candidate", name="Miguel", delegatesWon=35, party="Rep")

#' republican.candidates <- list(kasich, miguel)
#' republican.race <- new("Race", candidates=republican.candidates, party="Rep")
#' plot(x=republican.race)
#' 
#' @seealso \code{\link{createCandidate}}, \code{\link{Candidate}}
#'
#' @author Miguel Pereira: \email{m.pereira@@wustl.edu}
#' @aliases Race-class initialize,Race-method plot,Race-method 
#' @rdname Race
#' @export
Race <- setClass(Class="Race",
                 slots = c(candidates = "list",
                           party = "character",
                           delegatesRemaining = "numeric"),
                 prototype = prototype(
                   candidates=list(),
                   party=character(),
                   delegatesRemaining=numeric()
                 )
)


#' @export
setMethod("initialize", "Race", 
          function(.Object, candidates, party){
            .Object@candidates <- lapply(1:length(candidates), FUN=function(i) candidates[[i]]@name)
            .Object@party <- party
            allDelegateswon <- sum(sapply(1:length(candidates), FUN=function(i) candidates[[i]]@delegatesWon))
            if(party=="Rep"){
              .Object@delegatesRemaining <- 2472 - allDelegateswon
            }
            if(party=="Dem"){
              .Object@delegatesRemaining <- 4765 - allDelegateswon
            }
            else{
              stop("Please, pick a valid candidate: either 'Dem' and 'Rep'")
            }
            value=callNextMethod()
            return(value)
          }
) 

#' @export
setMethod(f="plot",
          # Class the method is used for
          signature="Race",
          # The method itself
          definition=function(x=NULL, y=x, ...){
            #Vector of delegates won by candidate
            won<-sapply(1:length(x@candidates), 
                        FUN=function(i) x@candidates[[i]]@delegatesWon)
            #Vector of delegates needed to win the nomination by candidate
            needed<-sapply(1:length(x@candidates), 
                        FUN=function(i) x@candidates[[i]]@delegatesNeeded-x@candidates[[i]]@delegatesWon)
            toplot<-cbind(won,needed)
            rownames(toplot)<-sapply(1:length(x@candidates), FUN=function(i) x@candidates[[i]]@name)
            #Finally, creating a barplot with both pieces of information by candidate
            barplot(t(toplot), beside=T, ylab="Delegates", 
                    cex.names=0.8, las=2, ylim=c(0,test@candidates[[1]]@delegatesNeeded), 
                    col=c("darkblue","gold"), main=paste("Delegates won and needed by", test@party, "candidates"))
                    #,legend=colnames(toplot))
            #And a line for the remaining delegates available
            abline(a=x@delegatesRemaining,b=0, lty=2)
            legend("top",legend=c("won","needed","left"), lty=c(NA,NA,2), fill=c("darkblue","gold","white"), border="white", bty="n",ncol=3)
          }   
)

