#course: Beginning using R for data analysis
#by Wei Zhang
#Section 5: Using R graphic with ggplot2
#------------------------------------------------------------#
setwd("d:/")   # to set working directory
##set colClasses in read.table() to create a data frame
vartype<-c("numeric","numeric" ,"character", "character", "character", "character", "numeric","numeric", "character")
Income <- read.table("Income.csv", colClasses=vartype, header=TRUE, sep=",")                                      
Income
Income$Race<-as.factor(Income$Race)
Income$Gender<-as.factor(Income$Gender)
Income$Region<-as.factor(Income$Region)
Income$Married<-as.factor(Income$Married)
Income$Job<-as.factor(Income$Job)

# -- Section 4.1 Creating a graph with ggplot2
library(ggplot2)

##Start building graph
# x axis: years of experience, y-axis: salary
ggplot(data = Income, mapping = aes(x = Years, y = Salary))


##Add geoms_ in ggplot()
#add a scatter plot of Years and Salary
ggplot(data = Income, mapping = aes(x = Years, y = Salary)) + geom_point()
#delete outlier and re-plot the same graph
#Income<-Income[Income$Salary<40,]
#ggplot(data = Income, mapping = aes(x = Years, y = Salary)) + geom_point()


# using optional point color, transparency, and point size
ggplot(data = Income, mapping = aes(x = Years, y = Salary)) +
  geom_point(color = "cornflowerblue", alpha = .7, size = 1.5) +
  theme_bw()

# add a fitted line with linear regression
ggplot(data = Income, 
  mapping = aes(x = Years, y = Salary)) +
  geom_point(color = "cornflowerblue", alpha = .7, size = 1.5) +
  theme_bw() +
  geom_smooth(method = "lm")



##Using Grouping in ggplot2
# using different point shape, color and line type
# for male and female.
ggplot(data = Income, 
       mapping = aes(x = Years, y = Salary,
                     color = Gender, shape = Gender, linetype = Gender)) +
  geom_point(alpha = .7, size = 1.5) +
  geom_smooth(method = "lm", se = FALSE, size = 1.5) +
  theme_bw()


##Using Scales in ggplot2
# change the x- and y-axis scaling and the 
#colors representing males and females
ggplot(data = Income,
  mapping = aes(x = Years, y = Salary,
                color = Gender, shape = Gender, linetype = Gender)) +
  geom_point(alpha = .7, size = 1.5) +
  geom_smooth(method = "lm", se = FALSE, size = 1.5) +
  scale_x_continuous(breaks = seq(0, 60, 10)) +
  scale_y_continuous(breaks = seq(0, 30, 5)) +
  scale_color_manual(values = c("indianred3", "cornflowerblue")) +
  theme_bw()


# change the x- and y-axis scaling and the 
#colors representing males and females
# and Salaries are printed in dollar format from scale package.
library(scales)
ggplot(
  data = Income,
  mapping = aes(x = Years, y = Salary,
                color = Gender, shape = Gender, linetype = Gender)) +
  geom_point(alpha = .7, size = 1.5) +
  geom_smooth(method = "lm", se = FALSE, size = 1.5) +
  scale_x_continuous(breaks = seq(0, 60, 10)) +
  scale_y_continuous(breaks = seq(0, 30, 5),
                     label = scales::dollar) +
  scale_color_manual(values = c("indianred3", "cornflowerblue")) +
  theme_bw()




#Using facets in ggplot2
# colors representing males and females
# and Salaries are printed in dollar format from scale package.
#facet used for different occupations.
ggplot(
  data = Income,
  mapping = aes(x = Years, y = Salary,
                color = Gender, shape = Gender, linetype = Gender)) +
  geom_point(alpha = .7) +
  geom_smooth(method = "lm", se = FALSE) +
  scale_x_continuous(breaks = seq(0, 60, 10)) +
  scale_y_continuous(breaks = seq(0, 30, 5),
                     label = scales::dollar) +
  scale_color_manual(values = c("indianred3", "cornflowerblue")) +
  facet_wrap(~Job) +
  theme_bw()

##Formatting labels
# separate graphs (facets) for each of five occupations
# formatting titles, subtitle, legend, caption.
ggplot(
  data = Income,
  mapping = aes(x = Years, y = Salary,
                color = Gender, shape = Gender, linetype = Gender)) +
  geom_point(alpha = .7) +
  geom_smooth(method = "lm", se = FALSE) +
  scale_x_continuous(breaks = seq(0, 60, 10)) +
  scale_y_continuous(breaks = seq(0, 30, 5),
                     label = scales::dollar) +
  scale_color_manual(values = c("indianred3","cornflowerblue")) +
  facet_wrap(~Job) +
  labs(title = "Relationship between Years of experience and Salary",
       subtitle = "A udemy course for R beginner",
       caption = "source: http://www.udemy.com/",
       x = " Years of Experience",
       y = "Yearly Income",
       color = "Gender", shape = "Gender", linetype = "Gender") +
  theme_bw()

## Formulate themes in ggplot()
#a theme that produced a white background and 
#light grey reference lines

ggplot(data = Income,
       mapping = aes(x = Years, y = Salary, color = Gender, shape=Gender,
                     linetype = Gender)) +
  geom_point(alpha = .7) +
  geom_smooth(method = "lm", se = FALSE) +
  scale_x_continuous(breaks = seq(0, 60, 10)) +
  scale_y_continuous(breaks = seq(0, 30, 5),
                     label = scales::dollar) +
  scale_color_manual(values = c("indianred3", "cornflowerblue")) +
  facet_wrap(~Job) +
  labs(title = "Relationship between Years of experience and Salary",
       subtitle = "A udemy course for R beginner",
       caption = "source: http://www.udemy.com/",
       x = " Years of Experience",
       y = "Yearly Income",
       color = "Gender", shape="Gender", linetype="Gender") +
  theme_minimal()


##ggplot2 graph as an object
#Income<-Income[Income$Salary<40,]
#step 1 to plot a scatter plot
plot1<-ggplot(data = Income, mapping = aes(x = Years, y = Salary)) + geom_point(size = 3, color = "blue")
plot1   #to pring plot1
#step 2 to add a smooth line based on plot1
plot2 <- plot1 + geom_smooth(method = "lm") +
  labs(title = "plot2")
plot2   #to pring plot2

##Saving graphs
ggsave(file="testgraph.png", plot=plot2, width=5, height=4)


##Bar charts
options(digits = 2)  #set the number of digits printed
setwd("d:/")   # to set working directory
#create a grade data frame
vartype<-c("character", "character", "character", "character", "character", "numeric","numeric", "numeric","numeric","character")
grade <- read.table("University-Fullname-full.csv", colClasses=vartype, header=TRUE, sep=",")                                      
grade

library(ggplot2)
#Simple vertical bar chart
ggplot(grade, aes(x=Gender)) + geom_bar() +
  labs(title="Simple Bar chart",                 
       x="Gender",                          
       y="Frequency")                            

#Simple horizontal bar chart
ggplot(grade, aes(x=Gender)) + geom_bar() +
  labs(title="Horizontal Bar chart",             
       x="Gender",                          
       y="Frequency") +                          
  coord_flip()                                   

#Stacked bar charts
ggplot(grade, aes(x=Gender, fill=Country)) +
  geom_bar(position = "stack") +  
  labs(title="Stacked Bar chart",                   
       x="Gender",                               
       y="Country")                               

#grouped bar charts
ggplot(grade, aes(x=Gender, fill=Country)) +
  geom_bar(position = "dodge") + 
  labs(title="Grouped Bar chart",                   
       x="Gender",                               
       y="Country")                               

#filled bar charts
ggplot(grade, aes(x=Gender, fill=Country)) +
  geom_bar(position = "fill") +  
  labs(title="Filled Bar chart",                   
       x="Gender",                               
       y="Country") 



## Pie charts
#install packages 'ggpie'
#if devtools not installed, should install devtools first
if(!require(remotes)) install.packages("remotes")
devtools::install_github("rkabacoff/ggpie")

library(ggplot2)
library(ggpie)
ggpie(grade, Gender)

#pie chart displaying the distribution of countries
ggpie(grade, Country, legend=FALSE, offset=1.3, 
      title="Student countries")

#pie chart displaying the distribution of countries
#by Gender
ggpie(grade, Country, Gender, 
      legend=FALSE, offset=1.3, title="Countries by Gender")






##Histograms
library(ggplot2)
library(scales)
#simple histogram
ggplot(grade, aes(x=Physics)) + 
  geom_histogram() +
  labs(title="Simple Histogram for Physics score")

#Colored histogram of Physics with 5 bins
ggplot(grade, aes(x=Physics)) + 
  geom_histogram(bins=5, color="white", fill="steelblue") +
  labs(title="Colored histogram of Physics with 5 bins",
       x="Physics score",
       y="Frequency")

#Histogram with percentages
ggplot(grade, aes(x=Physics, y=..density..)) + 
  geom_histogram(bins=30, color="white", fill="steelblue") +
  scale_y_continuous(labels=scales::percent) +
  labs(title="Histogram of Physics with percentages",
       y= "Percent",
       x="Physics score")

