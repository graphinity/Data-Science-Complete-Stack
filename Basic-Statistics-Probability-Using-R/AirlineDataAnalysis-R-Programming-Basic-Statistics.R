
# Load the csv file with airlines data

DF <- read.csv("D:/Kshitij-Google-Drive/Learning/Data-Science/Data-Science-Masters-By-Edureka/Course-1-Statistics-Essentials-for-Analytics/016_Unit 1_Project 1_v1.0/airline_dec_2008_50k.csv")
View(DF)  # View data in table grid

# (a) Check the skewness of Distance travelled by airlines.

?hist  # Search for command in help menu
hist(DF$Distance)   # Plot histogram for Distance in DF data set
hist(DF$Distance, breaks = "fd")    # Define auto generated breaks for histogram
hist(DF$Distance, breaks = 5)   # Define 5 breaks for histogram
hist(DF$Distance, breaks = 10)   # Define 10 breaks for histogram

?dim
dim(DF)  # Dimensions of an object - count of rows and columns

# (b) Calculate the mean, median and quantiles of the distance travelled by US Airlines (US).

DF$MyCarrier <- as.character(DF$UniqueCarrier)
Subset <- subset(DF, UniqueCarrier == "US")   # Defines a subset of another table based on filter criteria
View(Subset)
?summary
summary(Subset)    # Creates a summary of central tendency, IQR for all colums of the object
summary(Subset$Distance)     # Creates a summary of central tendency, IQR for specific colum of the object

# (c) Check the standard deviation of distance travelled by American Airlines (AA).

Subset <- subset(DF, MyCarrier == "AA")   # Create a subset and filter by an attribute
View(Subset)  
head(Subset)   # Print results in Console instead of a table 
sd(Subset$Distance)   # Calculates standard deviation for the attribute


# (d) Draw a boxplot of UniqueCarrier with Distance.

boxplot(DF$Distance)  # Draws box plot for the attribute
boxplot(DF$Distance ~ DF$UniqueCarrier)   # Draws box plot for multiple attributes


# (e) Draw the direction of relationship between ArrDelay and DepDelay by drawing a scatterplot.

plot(DF$DepDelay, DF$ArrDelay)   # Scatter plot for multiple variables

