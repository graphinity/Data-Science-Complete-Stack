# Calculate probability of normal distribution
pnorm(70000, mean=50000, sd=30000)
qnorm(0.95, mean=50000, sd=30000)

# Calcualte distributed binomial
dbinom(8, 10, 0.24)   # first is k for number of successes, second is size is n which is number of trials and third is p which is probability of success.

FileData <- read.csv("D:/Kshitij-Google-Drive/Learning/Data-Science/Data-Science-Masters-By-Edureka/Course-1-Statistics-Essentials-for-Analytics/016_Unit 1_Project 3_v1.0/airline_dec_2008_50k.csv")
View(FileData)  # View data in table grid

plot(FileData$CRSDepTime, FileData$Distance)
model <- lm(FileData$CRSDepTime ~ FileData$Distance, FileData)   # Creating a Linear Model for Career and Distance
model
summary(model)
lines(FileData$CRSDepTime, model$Fitted, col="red", lwd=3)

# (a)	Suppose arrival delays of flights belonging to "AA" are normally distributed with mean 15 minutes and standard deviation 3 minutes. 
#     If the "AA" plans to announce a scheme where it will give 50% cash back if their flights are delayed by 20 minutes, 
#     how much percentage of the trips "AA" is supposed to loose this money. (Hint: pnorm)

mean1 = 15
sd1 = 3
value1 = 20

pnorm(20, mean=mean1, sd=sd1)  # Answer is 95%

# (b)	Assume that 65% of flights are diverted due to bad weather through the Weather System. 
#     What is the probability that in a random sample of 10 flights, 6 are diverted through the Weather System. (Hint: dbinorm)

dbinom(6, 10, 0.65)   # Answer is 23.7%

# (c)	Do linear regression between the Arrival Delay and Departure Delay of the flights.

FileDataWithDelay <- subset(FileData, ArrDelay !="NA" & DepDelay != "NA")
View(FileDataWithDelay)

plot(FileDataWithDelay$DepDelay, FileDataWithDelay$ArrDelay)
model2 <- lm(FileDataWithDelay$ArrDelay ~ FileDataWithDelay$DepDelay)  
model2
summary(model2)


# (d)	Find out the confidence interval of the fitted linear regression line.

confint(model2)   # Confidence interval

# (e)	Perform a multiple linear regression between the Arrival Delay along with the Departure Delay and Distance travelled by flights.

model3 <- lm(FileDataWithDelay$ArrDelay ~ FileDataWithDelay$DepDelay + FileDataWithDelay$Distance)  
model3
summary(model3)
confint(model3)   # Confidence interval

