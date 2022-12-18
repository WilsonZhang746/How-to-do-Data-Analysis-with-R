#course: Beginning using R for data analysis
#by https://www.youtube.com/@easydatascience2508
#Section 2: R data structure, create datasets
#------------------------------------------------------------#

setwd("d:/")   # to set working directory

#use read.table() to read a csv file to create a data frame
grade <- read.table("University-Fullname-full.csv", header=TRUE, row.names="StudentID", sep=",")
grade



## create vectors
a <- c(1, 2, 5, 3, 6, -2, 4) # numeric
b <- c("one", "two", "three") # character
c <- c(TRUE, FALSE, TRUE, FALSE, TRUE, TRUE) # logical

# referring to elements of vectors
a <- c("a", "b", "c", "d", "e", "f")
a[2]   #2nd element
a[c(2, 4, 6)]   #2nd, 4th, 6th elements
a[1:5]  #first to fifth elements



## Creating matrices
y <- matrix(1:30, nrow = 5, ncol = 6) # Creates a 5 × 6 matrix
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


## Creating an array
d1 <- c("N1", "N2","N3")   #label
d2 <- c("M1", "M2", "M3", "M4")
d3 <- c("L1", "L2", "L3", "L4","L5")
#create an array of dimension(3*4*5)
A <- array(1:60, c(3, 4, 5), dimnames = list(d1, d2, d3))
A
A[1,2,3]



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



## Using factors
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



## Creating a list
a <- "New List"
b <- c(21, 13, 42)
c <- matrix(1:100, nrow = 10)
d <- c("wang", "zhang", "li")
newlist <- list(title = a, sum =b, c, d)
newlist
newlist[[2]]
newlist[["sum"]]
newlist$sum


##create datasets, read.table()
setwd("d:/")   # to set working directory

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



##Using with()
setwd("d:/")   # to set working directory
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



##Object functions
##Useful functions for object
setwd("d:/")   # to set working directory
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
grade$Age<-cut(grade$Age,3)    #transform Age to a factor variable with 3 levels

