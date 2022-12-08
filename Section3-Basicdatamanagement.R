#Course: Beginning using R for data analysis
#Section 3: Basic data management

setwd("d:/")   # to set working directory
##set colClasses in read.table() to create a data frame
vartype<-c("character", "character", "character", "character", "character", "numeric","numeric", "numeric","numeric","character")
grade <- read.table("University-Fullname-full.csv", colClasses=vartype, header=TRUE, sep=",")                                      
grade


##Creating new variables
grade$total_grade <- grade$Math + grade$Physics + grade$Chemistry
grade$mean_grade <- (grade$Math + grade$Physics + grade$Chemistry)/3

grade <- transform(grade,total_grade = Math + Physics + Chemistry, 
                   mean_grade = (Math + Physics + Chemistry)/3)




## recode variables
vartype<-c("character", "character", "character", "character", "character", "numeric","numeric", "numeric","numeric","character")
grade <- read.table("University-NA.csv", colClasses=vartype, header=TRUE, sep=",")                                      
grade
str(grade)
grade$Math[grade$Math == 999] <- NA
grade$Physics[grade$Physics == 999] <- NA
grade$Chemistry[grade$Chemistry == 999] <- NA
grade$Date[grade$Date == "999"] <- NA
is.na(grade[,7:10])

#rcode age to categorical
grade$agecat[grade$Age < 31] <- "Young" 
grade$agecat[grade$Age >= 31] <- "MiddleAged"

#alternative method
grade <- within(grade,{
  agecat <- NA
  agecat[Age < 31] <- "Young"
  agecat[Age >= 31] <- "MiddleAged"})

grade


##rename variables in data frame
names(grade)    #to show current variable names
names(grade)[10] <- "testDate"





## Handling missing value
#recoding determined values to missing. 
vartype<-c("character", "character", "character", "character", "character", "numeric","numeric", "numeric","numeric","character")
grade <- read.table("University-NA.csv", colClasses=vartype, header=TRUE, sep=",")                                      
grade
grade$Math[grade$Math == 999] <- NA
grade$Physics[grade$Physics == 999] <- NA
grade$Chemistry[grade$Chemistry == 999] <- NA 
grade$Date[grade$Date == "999"] <- NA
#identifying observations that contain missing values
is.na(grade[,7:10])   
#Excluding missing values from analyses
sum(grade$Physics, na.rm=TRUE)

#remove any observation with missing data
test <- na.omit(grade)    
test


##working with Date value
#default format for inputting is yyyy-mm-dd
testdates <- as.Date(c("2008-09-21", "2009-01-16"))
testdates
#reads the data using a mm/dd/yy format
grade$Date<- as.Date(grade$Date, "%m/%d/%y")
grade$Date

Sys.Date()    ##returns today’s date
date() 		#returns the current date and time

#outputs date in a specific format
today <- Sys.Date()
format(today, format="%b %d %y")
format(today, format="%A")

#arithmetic operations with Date value
date1 <- as.Date("2022-01-16")
date2 <- as.Date("2022-07-29")
days <- date2 - date1
days

#calculate a time interval in different units
difftime(date2, date1, units="weeks")
difftime(date2, date1, units="mins")


## Type conversion
is.numeric(grade$Age)
is.vector(grade$First)
test <- as.character(grade$Age)
test
is.numeric(test)
is.vector(test)
is.character(test)



##sorting
#sorted grade from youngest student to oldest student
test <- grade[order(grade$Age),]
test
#sorts by Gender first, then by Age within each gender
test <- grade[order(grade$Gender, grade$Age),]
test

#sorts by Gender first, then by Age with each gender
#from old to young student
test <- grade[order(grade$Gender, -grade$Age),]
test



##Merging and adding datasets
#Adding columns to a data frame, using merge()
#when two data frame has common variable and its value
Biology<-c(72,87,92,67,99,100,68,85,74,79,34,49,58,84,89,67,78,59,97,48)
mdata<-data.frame(grade$StudentID, Biology)
names(mdata)<-c("StudentID","Biology")
test<-merge(grade, mdata, by="StudentID")

#Horizontal concatenation with cbind()
#when two data frames have same number of observations
English<-Biology
hdata<-data.frame(Biology, English)
names(hdata)<-c("Biology", "English")
test<-cbind(grade, hdata)

#Adding rows to a data frame
#when two data frames have same variables
rdata<-grade[1:5,]
test<-rbind(grade,rdata)



##Subsetting datasets
#Selecting observations with a list of variables
test<-grade[,c(7:9)]
test<-grade[,c("Math","Physics","Chemistry")]

#if one index is included, then subsetting the column
grade[8]   #grade of Physics

#dropping variable
#dropping Math and Chemistry
dvars <- names(grade) %in% c("Math", "Chemistry")
test <- grade[!dvars]

#you can achieve this with 
test <- grade[c(-7,-9)]

#you can try this too.
grade$Math <-NULL
grade$Chemistry <- NULL

#Selecting observations
test<-grade[3:6,]  #observations 3-6

#to select Male students and younger than 25 years old.
test <- grade[grade$Gender=="Male" & grade$Age < 25,]

#to select grades tested from October 2008 to March 2009
grade$Date <- as.Date(grade$Date, "%m/%d/%y")
startdate <- as.Date("2008-10-01")
enddate <- as.Date("2009-02-28")
test <- grade[which(grade$Date >= startdate & grade$Date <= enddate),]

#using subset()
#to select Male students younger than 25 years old, and their Math and Chemistry grades.
test <- subset(grade, Gender=="Male" & Age <25, select=c(Math, Chemistry))