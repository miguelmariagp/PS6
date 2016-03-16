#PS6
#Miguel Maria Pereira
library(devtools)
library(roxygen2)

setwd("C:/Users/ststest/Dropbox/Spr16/Programming/HW6/PS6/candidatePack") #This will need to be changed to match your directory

#create("candidatePack")


# Now the NAMESPACE

## This can be run many times as the code is updated
current.code <- as.package("candidatePack")
load_all(current.code)
document(current.code)

#Creating a Candidate object only with three arguments
me<-createCandidate("Miguel", 844, "Dem")
class(me)

#Show method
me

#Pring method
print(me)

#The propNeeded function at work. This function receives a candidate object
#And the number of remaining delegates available and computes the proportion of
#Delegates needed to win the nomination. In some hypothetical cases this might be already
#impossible, so I created a warning for those cases (example 2)
propNeeded(me, 2322)
propNeeded(me, 1000)

#To test the object of class Race
#I start by creating two new candidates
bernie<-createCandidate("Sanders", 900, "Dem")
clinton<-createCandidate("Clinton", 1300, "Dem")

#Then I put them together on a list
dem.candidates<-list(me,bernie,clinton)

#And create the Race object
Dem.Race<-new("Race",candidates=dem.candidates, party="Dem")

#Finally I plot them.
plot(Dem.Race)
