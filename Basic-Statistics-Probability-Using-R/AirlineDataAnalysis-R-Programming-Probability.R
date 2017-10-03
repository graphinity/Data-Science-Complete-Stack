
# Load the csv file with airlines data

FileData <- read.csv("D:/Kshitij-Google-Drive/Learning/Data-Science/Data-Science-Masters-By-Edureka/Course-1-Statistics-Essentials-for-Analytics/016_Unit 1_Project 2_v1.0/airline_dec_2008_50k.csv")
View(FileData)  # View data in table grid

dim(FileData)[1]   # Returns only rows count

# (a)	What is the probability that a flight which is landing/taking off is "WN" Airlines (marginal probability)

FlightCountWN <- subset(FileData, UniqueCarrier == "WN")   # Defines a subset of another table based on filter criteria
View(FlightCountWN)

dim(FlightCountWN)[1]
nrow(FlightCountWN)   # same as above command to read row count 
ProbFlightLandWN <- dim(FlightCountWN)[1]/dim(FileData)[1]
print(ProbFlightLandWN)

# (b)	What is the probability that a flight which is landing/taking off is either "WN" or "AA" Airlines (disjoint events)

FlightCountWNorAA <- subset(FileData, UniqueCarrier == "WN" | UniqueCarrier == "AA")   # Defines a subset of another table based on filter criteria
dim(FlightCountWNorAA)

dim(FlightCountWNorAA)[1]
nrow(FlightCountWNorAA)   # same as above command to read row count 

ProbFlightLandWNorAA <- dim(FlightCountWNorAA)[1]/dim(FileData)[1]
print(ProbFlightLandWNorAA)

# (c)	What is the joint probability that a flight is both "WN" and travels less than 600 miles (joint probability)

FlightCountWNand600Miles <- subset(FileData, UniqueCarrier == "WN" & Distance < 600)   # Defines a subset of another table based on filter criteria
dim(FlightCountWNand600Miles)

ProbFlightLandWNand600Miles <- dim(FlightCountWNand600Miles)[1]/dim(FileData)[1]
print(ProbFlightLandWNand600Miles)

# (d)	What is the conditional probability that the flight travels less than 2500 miles given that the flight is "AA" Airlines (conditional probability)

FlightCountAA <- subset(FileData, UniqueCarrier == "AA")   # Defines a subset of another table based on filter criteria
dim(FlightCountAA)

FlightCount2500AA <- subset(FlightCountAA, Distance <2500)   # Defines a subset of another table based on filter criteria
dim(FlightCount2500AA)

ProbFlightLand2500GivenAA <- dim(FlightCount2500AA)[1]/dim(FlightCountAA)[1]
print(ProbFlightLand2500GivenAA)


# (e)	What is the joint probability of a flight getting cancelled and is supposed to travel less than 2500 miles given that the flight is "AA" Airlines			                                     (joint + conditional probability)

names(DF)   # Gives column names of the set

FlightAA2500Cancelled <- subset(FlightCount2500AA, Cancelled == 1)
dim(FlightAA2500Cancelled)

ProbFlightCancelled2500GivenAA <- dim(FlightAA2500Cancelled)[1]/dim(FlightCountAA)[1]
print(ProbFlightCancelled2500GivenAA)
