#course: Beginning using R for data analysis
#by https://www.youtube.com/@rprogramming32                        
#Section 1: Get started with R environment                                    
#------------------------------------------------------------#



# commands used to manage the R workspace
getwd()    #get the current working directory
setwd("D:\\RStatistics-Tutorial")   #change to new working directory
options()   #show options in system
options(digits = 3)   #set your own option
test<-c(1,2,3,4,5)
ls() #shows all the objects in the current working environment
rm(test)  #remove object
options()   # view or set new options in the R system
save.image("imagefile")  # save work space
load("imagefile")  # load a workspace







# Working with packages
.libPaths()
install.packages("lavaan")    #install package
update.packages("lavaan")     #update package
installed.packages()
library(lavaan)        #load installed package
help(lavaan)           #decription of package
?lavaan      #decription of loaded package
??lavaan     #description of package if not loaded
library(ggplot2)
data(package="ggplot2")  #to see datasets in ggplot2
str(diamonds)   #to show dataset "diamonds"
head(diamonds)








# example of simple activity in R session
age <- c(12, 15, 15, 12, 11, 16)
height <- c(144.4, 155.3, 172.2, 156.2, 120, 162)
#calculate the mean and standard deviation of height 
mean(height)    
sd(height)
cor(age, height)    #correlation between age and height
plot(age, height)   #plot the relationshipcreate two vectors for age and height





