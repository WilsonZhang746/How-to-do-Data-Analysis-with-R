#course: Beginning using R for data analysis
#by https://www.youtube.com/@rprogramming32
#Section 2: R data structure, create datasets
#------------------------------------------------------------#
#Section 3: Basic data management

setwd("d:\\RStatistics-Tutorial")    # to set working directory
##set colClasses in read.table() to create a data frame
vartype<-c("character", "character", "character", "character", "character", "numeric","numeric", "numeric","numeric","character")
grade <- read.table("University-Fullname-full.csv", colClasses=vartype, header=TRUE, sep=",")                                      
grade


##2. Creating new variables
grade$total_grade <- grade$Math + grade$Physics + grade$Chemistry
grade$mean_grade <- (grade$Math + grade$Physics + grade$Chemistry)/3

str(grade)

#Alternative way using transform
grade <- transform(grade,total_grade = Math + Physics + Chemistry, 
                   mean_grade = (Math + Physics + Chemistry)/3)










## 3. recode variables
#read csv files into a data frame
setwd("d:\\RStatistics-Tutorial")    # to set working directory
vartype<-c("character", "character", "character", "character", "character", "numeric","numeric", "numeric","numeric","character")
grade <- read.table("University-NA.csv", colClasses=vartype, header=TRUE, sep=",")                                      
grade
str(grade)

grade$Math[grade$Math == 999] <- NA
grade$Physics[grade$Physics == 999] <- NA
grade$Chemistry[grade$Chemistry == 999] <- NA
grade$Date[grade$Date == "999"] <- NA
is.na(grade[,7:10])

#recode age to categorical
grade$agecat[grade$Age < 31] <- "Young" 
grade$agecat[grade$Age >= 31] <- "MiddleAged"

#alternative method
vartype<-c("character", "character", "character", "character", "character", "numeric","numeric", "numeric","numeric","character")
grade <- read.table("University-NA.csv", colClasses=vartype, header=TRUE, sep=",")                                      
grade
str(grade)

grade <- within(grade,{
  agecat <- NA
  agecat[Age < 31] <- "Young"
  agecat[Age >= 31] <- "MiddleAged"})

grade

str(grade)









## 4.rename variables in data frame
setwd("d:\\RStatistics-Tutorial")    # to set working directory

#to read csv file and create a data frame
vartype<-c("character", "character", "character", "character", "character", "numeric","numeric", "numeric","numeric","character")
grade <- read.table("University-NA.csv", colClasses=vartype, header=TRUE, sep=",")                                      
grade
str(grade)

names(grade)    #to show current variable names
names(grade)[10] <- "testDate"      #set new name for 10th column
names(grade)
head(grade)



#using plyr library's rename function
library(plyr) 

# Creating a Data Frame 
df<-data.frame(row1 = 0:2, row2 = 3:5, row3 = 6:8) 
print("Original Data Frame") 
print(df) 
print("Modified Data Frame") 

# Renaming Data Frame 
rename(df, c("row1"="one", "row2"="two", "row3"="three")) 










## 5. Handling missing value
#recoding determined values to missing. 
setwd("d:\\RStatistics-Tutorial")      # to set working directory
vartype<-c("character", "character", "character", "character", "character", "numeric","numeric", "numeric","numeric","character")
grade <- read.table("University-NA.csv", colClasses=vartype, header=TRUE, sep=",")                                      
grade

str(grade)

#recode value as NA
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
str(test)











## 6. working with Date value
#default format for inputting is yyyy-mm-dd
testdates <- as.Date(c("2008-09-21", "2009-01-16"))
testdates
#reads the data using a mm/dd/yy format
setwd("d:\\RStatistics-Tutorial")    # to set working directory
vartype<-c("character", "character", "character", "character", "character", "numeric","numeric", "numeric","numeric","character")
grade <- read.table("University-NA.csv", colClasses=vartype, header=TRUE, sep=",")                                      
grade
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














## 7. Type conversion
setwd("d:\\RStatistics-Tutorial")    # to set working directory
vartype<-c("character", "character", "character", "character", "character", "numeric","numeric", "numeric","numeric","character")
grade <- read.table("University-NA.csv", colClasses=vartype, header=TRUE, sep=",")                                      
grade
str(grade)

is.numeric(grade$Age)
is.vector(grade$First)
test <- as.character(grade$Age)    #convert to character
test
is.numeric(test)
is.vector(test)
is.character(test)


#convert Gender as factor
grade$Gender <- as.factor(grade$Gender)

str(grade)













##8. sorting
setwd("d:\\RStatistics-Tutorial")    # to set working directory
vartype<-c("character", "character", "character", "character", "character", "numeric","numeric", "numeric","numeric","character")
grade <- read.table("University-NA.csv", colClasses=vartype, header=TRUE, sep=",")                                      
grade
str(grade)

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








## 9. Merging and combining datasets
#Adding columns to a data frame, using merge()
#when two data frame has common variable and its value
setwd("d:\\RStatistics-Tutorial")    # to set working directory
vartype<-c("character", "character", "character", "character", "character", "numeric","numeric", "numeric","numeric","character")
grade <- read.table("University-NA.csv", colClasses=vartype, header=TRUE, sep=",")                                      
grade
str(grade)

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

test







##10. Subsetting datasets
setwd("d:\\RStatistics-Tutorial")    # to set working directory
vartype<-c("character", "character", "character", "character", "character", "numeric","numeric", "numeric","numeric","character")
grade <- read.table("University-NA.csv", colClasses=vartype, header=TRUE, sep=",")                                      
grade
str(grade)

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
setwd("d:\\RStatistics-Tutorial")    # to set working directory
vartype<-c("character", "character", "character", "character", "character", "numeric","numeric", "numeric","numeric","character")
grade <- read.table("University-NA.csv", colClasses=vartype, header=TRUE, sep=",")                                      
grade
test <- subset(grade, Gender=="Male" & Age <25, select=c(Math, Chemistry))












### 11. Modify Data using with() Function

# R program to modify data of an object

# Calling predefined data set
BOD

# Calling with() function
#calculation occurs inside with()
with(BOD, 
     {BOD$demand <- BOD$demand + 1
     print(BOD$demand)}
     )

with(BOD, 
     {demand <- demand + 1
     print(demand)}
)

#the original dataframe has not been changed
BOD     

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
  print(summary(Math))
  print(cor(Math, Physics))
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

with(grade, {
  grade$totalscore <- Math + Physics + Chemistry
  print(grade$totalscore)
  grade <<- grade
})

grade






















### 12. Modify dataframes with transform() Function

# Create example data frame
familymember <- data.frame( name=c("Wilson","Dudu","Maomao","Miaomiao","Mico","Mia"),
                    age=c(32,20,22, 12,8,3))

familymember

# Apply transform function
familymember <- transform(familymember,age = age + 1)  


# Print data      

print(familymember)



setwd("d:\\RStatistics-Tutorial")    # to set working directory
##set colClasses in read.table() to create a data frame
vartype<-c("character", "character", "character", "character", "character", "numeric","numeric", "numeric","numeric","character")
grade <- read.table("University-Fullname-full.csv", colClasses=vartype, header=TRUE, sep=",")                                      
grade


##Creating new variables
grade$total_grade <- grade$Math + grade$Physics + grade$Chemistry
grade$mean_grade <- (grade$Math + grade$Physics + grade$Chemistry)/3

grade

#using transform()
vartype<-c("character", "character", "character", "character", "character", "numeric","numeric", "numeric","numeric","character")
grade <- read.table("University-Fullname-full.csv", colClasses=vartype, header=TRUE, sep=",")                                      
grade

grade <- transform(grade,total_grade = Math + Physics + Chemistry, 
                   mean_grade = (Math + Physics + Chemistry)/3)


grade






















### 13. Difference between with() and within() function


## using with()
# R program to modify data of an object

# Calling predefined data set
BOD

# Calling with() function
#calculation occurs inside with()
with(BOD, 
     {BOD$demand <- BOD$demand + 1
     print(BOD$demand)}
)
BOD


with(BOD, 
     {demand <- demand + 1
     print(demand)}
)

#the original dataframe has not been changed
BOD     

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
  print(summary(Math))
  print(cor(Math, Physics))
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

with(grade, {
  grade$totalscore <- Math + Physics + Chemistry
  print(grade$totalscore)
  grade <<- grade
})

grade




# within()

# Creating a data frame
setwd("d:\\RStatistics-Tutorial")    # to set working directory
##set colClasses in read.table() to create a data frame
vartype<-c("character", "character", "character", "character", "character", "numeric","numeric", "numeric","numeric","character")
grade <- read.table("University-Fullname-full.csv", colClasses=vartype, header=TRUE, sep=",")                                      
grade

# both new variables are created for dataframe
grade <- within(grade,{
  total_grade <- Math + Physics + Chemistry
  mean_grade <- (Math + Physics + Chemistry)/3
  })

grade


## same example, if we use with(),th result is not wanted. 
setwd("d:\\RStatistics-Tutorial")    # to set working directory
##set colClasses in read.table() to create a data frame
vartype<-c("character", "character", "character", "character", "character", "numeric","numeric", "numeric","numeric","character")
grade <- read.table("University-Fullname-full.csv", colClasses=vartype, header=TRUE, sep=",")                                      
grade


grade <- with(grade,{
  total_grade <- Math + Physics + Chemistry
  mean_grade <- (Math + Physics + Chemistry)/3
})

#now grade is then a new created vector, same as mean_grade
grade

