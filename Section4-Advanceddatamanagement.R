#course: Beginning using R for data analysis
#by https://www.youtube.com/@rprogramming32
#Section 4: Advanced data management


setwd("d:\\RStatistics-Tutorial")   # to set working directory

##set colClasses in read.table() to create a data frame
vartype<-c("character", "character", "character", "character", "character", "numeric","numeric", "numeric","numeric","character")
grade <- read.table("University-Fullname-full.csv", colClasses=vartype, header=TRUE, sep=",")                                      
grade



#Lecture 1
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







#Lecture 2.
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








##Lecture 3.Probability functions
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







##Lecture 4. Character functions
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
#returns a list
test <- strsplit("easy", "")   #returns "e" "a" "s" "y" 
test

#unlist to a vector
test1 <- unlist(test)

#alternative way
sapply(test,"[",2)
test1 



















##Lecture 5. Using apply function
#using apply() to rows and columns of a matrix
test <- matrix(rnorm(20), nrow = 4)
test
apply(test, 1, mean)    #row mean of a matrix
apply(test, 2, mean)    #column mean of a matrix
apply(test, 2, mean, trim = 0.2) #trimmed column mean


### apply() function
#Here, is a basic example showcasing the use of apply() 
#function along rows as well as columns.
# create sample data
sample_matrix <- matrix(C<-(1:10),nrow=3, ncol=10)

print( "sample matrix:")
sample_matrix

# Use apply() function across row to find sum
print("sum across rows:")
apply( sample_matrix, 1, sum)

# use apply() function across column to find mean
print("mean across columns:")
apply( sample_matrix, 2, sum)











## A solution to the working example
options(digits = 2)  #set the number of digits printed
setwd("d:\\RStatistics-Tutorial")   # to set working directory
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












##Lecture 6. Control flow
#for loop
for (i in 1:3) print("I love R")
#while loop
i <- 5
while (i > 0) {print("I love R")
  i <- i - 1}

#Conditional execution
#if-else control structure
#transform variable Race as a factor if it element is character. 
options(digits = 2)  #set the number of digits printed
setwd("d:\\RStatistics-Tutorial")   # to set working directory
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








##Lecture 7. creating your own functions
#to create a function for statistics
#mad() to calculate the median of the absolute deviation from median
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

items <- c(11, 22, 33, 55,66,77)
rn <- c("r1", "r2")
cn <- c("c1", "c2","c3")

#2 × 2 matrix filled by rows
mtx1 <- matrix(items,
                   nrow = 2, ncol = 3, byrow = TRUE,
                   dimnames = list(rn, cn))

mtx1

t(mtx1)

#data frame transpose
Idnumber <- c(3, 4, 5, 6) 
age <- c(76, 32, 64, 22)
gene <- c("T5", "T6", "T5", "T4")
score <- c("Weak", "good", "brilliant", "bad")
tdata <- data.frame(Idnumber, age, gene, score)
tdata

t(tdata)

## Lecture 8. Aggregating data 
setwd("d:\\RStatistics-Tutorial")   # to set working directory
#create a grade data frame
vartype<-c("character", "character", "character", "character", "character", "numeric","numeric", "numeric","numeric","character")
grade <- read.table("University-Fullname-full.csv", colClasses=vartype, header=TRUE, sep=",")                                      
grade
test<-grade[,c(4,5,7:9)]
test$Gender<-as.factor(test$Gender)
test$Country<-as.factor(test$Country)
test
agg <- aggregate(test, by = list(test$Gender, 
     test$Country), FUN = mean, na.rm = TRUE)

agg

#a better solution
agg <- aggregate(test[-c(1,2)], 
      by = list(Gender=test$Gender, 
      Coungry=test$Country), 
      FUN = mean, na.rm = TRUE)


agg














### Lecture 9. Descriptive statistics
setwd("d:\\RStatistics-Tutorial")   # to set working directory
#create a grade data frame
vartype<-c("character", "character", "character", "character", "character", "numeric","numeric", "numeric","numeric","character")
grade <- read.table("University-Fullname-full.csv", colClasses=vartype, header=TRUE, sep=",")                                      
grade
##Descriptive statistics with summary()
vars <- c("Math", "Physics", "Chemistry")
summary(grade[vars])



##Descriptive statistics via describe() in the Hmisc package
library(Hmisc)
vars <- c("Math", "Physics", "Chemistry")
describe(grade[vars])













### Lecture 10. Using sample() to generate a set of sample data

#Example 1:

# Create sample of 20 random integers from a vector
#with replacement
sp <- sample(1:100, 10, replace=TRUE)

print(sp)

#example 2
#sample range lies between 1 to 5
x<- sample(1:5, replace=TRUE)
#prints the samples
x

#example 3
#sample n numbers, where n larger than length of source vector
sp<- sample(1:5,10,replace=TRUE)
#prints the samples
sp


#set.seed() - set.seed function will produce the same sequence 
#when you run it.


#example 4
# Create sample of 20 observations from mtcars dataframe
#with replacement

row_vec <- sample(1:nrow(mtcars), 20, replace = TRUE)

data(mtcars)
car_sp <- mtcars[sample(1:nrow(mtcars), 10, replace = FALSE),]
car_sp

row_vec
print(mtcars[row_vec, ])


set.seed(1234)
row_vec <- sample(1:nrow(mtcars), 20, replace = TRUE)

row_vec
print(mtcars[row_vec, ])


#example 5
#creates a probability of 80% good watches an 20% effective watches.
sample (c('Good','Defective'), size=10, replace=T, prob=c(.80,.20))

  














### Lecture 11. Data Reshaping

# Transpose of a Matrix using t() 
matrix1 <- matrix(c(1:20), nrow=5, byrow=TRUE)
print("Original Matrix")
matrix1

matrix2 <- t(matrix1)
print("Transpose of the Matrix")
matrix2



# Joining Rows and Columns in Data Frame
#using cbind() or rbind()

# Cbind and Rbind function in R
name <- c("Wilson", "Dudu", "Maomao", "Shirley")
age <- c(24, 53, 62, 29)
location <- c("Molde", "Jendem", "Molde", "Jendem")

# Cbind function
familymember <- cbind(name, age, location)
print("Combining vectors into data frame using cbind ")
print(familymember)

# creating new data frame
newd <- data.frame(name=c("Mico", "Mia"),
                   age=c("28", "29"),
                   location=c("Molde", "Aukra"))

# rbind function
familymember <- rbind(familymember, newd)
print("Combining data frames using rbind ")
print(familymember)


# Merging two data frames in R
name<- c("Wilson", "Dudu", "Maomao", "Miaomiao","Mico","Mia")
age <- c(32, 20, 22, 12,8,3)
address <- c("Aukra", "Hustadvika", "Hustadvika", "Molde","Molde","Molde")

# Cbind function
family <- cbind(name, age, address)


# creating new data frame
Jiangjiang <- data.frame(name=c("Jiangjiang", "Gangdu"),
                         age= c(16,18),
                         address = c("Aukra","Molde"))

Jiangjiang

total <- merge(family, Jiangjiang, all=TRUE)
print(total)


family_data1 <- data.frame(name,age)
family_data1
family_data2 <- data.frame(name,address)
family_data2

merge(family_data1, family_data2)
merge(family_data1, family_data2, all = TRUE)


# melt and cast
library(MASS)
library(reshape2)

names(airquality) <- tolower(names(airquality))
head(airquality)    #wide form

#melting from wide form to long form
aql <- melt(airquality, id.vars = c("month", "day"))
head(aql)

aql <- melt(airquality, id.vars = c("month", "day"),
            variable.name = "climate_variable", 
            value.name = "climate_value")
head(aql)


#casting from long form to wide form
aql <- melt(airquality, id.vars = c("month", "day"))    #long form
head(aql)
aql

aqw <- dcast(aql, month + day ~ variable)
head(aqw)        #wide form again





















### Lecture 14. table function family

library(vcd)
head(Arthritis)

# one way table
mytable <- table(Arthritis$Improved)
mytable                       # counts
prop.table(mytable)           # proportions
prop.table(mytable)*100       # percents

# two way table
mytable <- xtabs(~ Treatment+Improved, data=Arthritis)
mytable  # counts

margin.table(mytable, 1)    # total counts for Treatment 
prop.table(mytable, 1)      # row proportions (rows add to 1)

margin.table(mytable, 2)    # total counts for Improved
prop.table(mytable, 2)      # column proportions (columns add to 1)

prop.table(mytable)         # cell proportions (all cells add to 1)
addmargins(mytable)         # cell counts with row and column sums
addmargins(prop.table(mytable)) # cell proportions with row and column proportions

addmargins(prop.table(mytable, 1), 2) # row proportions with row sums
addmargins(prop.table(mytable, 2), 1) # column proportions with column sums

# Listing 7.8 Two-way table using CrossTable
library(gmodels)
CrossTable(Arthritis$Treatment, Arthritis$Improved)

# Listing 7.9 Three-way contingency table
mytable <- xtabs(~ Treatment+Sex+Improved, data=Arthritis) 
mytable          
margin.table(mytable, 1)  # totals for Treatment
margin.table(mytable, 2)  # totals for Sex
margin.table(mytable, 3)  # totals for Improved
margin.table(mytable, c(1, 3)) # totals for Treatment by Improved

# Treatment by Sex for each Level of Improved
ftable(mytable)
ftable(prop.table(mytable, c(1, 2))) # proportions sum to 1 over index omitted
ftable(addmargins(prop.table(mytable, c(1, 2)), 3)) 
ftable(addmargins(prop.table(mytable, c(1, 2)), 3)) * 100





##Lecture. Environment and Scoping rule in R

library(pryr)
obj1 <- c(1,2,3)
obj2 <- c("one","two","three")

library(ggplot2)
setwd("d:\\RStatistics-Tutorial")   # to set working directory
##set colClasses in read.table() to create a data frame
vartype<-c("numeric","numeric" ,"character", "character", "character", "character", "numeric","numeric", "character")
Income <- read.table("Income.csv", colClasses=vartype, header=TRUE, sep=",")                                      
head(Income)

Income$Race<-as.factor(Income$Race)
Income$Gender<-as.factor(Income$Gender)
Income$Region<-as.factor(Income$Region)
Income$Married<-as.factor(Income$Married)
Income$Job<-as.factor(Income$Job)

# --  Creating a graph with ggplot2
library(ggplot2)

## Start building graphs

#Add geoms_ in ggplot()
#add a scatter plot of Years and Salary
ggplot(data = Income, mapping = aes(x = Years, y = Salary)) + 
  +   geom_point()



states <- as.data.frame(state.x77[,c("Murder", "Population",
                                     "Illiteracy", "Income", "Frost")])
head(states)

fit <- lm(Murder ~ Population + Illiteracy + Income + Frost, data=states)


#R environment

environment()    #active environment
ls(globalenv())   #list object in current env
ls(emptyenv())

parenvs(all=TRUE) 

#example of function scope environment
aggre <- function(a,b) {
  a + b
  }
multi_aggre <- function (a,b,n) {
  aggre(a,b) * n
  }
multi_aggre (1,2,3)



par_child <- function(a,b){
  list(current = environment(),
       par = parent.env(environment()),
       obj = ls.str(environment()))
}
par_child(1,2)









## R S3 class
# Transpose of a Matrix using t() 
mtx1 <- matrix(c(1:6), nrow=2, byrow=TRUE)
print("Matrix 1 is")
print(mtx1)

attributes(mtx1)
class(mtx1)
names(mtx1) <- c('1','2','3','4','5','6')
attributes(mtx1)



df1 <- data.frame(mtx1)

df1

vec1 <-  c("A", "B", "A","B","A","B")
attr(df1, "images") <-vec1
attributes(df1)

attr(df1, "images")
class(df1)

#generic function and methods
print.data.frame

print.factor

print.matrix   #not exist

#to show methods with generic function 'print',
#associated with different class
methods(print)

#to show methods for class 'factor', with corresponding
#generic functions
methods(class="factor")

#to show methods for class 'data.frame', with corresponding
#generic functions
methods(class="data.frame")

methods(class="matrix")


#set new class for df1

class(df1)<- 'test'

print(df1)

print.test <- function(x) {
  print("this is a test")
  
 
}

print(df1)






### Applying a Function to Each List Element

library(tidyverse)
lst <- list(
  a = c(1,2,3),
  b = c(4,5,6)
)


A <- lst %>%
  map(mean)



fun1 <- function(x) {
  if (x > 1) {
    1
  } else {
    "Less Than 1"
  }
}
fun1(5)

fun1(0.5)


lst <- list(.5, 1.5, .9, 2)

B <- map(lst, fun1)








