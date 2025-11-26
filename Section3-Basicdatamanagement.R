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
grade$Date
grade$Date<- as.Date(grade$Date, "%m/%d/%y")
grade$Date

Sys.Date()    ##returns today’s date
date() 		#returns the current date and time

#outputs date in a specific format
today <- Sys.Date()
format(today, format="%b %d %y")
format(today, format="%A")

#arithmetic operations with Date value
date1 <- as.Date("2024-01-16")
date2 <- as.Date("2023-07-29")
days <- date2 - date1
days

#calculate a time interval in different units
difftime(date1, date2, units="weeks")
difftime(date1, date2, units="mins")














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

head(grade)












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





###8-b Dropping variables
setwd("d:\\RStatistics-Tutorial")    # to set working directory
vartype<-c("character", "character", "character", "character", "character", "numeric","numeric", "numeric","numeric","character")
grade <- read.table("University-NA.csv", colClasses=vartype, header=TRUE, sep=",")                                      
head(grade)
str(grade)

#drop math and physics variables method 1
exvar1 <- names(grade) %in% c("Math","Physics")
newgrade1 <- grade[!exvar]
head(newgrade1)


#method 2
newgrade2 <- grade[c(-7,-8)]
head(newgrade2)


#method 3
newgrade3 <- grade
newgrade3$Math <-newgrade3$Physics <- NULL
head(newgrade3)









### 8-C, selecting variables
setwd("d:\\RStatistics-Tutorial")    # to set working directory
vartype<-c("character", "character", "character", "character", "character", "numeric","numeric", "numeric","numeric","character")
grade <- read.table("University-NA.csv", colClasses=vartype, header=TRUE, sep=",")                                      
head(grade)
str(grade)

names(grade)
#select variables, method 1
new_df1 <- grade[c(2,3,7,8,9)]
head(new_df1)


#select variables, method 2
new_df2 <- grade[c("First","Last","Math","Physics","Chemistry")]
head(new_df2)


#select variables, method 3
new_df3 <- grade[c(-1,-4,-5,-6,-10)]
head(new_df3)


#select variables, method 4
library(dplyr)
new_df4 <- select(grade,First,Last,Math,Physics,Chemistry)
head(new_df4)






###8-d, selecting observations
setwd("d:\\RStatistics-Tutorial")    # to set working directory
vartype<-c("character", "character", "character", "character", "character", "numeric","numeric", "numeric","numeric","character")
grade <- read.table("University-NA.csv", colClasses=vartype, header=TRUE, sep=",")                                      
head(grade)


testdf <- grade[1:5,]
testdf

testdf <- grade[(grade$Gender == "Male") & (grade$Age >=23) ,]
testdf


grade$Date <- as.Date(grade$Date, "%m/%d/%y") 
date1 <- as.Date("2008-06-01") 
date2 <- as.Date("2008-12-31") 
testdf <- grade[which(grade$Date >= date1 & 
                            grade$Date <= date2),]

testdf







## 9. Merging and combining datasets
#Adding columns to a data frame, using merge()
#when two data frame has common variable and its value
setwd("d:\\RStatistics-Tutorial")    # to set working directory
vartype<-c("character", "character", "character", "character", "character", "numeric","numeric", "numeric","numeric","character")
grade <- read.table("University-NA.csv", colClasses=vartype, header=TRUE, sep=",")                                      
head(grade)
str(grade)

Biology<-c(72,87,92,67,99,100,68,85,74,79,34,49,58,84,89,67,78,59,97,48)
mdata<-data.frame(grade$StudentID, Biology)
names(mdata)<-c("StudentID","Biology")
test<-merge(grade, mdata, by="StudentID")
head(test)
#Horizontal concatenation with cbind()
#when two data frames have same number of observations
English<-Biology
hdata<-data.frame(Biology, English)
names(hdata)<-c("Biology", "English")
test<-cbind(grade, hdata)
head(test)

#Adding rows to a data frame
#when two data frames have same variables
rdata<-grade[1:5,]
test<-rbind(grade,rdata)
head(test)







##10. Subsetting datasets
setwd("d:\\RStatistics-Tutorial")    # to set working directory
vartype<-c("character", "character", "character", "character", "character", "numeric","numeric", "numeric","numeric","character")
grade <- read.table("University-NA.csv", colClasses=vartype, header=TRUE, sep=",")                                      
head(grade)
str(grade)

#Selecting observations with a list of variables
test<-grade[,c(7:9)]
head(test)
test<-grade[,c("Math","Physics","Chemistry")]
head(test)

#if one index is included, then subsetting the column
grade[8]   #grade of Physics

#dropping variable
#dropping Math and Chemistry
dvars <- names(grade) %in% c("Math", "Chemistry")
test <- grade[!dvars]
head(test)

#you can achieve this with 
test <- grade[c(-7,-9)]
head(test)

#you can try this too.
grade$Math <-NULL
grade$Chemistry <- NULL

#Selecting observations
test<-grade[3:6,]  #observations 3-6
test

#to select Male students and younger than 25 years old.
test <- grade[grade$Gender=="Male" & grade$Age < 25,]
test

#to select grades tested from October 2008 to March 2009
grade$Date <- as.Date(grade$Date, "%m/%d/%y")
startdate <- as.Date("2008-10-01")
enddate <- as.Date("2009-02-28")
test <- grade[which(grade$Date >= startdate & grade$Date <= enddate),]
test
#using subset()
#to select Male students younger than 25 years old, and their Math and Chemistry grades.
setwd("d:\\RStatistics-Tutorial")    # to set working directory
vartype<-c("character", "character", "character", "character", "character", "numeric","numeric", "numeric","numeric","character")
grade <- read.table("University-NA.csv", colClasses=vartype, header=TRUE, sep=",")                                      
test <- subset(grade, Gender=="Male" & Age <25, select=c(Math, Chemistry))
test











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
familymember


# Print data      

print(familymember)



setwd("d:\\RStatistics-Tutorial")    # to set working directory
##set colClasses in read.table() to create a data frame
vartype<-c("character", "character", "character", "character", "character", "numeric","numeric", "numeric","numeric","character")
grade <- read.table("University-Fullname-full.csv", colClasses=vartype, header=TRUE, sep=",")                                      
head(grade)


##Creating new variables
grade$total_grade <- grade$Math + grade$Physics + grade$Chemistry
grade$mean_grade <- (grade$Math + grade$Physics + grade$Chemistry)/3

head(grade)

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











## 14 attach , detatch
library(ggplot2)
data(mpg)
table(mpg$displ,mpg$cty)


attach(mpg)
table(displ,cty)
detach(mpg)


# *** keep in mind DO NOT use attach when more than one object 
#can have the same name.
cty <- c(1,2,3)
attach(mpg)
#does not work, as the individual object cty has priority
table(displ,cty)      
detach(mpg)



#Detecting and removing outliers

setwd("d:\\RStatistics-Tutorial")    # to set working directory
##set colClasses in read.table() to create a data frame
vartype<-c("character", "character", "character", "character", "character", "numeric","numeric", "numeric","numeric","character")
grade <- read.table("University-Fullname-outlier.csv", colClasses=vartype, header=TRUE, sep=",")                                      

grade



quantiles <- quantile(grade$Physics, probs = c(.25, .75))
range <- 1.5 * IQR(grade$Physics)
normal_grade <- subset(grade,
                       grade$Physics > (quantiles[1] - range) & 
                       grade$Physics < (quantiles[2] + range))

normal_grade






#Substituting missing values using the mice package
setwd("d:\\RStatistics-Tutorial")    # to set working directory
##set colClasses in read.table() to create a data frame
vartype<-c("character", "character", "character", "character", "character", "numeric","numeric", "numeric","numeric","character")
grade <- read.table("University-Fullname-NA.csv", colClasses=vartype, header=TRUE, sep=",")                                      

grade
grade$Physics[grade$Physics == 999] <- NA
grade

#identifying observations that contain missing values
is.na(grade[,7:9]) 

#Generate the data to substitute missing values using the mice() function
simulation <- mice(grade, method = "pmm")

#Populate the original data with generated data:
grade_complete <- complete(simulation, action =1)








#print and cat
#when we call print(result) in R, because print() is a 
#generic function, the interpreter checks the "class" 
#attribute of result ; suppose the class is "x" . 
#If a print.x() exists, that function will be called;
pi

sqrt(2)

print(pi)

print(sqrt(2))

#The beauty of print is that it knows how to format any 
#R value for printing, including structured values 
#such as matrices and lists:

print(matrix(c(1, 2, 3, 4), 2, 2))

print(list("a", "b", "c"))


#The print function has a significant limitation, however: 
#it prints only one object at a time. Trying to print
#multiple items gives this mind-numbing error message:

print("The zero occurs at", 2 * pi, "radians.")


#The cat function is an alternative to print that lets 
#you concatenate multiple items into a continuous output:
A = 3

cat("The zero occurs at", 2 * A, "radians.", "\n")











###  Removing NAs from a Data Frame
df <- data.frame(
  x = c(1, NA, 3, 4, 5),
  y = c(1, 2, NA, 4, 5)
)
df

colSums(df)


df_new <- na.omit(df)

df_new 

cumsum(df_new)

colSums(df_new)






### Creating a New Column Based on Some Condition using mutate()

#df %>%
#  mutate(
#    new_field = case_when(my_field == "something" ~ "result",
#                          my_field != "something else" ~ "other result",
#                          TRUE ~ "all other results")

library(dplyr)

df <- data.frame(vals = 1:10)

df_new <- df %>%
  mutate(new_vals = case_when(vals <= 3 ~ "3 or less",
                              vals > 3 & vals <= 6 ~ "3 to 6",
                              TRUE ~ "over 6"))

df_new







### Concatenating strings in R
paste("Everybody", "loves", "stats.")


paste("Everybody", "loves", "stats.", sep = "-")

paste("Everybody", "loves", "stats.", sep = "")

paste0("Everybody", "loves", "stats.")


paste("The square root of twice pi is approximately", sqrt(2*pi))

stooges <- c("Moe", "Larry", "Curly")
paste(stooges, "loves", "stats.")









### Extracting Substrings using substr()

#The substr function takes a string, a starting point,
#and an ending point. It returns the substring between
#the starting and ending points:

# Extract first 4 characters
substr("Statistics", 1, 4) 

# Extract last 4 characters
substr("Statistics", 7, 10) 


#substr lets the first argument be a vector of strings. 
#In that case, it applies itself to every string and returns 
#a vector of substrings:

ss <- c("Moe", "Larry", "Curly")

# Extract first 3 characters of each string
substr(ss, 1, 3)          


cities <- c("New York, NY", "Los Angeles, CA", "Peoria, IL")
substr(cities, nchar(cities) - 1, nchar(cities))






### Splitting a String According to a Delimiter
###using strsplit(string, delimiter))

path <- "/home/mike/data/trials.csv"

strsplit(path, "/")

#strsplit returns a list and that each element of the 
#list is a vector
#you can pop out the element like this

strsplit(path, "/")[[1]]


#This example splits three filepaths and returns a 
#three-element list:

paths <- c(
  "/home/mike/data/trials.csv",
  "/home/mike/data/errors.csv",
  "/home/mike/corr/reject.doc"
)
strsplit(paths, "/")



substrings.












### Replacing Substrings using sub() and gsub()

#The sub() function finds the first instance of the old 
#substring within string and replaces it with the new substring:

str <- "Curly is the smart one. Curly is funny, too."
sub("Curly", "Moe", str)


#gsub() replaces all instances of the substring 

gsub("Curly", "Moe", str)












### Generating Pairwise Combinations of Strings


#Suppose we have four test sites and three treatments:
locations <- c("NY", "LA", "CHI", "HOU")
treatments <- c("T1", "T2", "T3")
#We can apply outer and paste to generate all combinations of 
#test sites and treatments:
  
m <- outer(locations, treatments, paste, sep = "-")

#If you want the combinations in a vector instead,
#flatten the matrix using the as.vector function

as.vector(outer(locations, treatments, paste, sep = "-"))



#you can use expand.grid to get a pair of vectors representing all combinations:
n <- expand.grid(locations, treatments)

n$Var1














### Converting a String into a Date

#You have the string representation of a date, such as
#"2018-12-31", and you want to convert that into a 
#Date object

#By default, as.Date assumes the string looks like yyyy-mm-dd.
#so this works
as.Date("2018-12-31")


#this does not work
as.Date("12/31/2018")


#Here is the correct way to convert an American-style date:
as.Date("12/31/2018", format = "%m/%d/%Y")









