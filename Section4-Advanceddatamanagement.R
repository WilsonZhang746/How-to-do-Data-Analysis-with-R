#course: Beginning using R for data analysis
#by https://www.youtube.com/@easydatascience2508
#Section 4: Advanced data management
setwd("d:/")   # to set working directory
##set colClasses in read.table() to create a data frame
vartype<-c("character", "character", "character", "character", "character", "numeric","numeric", "numeric","numeric","character")
grade <- read.table("University-Fullname-full.csv", colClasses=vartype, header=TRUE, sep=",")                                      
grade

##Mathematical functions
#Absolute value
abs(-5.0)      #5
#Square root
sqrt(c(25, 16))       #returns a vector of (5, 4)
#Ceiling
ceiling(5.5)     #returns 6
#floor
floor(-2.3)      #returns -3
#truncate
trunc(-3.6)      #returns -3
#round
round(15.3456, digits=2)       #returns 15.35
#natural logarithm
log(10)    #returns  2.302585
#Exponential function
exp(2.3085)      #returns  10.06




##Statistical functions
x <- c(seq(1:100))  #a vector from 1 to 100
#mean
mean(x)  #50.5
#standard deviation
sd(x)    #around 29
#variance
var(x)    #around 842
# trimmed mean, dropping the highest and
# lowest 5% of scores
z <- mean(x, trim = 0.05, na.rm=TRUE)
z     #50.5
#scale, standardization
scale(x)    #a standardized vector with mean 0 and standard deviation 1
#minimum
min(x)   #1
#maximum
max(x)    #100
#range
range(x)   #1 to 100
#diff
diff(x)    #a vector of 99 element 1
#quantile
quantile(x, probs=0.7)    #around 70


##Probability functions
# generate and plot normal distributed variables 
library(ggplot2)
x <- seq(from = -10, to = 10, by = 0.2)
y <- dnorm(x)   #generate normally distributed variables
data <- data.frame(x = x, y = y)
ggplot(data, aes(x, y)) +
  geom_line() +
  labs(x = "sequential numbers",
       y = "Normal variate") +
  scale_x_continuous(breaks = seq(-10, 10, 1))

#the area under the standard normal curve to the left of z=1.25?
pnorm(1.25)     #0.894
#the value of the 60th percentile of a normal distribution 
#with a mean of 30 and a standard deviation of 8
qnorm(.6, mean=30, sd=8)   #32
#Generate 20 random normal deviates with a mean of 30 and a 
#standard deviation of 8
rnorm(20, mean=30, sd=8)



#using set_seed() to make your results reproducible
runif(10)
runif(10)   #different results
set.seed(5678)
runif(10)
set.seed(5678)
runif(10)   #same results



##Character functions
#toupper(y)
toupper("r is easy")  #returns "R IS EASY"

#tolower(Y)
tolower("R is Interesting") #returns "r is interesting"

#nchar(Y)		#Counts the number of characters of Y
nchar("R is interesting")   #16

#paste(..., sep="")	#Concatenates strings after using specified sep string
paste("Y", 5:7, sep="")  #"Y5" "Y6" "Y7"

#substr(Y, start, stop)	       #Extracts substrings in a character vector
substr("uvwxyz", 2, 4)   #returns "vwx"

#sub(pattern, replacement, Y, ignore.case=FALSE, fixed=FALSE)
#Finds the first matched pattern in Y and substitutes the replacement text
#  If fixed=FALSE, then pattern is a regular expression
#  If fixed=TRUE, then pattern is a text string	
sub("\\s",".","R is easy")   #returns "R.is easy"
sub("is","not","R is easy", fixed=TRUE)  #returns "R not easy"

# grep(pattern, Y, ignore.case=FALSE,fixed=FALSE)		
# Searches for pattern in X and Returns the matching indices	
#  If fixed=FALSE, then pattern is a regular expression
#  If fixed=TRUE, then pattern is a text string
grep("R", c("R","notR","R-programming", "is"))  #returns c(1,2,3)

#strsplit(Y, split, fixed=FALSE)		#Splits the elements of character vector x at split
#  If fixed=FALSE, then pattern is a regular expression
#  If fixed=TRUE, then pattern is a text string
strsplit("easy", "")   #returns "e" "a" "s" "y"




##Using apply function
#using apply() to rows and columns of a matrix
test <- matrix(rnorm(20), nrow = 4)
test
apply(test, 1, mean)    #row mean of a matrix
apply(test, 2, mean)    #column mean of a matrix
apply(test, 2, mean, trim = 0.2) #trimmed column mean



## A solution to the working example
options(digits = 2)  #set the number of digits printed
setwd("d:/")   # to set working directory
#create a grade data frame
vartype<-c("character", "character", "character", "character", "character", "numeric","numeric", "numeric","numeric","character")
grade <- read.table("University-Fullname-full.csv", colClasses=vartype, header=TRUE, sep=",")                                      
grade


test <- scale(grade[, 7:9])    #standardize test score
score <- apply(test, 1, mean) #get mean of score for each student
grade <- cbind(grade, score)

#to create a grade (A, B, C,D, E) 
q <- quantile(score, c(.8, .6, .4, .2))
grade$grade <- NA
grade$grade[score >= q[1]] <- "A"
grade$grade[score < q[1] & score >= q[2]] <- "B"
grade$grade[score < q[2] & score >= q[3]] <- "C"
grade$grade[score < q[3] & score >= q[4]] <- "D"
grade$grade[score < q[4]] <- "F"

#separate Fullname as two new variables First and Last
#order student by their Lastname and Firstname
Fullname <- strsplit((grade$Fullname), " ")
Last <- sapply(Fullname, "[", 2)
First <- sapply(Fullname, "[", 1)
grade <- cbind(First, Last, grade[, -2])
grade <- grade[order(Last, First), ]

grade


##Control flow
#for loop
for (i in 1:3) print("I love R")
#while loop
i <- 5
while (i > 0) {print("I love R")
  i <- i - 1}

#Conditional execution
#if-else control structure
#transform variable Race as a factor if it element is character. 
if (is.character(grade$Race)) grade$Race <- as.factor(grade$Race)
#transform grade variable to factor if it is not.
if (!is.factor(grade$grade)) { 
  grade$grade <- as.factor(grade$grade)
   }    else {
      print("Grade already is a factor")
     }
#ifelse
#print differently according to if the score is greater or less than 0.5
ifelse(grade$score > 0.5, print("You have passed the exam"), print("You have failed the exam"))
# switch
#print differently for different country
countries <- c("USA", "Germany")
for (i in countries) {
  print(
    switch(i,
      USA  = "I am in North America",
      Japan = "I am in Asia",
      Nigeria    = "I am in Africa",
      Germany  = "I am in Europe"
    )
  )
}


##creating your own functions
#to create a function for statistics
sumfunc <- function(x, par = TRUE, print = FALSE) {
  if (par) {
    cen <- mean(x)
    spr <- sd(x)
  } else {
    cen <- median(x)
    spr <- mad(x)
  }
  if (print & par) {
    cat("Mean=", cen, "\n", "SD=", spr, "\n")
  } else if (print & !par) {
    cat("Median=", cen, "\n", "MAD=", spr, "\n")
  }
  result <- list(center = cen, spread = spr)
  return(result)
}

set.seed(1234)
x <- rnorm(100)
y <- sumfunc(x)    #call function using default option
#call function with new parameter option
y <- sumfunc(x, print=TRUE)  



##Transposing a dataset
test <- grade[1:5, 7:9]
test
t(test)





## Aggregating data 
options(digits = 3)
test<-grade[,c(4,5,7:9)]
test$Gender<-as.factor(test$Gender)
test$Country<-as.factor(test$Country)
agg <- aggregate(test, by = list(test$Gender, 
     test$Country), FUN = mean, na.rm = TRUE)

#a better solution
agg <- aggregate(test[-c(1,2)], 
      by = list(Gender=test$Gender, 
      Coungry=test$Country), 
      FUN = mean, na.rm = TRUE)


agg



##Descriptive statistics with summary()
vars <- c("Math", "Physics", "Chemistry")
summary(grade[vars])


##Descriptive statistics via describe() in the Hmisc package
library(Hmisc)
vars <- c("Math", "Physics", "Chemistry")
describe(grade[vars])
