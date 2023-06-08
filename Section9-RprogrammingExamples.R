#course: Beginning using R for data analysis
#by https://www.youtube.com/@easydatascience2508
#Section 9: R programming examples
#------------------------------------------------------------#



### Lecture 1. Recursive Functions in R

# Example: Factorial using Recursion in R

fact_fun <- function(x){
  if(x==0 || x==1)
  {
    return(1)
  }   
  else
  {
    return(x*fact_fun(x-1))
  }
}

fact_fun(10)



#Example: sum of squares of a given series of numbers


sum_square <- function(x){
  if(length(x)<=1)
  {
    return(x^2)
  }
  else
  {
    return(x[1]^2+sum_square(x[-1]))
  }
}

series <- c(1:10)
sum_square(series)

















### Lecture 2. Long wide form data Transformation, 
#method 1. Using melt and cast from reshape2 package
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



#method2. Using tidyverse/dplyr’s gather() and spread()
#The gather() function in the 'tidyr' package makes wide datasets long.
#The gather function works on the concept of keys and values.
#The data values represent an observation of a single variable while
#the key is a name used to identify the variable described by the value.

### gather() function in dplyr to convert multiple columns into one
#from wide to long form
library(tidyverse)
df <- data.frame(student_name = c("A","B","C","D","E"),
                 Math_marks = c(70,56,34,89,54),
                 Sci_marks = c(35,55,87,12,63),
                 Eng_marks = c(59,89,55,63,55))
print(df)

x <- gather(df,"subject","marks",2:4)     
print(x)



#example of converting three date-related columns into one
state <- c("Maryland", "Alaska", "New Jersey")
income <- c(76067,74444,73702)
median.us <- c(61372,61372,61372)
life.expectancy <- c(78.8,78.3,80.3)
teen.birth.rate.2015 <- c(17,29.3,12.1)
teen.birth.rate.2007 <- c(34.3,42.9,24.9)
teen.birth.rate.1991 <- c(54.1, 66, 41.3)
top.3.states <- data.frame(state, income, median.us,
                           life.expectancy,
                           teen.birth.rate.2015, teen.birth.rate.2007,
                           teen.birth.rate.1991)
names(top.3.states) <- c("state", "income", "median.us",
                         "life.expectancy","2015","2007","1991")
top.3.states


#use gather to put all three years in one column:
new.top.3.states <- top.3.states %>%
  gather("2015", "2007", "1991", key = "year", value = "cases")
new.top.3.states




### Use Spread() of Dplyr in R to Consolidate Multiple Rows into One
#from long to wide form
df_1 <- data_frame(Type = c("TypeA", "TypeA", "TypeB", "TypeB"),
                   Answer = c("Yes", "No", "Yes", "No"), n = 1:4)
df_1 #before

#After using spread, “No” and “Yes” answers are in separate columns
df_2 <- df_1 %>%
  spread(key=Answer, value=n)

df_2



#Spread Values Across More Than Two Columns
#create data frame
df2 <- data.frame(player=rep(c('A'), times=8),
                  year=rep(c(1, 2), each=4),
                  stat=rep(c('points', 'assists', 'steals', 'blocks'), times=2),
                  amount=c(14, 6, 2, 1, 29, 9, 3, 4))

#view data frame
df2

#We can use the spread() function to turn the four unique values 
#in the stat column into four new columns:
spread(df2, key=stat, value=amount)

























### Lecture 3. split() function to Split a Vector into Groups

#Example: split a numeric column of dataframe by another 
#factor variable in the same dataframe
library(MASS)
head(Cars93)
str(Cars93)
test_group <- split(Cars93$MPG.city, Cars93$Origin)

test_group

mean(test_group[[1]])

mean(test_group[[2]])


#Example: split a numeric vector by another character vector
#of same length

#name vector
name=c("Wilson","Dudu","Maomao","Miaomiao","Shirley","Mico","Mia")


# sex vector
sex=c("Male","Male","Male","Female","Female","Male","Female")


family_group <- split(name, sex)

family_group

family_group[[1]]
family_group[[2]]



#using split() to split a dataframe by a factor variable
test_df <- split(Cars93, Cars93$Origin)

test_df[[1]]

test_df[[2]]












### Example 4. Applying a Function to Each List Element

## Method 1, using lapply(), sapply()

sample_vec1 <- sample(60 : 100, size = 51, replace = T)

sample_vec2 <- sample(60 : 100, size = 32, replace = T)

sample_vec3 <- sample(60 : 100, size = 39, replace = T)

sample_vec4 <- sample(60 : 100, size = 36, replace = T)


sample_list <- list(vec1 = sample_vec1,
                    vec2 = sample_vec2,
                    vec3 = sample_vec3,
                    vec4 = sample_vec4
                    )


#lapply with length, mean , sd ,range, return as a list object

result_length <- lapply(sample_list, length)

result_mean <- lapply(sample_list, mean)

result_sd <- lapply(sample_list, sd)


result_range <- lapply(sample_list, range)

result_length
result_mean
result_sd
result_range


#sapply with length, mean , sd , return as a vector object
result_length <- sapply(sample_list, length)

result_mean <- sapply(sample_list, mean)

result_sd <- sapply(sample_list, sd)



result_length
result_mean
result_sd


#sapply with range, return as a matrix object
result_range <- sapply(sample_list, range)

result_range


#lapply with other function, e.g. t-test

result_t <- lapply(sample_list, t.test)

result_t 


#sapply with other function, e.g. t-test
#to extract  elements from the t.test results, such as the 
#bounds of the confidence interval


result_t <- sapply(sample_list, t.test)

result_t



result_t[1,]
result_t[3,]
















### Example 5. Stack() unstack() dataframe from long wide form

library(MASS)
library(reshape2)

head(airquality) 


#stack a dataframe to long form

test_long <- cbind(airquality[5:6], stack(airquality[1:4]))
test_long

head(test_long)

#unstack to a wide form

test_wide <- cbind(test_long[1:2], unstack(test_long[3:4]))

test_wide
head(test_wide)





















### Example 6. Applying a Function to Columns

###1. for matrix, using apply() function

sample_matrix <- matrix(C<-(1:30),nrow=3, ncol=10)

print( "sample matrix:")
sample_matrix

# use apply() function across column to find mean
print("mean across columns:")
apply( sample_matrix, 2, mean)



## 2.for dataframe, using lapply() function
#result returned as a list


# create sample data
familymember <- data.frame(
  FirstName=c("Wilson", "Dudu", "Maomao", "Miaomiao","Mico","Miaomiao"),
  Income=c(300, 500, 200, 600,300,600),
  Cost=c(200, 250, 100, 380,150,320))

print(familymember)

# apply lapply() function to the last two columns
print("data after lapply():")
lapply(familymember[,2:3], mean)

result_list <- lapply(familymember[,2:3], mean)

##3. for dataframe, using sapply() function
# result returned as vector/matrix type
familymember <- data.frame(
  FirstName=c("Wilson", "Dudu", "Maomao", "Miaomiao","Mico","Miaomiao"),
  Income=c(300, 500, 200, 600,300,600),
  Cost=c(200, 250, 100, 380,150,320))

print(familymember)

# apply sapply() function
print("data after sapply():")

#sapply for each column
sapply(familymember, max)

#sapply for the last two columns
sapply(familymember[,2:3], max)


## 4. for dataframe, using map_df() from purrr package
# result returned as a dataframe

library(purrr)

familymember <- data.frame(
  FirstName=c("Wilson", "Dudu", "Maomao", "Miaomiao","Mico","Miaomiao"),
  Income=c(300, 500, 200, 600,300,600),
  Cost=c(200, 250, 100, 380,150,320))

print(familymember)

#max of each column
result_df <- map_df(familymember,max)


result_df 

#max of the last two columns
result_df <- map_df(familymember[,2:3],max)
result_df 























### Lecture 7. Flatten a List to a Vector using unlist() Function in R


#Example1: Converting list  into a single vector

# R  program to illustrate
# converting list to vector

# Creating a list.
my_list <- list(l1 = c(1, 3, 5, 7),                
                l2 = c(1, 2, 3),                    
                l3 = c(1, 1, 10, 5, 8, 65, 90))   


# Apply unlist R function
print(unlist(my_list))  


#Example 2: Unlisting list with dataframe:
  
# R program to illustrate
# Unlisting list with data frame
  
# Creating a list.
list2 <- list(l1 = c(32, 20, 10, 7,3),                
                  l2 = c(19, 19, 32,28),                    
                  l3 = c(39, 1, 10, 5, 8, 69, 68))   



# Add a data frame to the list                              
list2[[4]] <- data.frame(v1 = c(10, 20, 30),       
                        v2 = c(14,15, 26))

# Unlist list with data.frame

print(unlist(list2,use.names = FALSE))
vec1<-unlist(list2,use.names = FALSE)

#unlist part of a list
print(unlist(list2[[4]],use.names = FALSE))



#Example 3: apply a function after unlisting

mean(unlist(list2))













