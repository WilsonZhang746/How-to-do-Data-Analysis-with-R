#course: Beginning using R for data analysis
#by https://www.youtube.com/@easydatascience2508
#Section 6: Final Exercise
#Data set:
  
#We use a data set 'cars' which comprises 32 virtual
#car obsevations with their fuel consumption and 
#6 aspects of automobile design and performance.

#You have to load csv data files to create a data 
#frame with 32 observations on 6 (numeric) variables.


#Column  Variable  	Description				
#[, 1]	mpg		Miles/(US) gallon
#[, 2]	cyl		Number of cylinders
#[, 3]	hp		Gross horsepower
#[, 4]	wt		Weight (1000 lbs)
#[, 5]	vs		Engine (0 = V-shaped, 1 = straight)
#[, 6]	am		Transmission (0 = automatic, 1 = manual)



#Tasks and Solution

setwd("d:/")   # to set working directory
##read.table() to create a data frame
vartype<-c("numeric", "numeric", "numeric","numeric", "numeric")
cars <- read.table("cars.csv", colClasses=vartype, header=TRUE, sep=",")                                      
cars

##Task1
##Handling missing values
#transform wt value 999 as NA

cars$wt[cars$wt == 999] <- NA


#remove observation with NA
cars<-cars[!is.na(cars$wt),]


##Task2
##recode variable 'vs', and 'am' as 
#factor variable.
cars$vs <- as.factor(cars$vs)
cars$am <- as.factor(cars$am)



##Task3
##Create summary statistics of 'mpg'

summary(cars$mpg)

#Plot simple scatter plot between 'cyl and 'mpg', and between 'wt' and 'mpg'
plot(cars$cyl, cars$mpg)
plot(cars$wt, cars$mpg)

#Using with() to Plot simple scatter plot between 'cyl and 'mpg'

with(mtcars, {
  plot(cyl,mpg)
})



##Task4
## create a new data frame 'carssorted' , which Sorts
#data frame 'cars' by order of  "am" and "vs"

carssorted <-cars[order(cars$am, cars$vs),]


##Task5
##create a new data frame 'meanmpg' , to get mean 
#value of 'mpg' in each group combination of 'am' 
#using aggregate() function, and exclude unwanted 
#variables in this new data frame

meanmpg <- aggregate(cars[-c(2:6)],
          by=list(am=cars$am),
        FUN=mean)


##Task6
##Create a scatter plot using ggplot() where x-axis
#is 'hp' , y axis is 'mpg' in data frame cars, and
#with a smooth line of linear regression for the 
#relationship between these two variables. 
library(ggplot2)
ggplot(data = cars, 
      mapping = aes(x = hp, y = mpg)) +
      geom_point(color = "cornflowerblue", alpha = .7, size = 1.5) +
      theme_bw() +
      geom_smooth(method = "lm")



##Task7
##create a grouped bar plot for variable 'vs' with 
#each value of 'am' variable

ggplot(cars, aes(x=am, fill=vs)) +
     geom_bar(position = "dodge") + 
     labs(title="Grouped Bar chart",                   
    x="am",                               
    y="vs")  



##Task8
##subsetting data
#create a new data frame called carnew1, which 
#is based on cars, but excludes variable 'hp' 
#and 'vs'

carnew1<-cars[,c(-3,-5)]

#create a new data frame called carnew2, which is 
#based on cars, but select only the observations 
#where vs is 0.

carnew2<-cars[cars$vs==0,]