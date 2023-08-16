#course: Beginning using R for data analysis
#by https://www.youtube.com/@easydatascience2508
#Section 2: R data structure, create datasets
#------------------------------------------------------------#

# 1. vector
## create vectors
a <- c(1, 2, 5, 3, 6, -2, 4) # numeric
typeof(a)
b <- c("one", "two", "three") # character
typeof(b)

c <- c(TRUE, FALSE, TRUE, FALSE, TRUE, TRUE) # logical


#seq() function for creating
# a sequence of continuous values.
# length.out defines the length of vector.
Y <- seq(1, 10, length.out = 5) 
cat('using seq() function', Y, '\n')

 

# Accessing vector elements
a <- c("a", "b", "c", "d", "e", "f")
a[2]   #2nd element
a[c(2, 4, 6)]   #2nd, 4th, 6th elements
a[1:5]  #first to fifth elements


#Modifying a vector
# Creating a vector
X <- c(2, 7, 9, 7, 8, 2)

# modify a specific element
X[3] <- 1
X[2] <-9
cat('vector x is', X, '\n')

# Modify using different conditions
X[X>5] <- 0
cat('now x is no more than 5', X, '\n')

# creating a new vector based on the existent
# the position or elements.
X <- X[c(3, 2, 1)]
cat('x now has only 3 elements', X)


#Deleting a vector
# Creating a Vector
M <- c(8, 10, 2, 5)

# set NULL to the vector
M <- NULL          #alternatively you can use rm(M)
cat('Output vector', M)







###2. Mxtrix
## Creating matrices
# Creates a 5 × 6 matrix
y <- matrix(1:30, nrow = 5, ncol = 6) 
y
cells <- c(31, 36, 34, 68)
rowname <- c("N1", "N2")
colname <- c("L1", "L2")

#2 × 2 matrix filled by rows
mymatrix <- matrix(cells,
  nrow = 2, ncol = 2, byrow = TRUE,
  dimnames = list(rowname, colname))

#2 × 2 matrix filled by columns
mymatrix <- matrix(cells,
  nrow = 2, ncol = 2, byrow = FALSE,
  dimnames = list(rowname, colname))


#Select matrix elements,Using matrix subscripts
x <- matrix(1:20, nrow = 4) #create a 4 x 5 matrix
x
x[1, ]       #elements in the first row are selected
x[, 3]      #the elements in the third column
x[2, 4]   ##the element in the second row and fourth column
x[1, c(4, 5)]  #the elements in the first row and the fourth and fifth columns


## Matrix having 3 rows and 3 columns
# filled by a single constant 5
print(matrix(5, 3, 3))

# Diagonal matrix having 3 rows and 3 columns
# filled by array of elements (5, 3, 3)
print(diag(c(5, 3, 3), 3, 3))


# Create a 3x3 matrix
A = matrix(
  c(1, 2, 3, 4, 5, 6, 7, 8, 9),
  nrow = 3,            
  ncol = 3,            
  byrow = TRUE         
)
cat("The 3x3 matrix:\n")
print(A)

cat("Dimension of the matrix:\n")
print(dim(A))

cat("Number of rows:\n")
print(nrow(A))


cat("Number of columns:\n")
print(ncol(A))

cat("Number of elements:\n")
print(length(A))
# OR
print(prod(dim(A)))



# access columns in metrics

# Create a 3x3 matrix
A = matrix(
  c(1, 2, 3, 4, 5, 6, 7, 8, 9),
  nrow = 3,            
  ncol = 3,            
  byrow = TRUE         
)
cat("The 3x3 matrix:\n")
print(A)

# Accessing first and second column
cat("Accessing first and second column\n")
print(A[, 1:2])












### 3.Array
## Creating an array
d1 <- c("N1", "N2","N3")   #label
d2 <- c("M1", "M2", "M3", "M4")
d3 <- c("L1", "L2", "L3", "L4","L5")
#create an array of dimension(3*4*5)
A <- array(1:60, c(3, 4, 5), dimnames = list(d1, d2, d3))
A


A[1,,]
A[,2,]
A[1,3,]
A[1,2,3]










## 4. Data frame
## Creating a data frame
ID <- c(3, 4, 5, 6) 
age <- c(15, 14, 18, 12)
blood <- c("Type5", "Type6", "Type5", "Type6")
status <- c("Poor", "Improved", "Excellent", "Poor")
pdata <- data.frame(ID, age, blood, status)
pdata

# Identifying elements of a data frame
pdata[1:2]  #first and second variable of data frame
pdata$age   #varaible of age of data frame
pdata[c("blood", "status")] #variable of "blood" and "status" of data frame
str(pdata)   #show information of data frame
pdata[,2]    #select 2nd variable of all observations
pdata[1,]    #select all variables of 1st observation



pdata['age'] <- c(16,32,28,19)

pdata




















## 5. List
a <- "New List"
b <- c(21, 13, 42)
c <- matrix(1:100, nrow = 10)
d <- c("wang", "zhang", "li")

ID <- c(3, 4, 5, 6) 
age <- c(15, 14, 18, 12)
blood <- c("Type5", "Type6", "Type5", "Type6")
status <- c("Poor", "Improved", "Excellent", "Poor")
pdata <- data.frame(ID, age, blood, status)
pdata

newlist <- list(title = a, sum =b, c, d, e=pdata)
newlist
newlist[[2]]
newlist[["sum"]]
newlist$sum
newlist$e 
newlist[['e']]














## 6. Using factors
ID <- c(3, 4, 5, 6) 
age <- c(15, 14, 18, 12)
blood <- c("Type5", "Type6", "Type5", "Type6")
status <- c("Poor", "Improved", "Excellent", "Poor")
# to set vector ‘blood’ as an factor without order
blood <- factor(blood)
# to set vector ‘status’ as ordered factor
status <- factor(status, order = TRUE)
pdata <- data.frame(ID, age, blood, status)   # to create a data frame
str(pdata)    #to show structure of data frame 
summary(pdata)
































## 7.create datasets, read.table() to read csv file
setwd("d:\\RStatistics-Tutorial")   # to set working directory

#use read.table() to read a csv file to create a data frame
grade <- read.table("University-Fullname-full.csv", header=TRUE, row.names="StudentID", sep=",")
grade
str(grade)   #show structure of data frame


#use read.table() to read a csv file to create a data frame
grade <- read.csv("University-Fullname-full.csv")
grade

#set column variable type in read.table()
vartype<-c("character", "character", "character", "character", "character", "numeric","numeric", "numeric","numeric","character")
grade <- read.table("University-Fullname-full.csv", colClasses=vartype, header=TRUE, sep=",")                                      
grade
str(grade)









## 9.Read excel file
#using read_xlsx
library(readxl)
workbook <- "D:\\RStatistics-Tutorial\\cars.xlsx"
mydataframe1 <- read_xlsx(workbook, 1)
mydataframe2 <- read_xlsx(workbook, 2)













## 10.Using with()
setwd("d:\\RStatistics-Tutorial")   # to set working directory
#set colClasses in read.table() to create a data frame
vartype<-c("character", "character", "character", "character", "character", "numeric","numeric", "numeric","numeric","character")
grade <- read.table("University-Fullname-full.csv", colClasses=vartype, header=TRUE, sep=",")                                      
grade

#grade<-grade[complete.cases(grade),] if there are missing value
#summary of math and physics
summary(grade$Math)
#correlation between Math and Physics grades
cor(grade$Math,grade$Physics)

#Using with
with(grade, {
  summary(Math)
  cor(Math, Physics)
})


#assignments exist only within the function brackets
with(grade, {
  test <- summary(Math)
  test
})


#not work if we refer to the object created inside with()
test


#use special assignment operator (<<-) to realize
with(grade, {
  summary(Math)
  cor(Math,Physics)
  test<<- summary(Math)
})
test









## 11. Object functions
##Useful functions for object
setwd("d:\\RStatistics-Tutorial")   # to set working directory
#set colClasses in read.table() to create a data frame
vartype<-c("character", "character", "character", "character", "character", "numeric","numeric", "numeric","numeric","character")
grade <- read.table("University-Fullname-full.csv", colClasses=vartype, header=TRUE, sep=",")                                      
grade


#Useful functions for object
#length()
length(grade)    #length of a data frame, not oftenly used
test<-grade$Age  #a vector
length(test)     #length of a vector


#dim()
dim(grade)    #size of a data frame

#str()
str(grade)    #structure of a data frame

#class()
class(grade)  #class of a data frame
class(test)   #class of a vector


#mode()
mode(grade)   #mode of a data frame
mode(test)    #mode of a vector

#names()
names(grade)  #names of variables of a data frame

#c()
test2<-c(test, 20, 20)  #combines extra element to a vector
test2

#cbind()  Combines data frames across columns
gradepart<-grade[,c(7:9)]
names(gradepart)<-c("v1","v2","v3")
test3<-cbind(grade,gradepart )
test3

#rbind()  Combines data frames across rows
test4<-grade[1:10,]
test5<-rbind(grade, test4)
test5


#head()
head(grade)  #Lists the first part of a data frame

#tail()
tail(grade)  #Lists the last part of an data frame


#ls()
ls()  #Lists objects in the current working environment

#rm()
rm(test5)  #Deletes test5

rm(list=ls())  ##removes most objects from the working environment

#seq(from, to, by)	#Generates a sequence vector
seq(1,10)     #generate a vector from 1 to 10
seq(1,10,2)    #generate a vector 1,3,5,7,9

#rep(X, n)	#Repeats x n times and generate a  vector
rep(1,5)    #generate a vector 1,1,1,1,1

#cut(X, n)	#Divides the continuous variable x into a factor with n 
#levels
vartype<-c("character", "character", "character", "character", "character", "numeric","numeric", "numeric","numeric","character")
grade <- read.table("University-Fullname-full.csv", colClasses=vartype, header=TRUE, sep=",")                                      
grade
grade$Age<-cut(grade$Age,3)    #transform Age to a factor variable with 3 levels











### 12. Create, index and modify Data Frame
## Creating a data frame
ID <- c(3, 4, 5, 6) 
age <- c(15, 14, 18, 12)
blood <- c("Type5", "Type6", "Type5", "Type6")
status <- c("Poor", "Improved", "Excellent", "Poor")
pdata <- data.frame(ID, age, blood, status)
pdata

# Identifying elements of a data frame
#note that index stars at 1 in R, not zero
pdata[1:2]  #first and second variable of data frame
pdata$age   #varaible of age of data frame
pdata[c("blood", "status")] #variable of "blood" and "status" of data frame
str(pdata)   #show information of data frame
pdata[,2]    #select 2nd variable of all observations
pdata[1,]    #select all variables of 1st observation


# create a data frame 
stats <- data.frame(player=c('A', 'B', 'C', 'D'),
                    runs=c(100, 200, 408, NA),
                    wickets=c(17, 20, NA, 5))

print("stats Dataframe")
stats



# fetch data in certain column
stats["player"]
print("----------")

# fetch certain rows and columns
stats[1:3,2]        #first three rows and second column




#Modify the Data Frame:
#using the same indexing mechanism
#Adding a column 


## Add new rows or columns, using rbind(), cbind()

#Removing a row and column from a Data Frame

#To remove a row and column from a data frame using the below syntax

#  remove row from a dataframe
# deletes the row of specified row number 
# dataframeName <- dataframeName[-rowNumber,]


# remove column from a dataframe
# dataframeName$columnName <- NULL


# create a data frame 
stats <- data.frame(player=c('A', 'B', 'C', 'D'),
                    runs=c(100, 200, 408, NA),
                    wickets=c(17, 20, NA, 5))

cat("stats Dataframe\n")
stats

# modify the data
stats[4,"runs"] <- 274
cat("\nModified dataframe\n")
stats

# added new row
cat("\nDataFrame after a row insertion\n")
stats<-rbind(stats, c('E',500,1))
print(stats)

# added new column
cat("\nDataFrame after a new column insertion\n")
stats<-cbind(stats,matches=c(15,32,8,99,NA))
print(stats)

# delete the first row
stats<-stats[-1,]

# deleted the wickets column
stats$wickets<-NULL

cat("\nDataframe after deletion of a row & column\n")
stats

#easiest way to add a new column
stats$score <- c(100, 99, 98, 97)

stats






























### Lecture 13.create, index and modify list

## Example 1
## create a list
a <- "New List"
b <- c(21, 13, 42)
c <- matrix(1:100, nrow = 10)
d <- c("wang", "zhang", "li")
newlist <- list(title = a, sum =b, c, d)

#Indexing a list
newlist
newlist[[2]]
newlist[["sum"]]
newlist$sum


#example 2
# vector with names
name1=c("Wilson","Dudu","Maomao","Miaomiao")

# vector age
age1=c(32,20,22,10)

# address vector
address1=c("Aukra","Molde","Molde","Aukra")

# pass these vectors as inputs to the list

familymember1=list(name1= name1,age1= age1,address1= address1)
print(familymember1)



## Appending Data to the List
#Appending to a list means adding a value to the last of 
#an already existing list.
#example 3
name2=c("Mico","Mia")

# vector with age
age2=c(7,3)

# address vector
address2=c("Aukra","Aukra")

#create list2
familymember2=list(name2= name2,age2= age2,address2= address2)
print(familymember2)




# append list 1 and list 2
familymember <- append(familymember1,familymember2)

familymember

familymember[['address2']]
familymember[[6]]


append(familymember1,familymember2[[1]])   



##Modifying the list elements
familymember[[6]][[1]] <- 'Molde'

familymember[[6]] <- c('Oslo','Oslo')    

familymember


##remove element of a list
familymember[[6]] <- NULL

familymember
























### Lecture 14. Random number generation in R

# Create a vector with random values in R

# sample() function
# to create a vector of 10 random integer sequence
vec_NoR <- sample(1 : 10, size = 10, replace = F)     #no replacement

vec_R <- sample(1 : 10, size = 15, replace = T)     #with replacement

#sample() with prob option
# generate a vector with 200 elements with 1 to 5,with different 
# generating probabilities from each value

vec_pro <- sample(1:5, size = 200, replace = T,
       prob = c(0.02, 0.2, 0.25, 0.5, 0.9))


table(vec_pro)


# generate random numbers from various statistical distributions

#normal distribution

vec_norm1 <- rnorm(10)  #standard normal distribution (mean=0, sd=1)

#normal variates with mean 32 sd 2
vec_norm2 <- rnorm(10, mean=32, sd=2)



# generate matrix of random number

#a matrix of integer from 1 to 32 in 4 rows 8 columns
mat_R <- matrix(sample(1:32,rep=F), nrow=4)


# a matrix of 50 normal variates with mean 32 sd 2
mat_norm <- matrix(rnorm(50,mean=32, sd=2),nrow=10)
mat_norm 



# random number of uniform distribution

vec_uni_1 <- runif(25)   #25 uniform variates between 0 and 1
vec_uni_1

#10 uniform variates between 3 and 8
vec_uni_2 <- runif(10, min=3, max=8) 
vec_uni_2


#generate 8 random variables of binomial distribution where
# n = 8, p = 0.2
rbinom(8, size = 10, prob = 0.2)


#generate a matrix (20 rows) of 100 random variables of binomial 
#distribution where size = 10, p = 0.2
matrix(rbinom(100, size = 10, prob = 0.2),nrow=20)




# to crate random number of poisson distribution
# a vectorof 20 poisson variates with mean 10
#Poission distribution mean and variance have same value
rpois(20, 10)

#a matrix of 100 poisson variates with mean 10
matrix(rpois(100, 10),nrow=20)



#set.seed() to make generation reproducible
set.seed(1)

#create matrix with 10 random numbers between 1 and 20
random_matrix <- matrix(runif(n=10, min=1, max=20), nrow=5)

#view matrix
random_matrix






## 7.Tibble
#create a tibble from an existing data frame.
library(tibble)
str(mtcars)
mtcars <- as_tibble(mtcars)
str(mtcars)
head(mtcars)


#create a tibble using tibble()
name <- c("surya", "sai", "Nihith", "prakash", "vikas", "mayur")
marks_in_Math <- c(91, 85, 92, 89, 90, 93)
marks_in_Java <- c(89, 91, 88, 91, 89, 87)
Fav_color <- c("Pink", "Red", "Yellow", "Green", "White", "Blue")
students <- tibble(name, marks_in_Math, marks_in_Java, Fav_color)
print(students)


