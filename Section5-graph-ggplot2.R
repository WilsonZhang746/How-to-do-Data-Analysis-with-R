#course: Beginning using R for data analysis
#by https://www.youtube.com/@easydatascience2508
#Section 5: Using R graphic with ggplot2
#------------------------------------------------------------#
setwd("d:\\RStatistics-Tutorial")   # to set working directory
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









##Using facets in ggplot2
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
library(ggplot2)
options(digits = 2)  #set the number of digits printed
setwd("d:\\RStatistics-Tutorial")   # to set working directory
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
#not work under R-3.5.2
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










###Boxplots
#a simple box plot
library(ggplot2)
ggplot(mtcars, aes(x="", y=mpg)) +
  geom_boxplot() +
  labs(y = "Miles Per Gallon", x="", title="Box Plot")

#to show statistics
boxplot.stats(mtcars$mpg)

#Using parallel box plots to compare groups
cars <- mpg[mpg$cyl != 5, ]
cars$Cylinders <- factor(cars$cyl)
cars$Year <- factor(cars$year)

ggplot(cars, aes(x=Cylinders, y=cty)) +
  geom_boxplot() +
  labs(x="Number of Cylinders",
       y="Miles Per Gallon",
       title="Car Mileage Data")


#notched box plots
ggplot(cars, aes(x=Cylinders, y=cty)) +
  geom_boxplot(notch=TRUE, fill="steelblue",
               varwidth=TRUE) +
  labs(x="Number of Cylinders",
       y="Miles Per Gallon",
       title="Car Mileage Data")


#box plots for more than one grouping factor
ggplot(cars, aes(x=Cylinders, y=cty, fill=Year)) +
  geom_boxplot() +
  labs(x="Number of Cylinders",
       y="Miles Per Gallon",
       title="City Mileage by # Cylinders and Year") +
  scale_fill_manual(values=c("gold", "green"))







###Kernel density plots
library(ggplot2)
data(mpg)
cars2008 <- mpg[mpg$year == 2008, ]

#Simple density plot
ggplot(cars2008, aes(x=cty)) + 
  geom_density() + 
  labs(title="Default kernel density plot") 


#filled density plot
ggplot(cars2008, aes(x=cty)) + 
  geom_density(fill="red") + 
  labs(title="Filled kernel density plot", 
     x="City Miles Per Gallon") 


#Prints default bandwidth     
bw.nrd0(cars2008$cty) 


#Density plot with smaller bandwidth
ggplot(cars2008, aes(x=cty)) + 
  geom_density(fill="red", bw=.5) + 
  labs(title="Kernel density plot with bw=0.5", 
    x="City Miles Per Gallon")


#Using kernel density plots to compare groups
data(mpg, package="ggplot2") 
cars2008 <- mpg[mpg$year == 2008 & mpg$cyl != 5,] 
cars2008$Cylinders <- factor(cars2008$cyl)


#colored density plot
ggplot(cars2008, aes(x=cty, color=Cylinders, linetype=Cylinders)) + 
  geom_density(size=1) + 
  labs(title="Fuel Efficiecy by Number of Cylinders", 
     x = "City Miles per Gallon") 


#filled density plot
ggplot(cars2008, aes(x=cty, fill=Cylinders)) +
  geom_density(alpha=.4) + 
  labs(title="Fuel Efficiecy by Number of Cylinders", 
     x = "City Miles per Gallon")






###Violin plots
#Creating basic Violin Plots
# load library ggplot2
library(ggplot2)

# Basic violin plot
# diamonds dataframe has been used here
# diamonds dataframe is provided by R language natively.
ggplot(diamonds, aes(x=cut, y=price)) +
  geom_violin()


#Color Customization
#We can change the color of the violin plot using the 
#color parameter of aes() function of ggplot2. 
#This changes the color of the boundary of the violin 
#plot according to the category of data. Here, plots 
#are colored according to the category of their cut 
#by putting cut as parameter color.

ggplot(diamonds, aes(x=cut, y=price, color=cut)) +
  geom_violin()


#We can change the background color of the violin 
#plot using the fill parameter of aes() function of ggplot2.
#This changes the color of the background of the 
#interior of the violin plot according to the category 
#of data.
ggplot(diamonds, aes(x=cut, y=price, fill=cut)) +
  geom_violin()

#Horizontal Violin Plot
#To convert a normal violin plot to a horizontal violin 
#plot we add coord_flip() function to the ggplot() function.
#This flips the coordinate axis of the plot and converts 
#any ggplot2 plot into a horizontal plot. 
ggplot(diamonds, aes(x=cut, y=price)) +
  geom_violin()+
  coord_flip()


#Mean marker customization
#In ggplot2, we use the stat_summary() function to compute 
#new summary statistics and add it to the plot. We use 
#stat_summary() function with ggplot() function. 
ggplot(diamonds, aes(x=cut, y=price)) +
  geom_violin()+
  stat_summary(fun.y="mean", geom="point", size=2, color="red")











### Scatter plots
library(ggplot2)

#Simple scatterplot
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point()


#Scatter plot with groups
#Here we will use distinguish the values by a group 
#of data (i.e. factor level data). aes() function 
#controls the color of the group and it should be factor 
#variable.
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point(aes(color = factor(Sepal.Width)))


#Changing color
#Here we use aes() methods color attributes to 
#change the color of the datapoints with specific variables.
ggplot(iris) +
  geom_point(aes(x = Sepal.Length,
                 y = Sepal.Width,
                 color = Species))


#Changing Shape
#To change the shape of the datapoints we will use 
#shape attributes with aes() methods.
ggplot(iris) +
  geom_point(aes(x = Sepal.Length, y = Sepal.Width,
                 shape = Species , color = Species))


#Changing the size aesthetic
#To change the aesthetic or datapoints we will use 
#size attributes in aes() methods.
ggplot(iris) +
  geom_point(aes(x = Sepal.Length,
                 y = Sepal.Width,
                 size = .5))


#Label points in the scatter plot
#To deploy the labels on the datapoint we will use 
#label into the geom_text() methods.
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point() +
  geom_text(label=rownames(iris))



#add a Regression smoothing line
#Regression models a target prediction value supported 
#independent variables and mostly used for finding out 
#the relationship between variables and forecasting. 
#In R we can use the stat_smooth() function to smoothen 
#the visualization.

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point() +
  stat_smooth(method=lm)


#Using stat_mooth with loess mode
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point() +
  stat_smooth()



#geom_smooth() function to represent a regression 
#line and smoothen the visualization. 
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point() +
  geom_smooth()










###Dot plots
#using dotchart function in R
month <- month.name
expected <- c(15, 16, 20, 31, 11, 6,
              17, 22, 32, 12, 19, 20)
sold <- c(8, 18, 12, 10, 41, 2,
          19, 26, 14, 16, 9, 13)
quarter <- c(rep(1, 3), rep(2, 3), rep(3, 3), rep(4, 3))

data <- data.frame(month, expected, sold, quarter)
data

#You can create a dot chart in R of the sold variable 
#passing it to the dotchart function. 
#You can also label each data point with the labels 
#argument and specify additional arguments, like the symbol,
#the symbol size or the color of the symbol with the pch, 
#pt.cex and bg arguments, respectively.
dotchart(data$sold, labels = data$month, pch = 21, bg = "green", pt.cex = 1.5)

#Dot plot by group in R
#If you have a variable that categorizes the data in groups, 
#you can separate the dot chart in that groups, setting 
#them in the labels argument. You can also specify colors 
#for each group if wanted specifying them in the color 
#argument
colors <- numeric(4)
colors[quarter == "1"] <- "red"
colors[quarter == "2"] <- "blue"
colors[quarter == "3"] <- "green"
colors[quarter == "4"] <- "orange"
        
dotchart(data$expected, labels = data$month, pch = 19,
               pt.cex = 1.5, groups = rev(data$quarter), color = colors)


#Order dotchart in R by a variable
#In addition, you can order a dot plot in R by a 
#variable if you have your data ordered. For that 
#purpose you can type:
x <- data[order(data$expected), ] 

dotchart(x$expected, labels = x$month, pch = 19,
         xlim = range(x$expected, x$sold) + c(-2, 2),
         pt.cex = 1.5, color = colors, groups = rev(data$quarter))



#using ggplot2 for dot plots
#Here's an example using the highway gas mileage 
#for the 2008 automobiles in the mpg dataset. 
#Highway gas mileage is averaged by car model:
library(ggplot2)
library(dplyr)
plotdata <- mpg %>%
  filter(year == "2008") %>%
  group_by(model) %>%
  summarize(meanHwy=mean(hwy))
plotdata

#Dot plot allows you to see the mpg for each car model on
#the same horizontal axis.
ggplot(plotdata, aes(x=meanHwy, y=model)) +
  geom_point(color = "red") +
  labs(x="Miles Per Gallon",
       y="",
       title="Gas Mileage for Car Models")


#Dot plots typically become most useful when they're sorted.
#The following code sorts the cars from lowest to highest
#mileage:
ggplot(plotdata, aes(x=meanHwy, y=reorder(model, meanHwy))) +
  geom_point(color="red") +
  labs(x="Miles Per Gallon",
       y="",
       title="Gas Mileage for Car Models")










###Stem and Leaf Plots
#a Stem and leaf plot for a simple data
score <-c(74, 83, 77, 86, 65, 59, 96, 78, 80, 92)
stem(score)


#Creating a Stem and Leaf Plot using the ChickWeight data set
#where considering the weight
#The stem() command extracts the numeric data and splits 
#them into two parts namely, the stem and leaf. The left 
#side shows the most significant digit while the last digit 
#is shown on the right hand side.

stem(ChickWeight$weight)




#Using the scale argument
#Now let's see the same stem and leaf plot after rescaling 
#our desired plot. To rescale the plot we need to use the 
#scale argument inside the stem() function.


stem(ChickWeight$weight, scale = 5)



#Using the  width argument to change the width of the plot

stem(ChickWeight$weight, width = 100)

stem(ChickWeight$weight, width = 20)

















### treemap
# install.packages("treemapify") , if you have not done yet

# Simple Tree Map
library(ggplot2)
library(dplyr)
library(treemapify)

plotdata <- mpg %>% count(manufacturer)

plotdata

ggplot(plotdata,
       aes(fill = manufacturer,
           area = n,
           label = manufacturer)) +
  geom_treemap() +
  geom_treemap_text() +
  theme(legend.position = "none")



# Tree Map with Subgrouping
plotdata <- mpg %>%  
  count(manufacturer, drv)
plotdata

plotdata$drv <- factor(plotdata$drv, 
                       levels=c("4", "f", "r"),
                       labels=c("4-wheel", "front-wheel", "rear"))

plotdata

ggplot(plotdata,
       aes(fill = manufacturer, 
           area = n,
           label = manufacturer,
           subgroup=drv)) +
  geom_treemap() + 
  geom_treemap_subgroup_border() +
  geom_treemap_subgroup_text(
    place = "middle",
    colour = "black",
    alpha = 0.5,
    grow = FALSE) +
  geom_treemap_text(colour = "white", 
                    place = "centre",
                    grow=FALSE) +
  theme(legend.position = "none")






