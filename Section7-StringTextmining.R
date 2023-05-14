#course: Beginning using R for data analysis
#by https://www.youtube.com/@easydatascience2508
#
#Working with string and text mining
#
#------------------------------------------------------------#



### Section 7. Working with string and text mining

### Lecture 1. find SubString in R

#Method 1: Using substr() method

#Find substring in R using substr() method in R Programming 
#is used to find the sub-string from starting index to the ending 
#index values in a string.
# Syntax: substr(string_name, start, end)
# Return: Returns the sub string from a given string using indexes.

# Given String
lstring <- "I love both R and Python programming"

# Using substr() method
sstring <- substr(lstring, 0, 5)

print(sstring)


#Method 2: Using str_detect() method in stringr package
#str_detect() Functionis used to check if the specified match 
#of the substring exists in the original string. It will return 
#TRUE for a match found otherwise FALSE against each of the 
#elements of the Vector or matrix.
#Syntax: str_detect(string, pattern)
#string: specified string
#pattern: Pattern to be matched

library(stringr)

# Creating vector
lstring <- c("Wilson", "Shirley", "Mico", "Miaomiao", "Mia")

# Pattern to be matched
pat1 <- "wilson"
pat2 <- "Wilson"
pat3 <- "shi"

# Calling str_detect() function
str_detect(lstring, pat1)
str_detect(lstring, pat2)
str_detect(lstring, pat3)


#Method 3: Using grep() method
#grep() function returns the index at which the pattern 
#is found in the vector. If there are multiple occurrences 
#of the pattern, it returns a list of indices of the occurrences. 
#This is very useful as it not only tells us about the occurrence 
#of the pattern but also of its location in the vector.

#Syntax: grep(pattern, string, ignore.case=FALSE)

#Parameters:
  
#pattern: A regular expressions pattern.
#string: The character vector to be searched.
#ignore.case: Whether to ignore case in the search. 
#Here ignore.case is an optional parameter as is set to 
#FALSE by default.

str <- c("Hello", "hello", "hi", "hey")
grep('he', str)





















### Lecture 2. paste() and paste0()


#Example 1: Use paste0()

#concatenate several elements into one string
#Each element is concatenated into one string using no space 
#as the separator.
paste0("I", "ride", "my", "bike", 25, "times")



#Example 2: Use paste()
#Each element is concatenated into one string using a space 
#as the default separator.
  
#concatenate several elements into one string
paste("I", "ride", "my", "bike", 25, "times")




#Example 3: Use paste() with sep
#The following code shows how to use the paste() function with 
#the sep argument to concatenate several strings into one string, using an underscore as the separator:
  
#concatenate elements using _ as separator
paste("I", "ride", "my", "bike", 25, "times", sep="_")


#Example 4: Use paste() with sep and collapse

#concatenate elements using sep and collapse arguments
paste(c("A", "B", "C"), c(1, 2, 3), sep="_", collapse=" and ")


#paste() for more than two strings
string1 <- "Wilson"
string2 <- "likes"
string3 <- "R programming"

# Using paste() method
answer <- paste(string1, string2, string3, sep=' ')
answer



#paste0()
paste0(letters[1:6], collapse ="-")
paste0("G", 1:5)
