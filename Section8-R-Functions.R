#course: Beginning using R for data analysis
#by https://www.youtube.com/@easydatascience2508
#Section 8: R functions
#------------------------------------------------------------#




### Lecture 1. round, ceiling, floor, trunc & signif Functions 

# round()
a <- 3.2789                          
b <- 10.8
c <- 25.3

# Apply round function
# By default , all the digits after decimal will be rounded off. 
round(a)                          
round(b)
round(c)


#Rounding off to certain digits 
f <- 25.12345678


# Round to five decimal places                 
round(f, digits = 5) 
round(f, digits = 3)



### floor()
a1 <- floor(1.6) 
a2 <- floor(0.8) 
a3 <- floor(-10.6) 


print(a1) 
print(a2) 
print(a3) 




# ceiling()
a1 <- ceiling(1.6) 
a2 <- ceiling(33.275) 
a3 <- ceiling(-11.9) 
 

print(a1) 
print(a2) 
print(a3) 



#trunc()
a1 <- trunc(5.42) 
a2 <- trunc(-16.234) 
a3 <- trunc(-123.7) 


print(a1) 
print(a2) 
print(a3) 
 


# signif()
a1 <- 1.0123456
a2 <- 20
a3 <- -32.874875
a4 <- 123.3

signif(a1)
signif(a2)
signif(a3)
signif(a4)


signif(a3,5)














### Lecture 2. reshape data cbind() rbind() merge() melt() dcast()

#Transpose of a Matrix
# The t() function takes a matrix or data frame as an input 
# and gives the transpose of that matrix or data frame as it’s output.

# transpose of a matrix

test_mtx <- matrix(c(1:10), nrow=5, byrow=TRUE)
test_mtx

test_tmtx <- t(test_mtx)
print("Transpose of the Matrix")
test_tmtx


# transpose of a dataframe
data(mtcars)
test_df <- mtcars[1:4, 1:4]
test_df 

test_tdf <- t(test_df)
print("Transpose of a dataframe")
test_tdf


# Joining Rows and Columns of Data Frames
# Cbind and Rbind function in R
name<- c("Wilson", "Dudu", "Maomao", "Miaomiao","Mico","Mia")
age <- c(32, 20, 22, 12,8,3)
address <- c("Aukra", "Hustadvika", "Hustadvika", "Molde","Molde","Molde")

# Cbind function
family <- cbind(name, age, address)
print("Combining vectors into data frame using cbind ")
print(family)

# creating new data frame
Jiangjiang <- data.frame(name=c("Jiangjiang", "Gangdu"),
                         age= c(16,18),
                         address = c("Aukra","Molde"))

Jiangjiang

# Rbind function
info <- rbind(family, Jiangjiang)
print("Combining data frames using rbind ")
print(info)



# Merging two data frames in R
name<- c("Wilson", "Dudu", "Maomao", "Miaomiao","Mico","Mia")
age <- c(32, 20, 22, 12,8,3)
address <- c("Aukra", "Hustadvika", "Hustadvika", "Molde","Molde","Molde")


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


















