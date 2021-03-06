% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/propNeeded.R
\name{propNeeded}
\alias{propNeeded}
\alias{propNeeded,ANY-method}
\title{Proportion of remaining delegates necessary to win the nomination}
\usage{
propNeeded(candidate, remainingDelegates)
}
\arguments{
\item{candidate}{An object of the class 'Candidate'.}

\item{remainingDelegates}{The number of party delegates yet to be allocated in the candidate's party.}
}
\value{
The proportion of the remaining delegates still that a given candidate needs to win in order to get her party's nomination.
}
\description{
The function calculates the proportion of remaining delegates needed by a presidential candidate to win the nomination.
}
\examples{

candidate.Bern <- createCandidate("Sanders", 180, "Dem")
propNeeded(candidate.Bern, 1000) 

}
\author{
Miguel Pereira \email{m.pereira@wustl.edu}
}
\seealso{
\code{\link{createCandidate}}, \code{\link{Candidate}}
}

