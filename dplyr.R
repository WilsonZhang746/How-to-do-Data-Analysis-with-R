#course: Beginning using R for data analysis
#by https://www.youtube.com/@easydatascience2508
#Data management with dplyr
#
#------------------------------------------------------------#
setwd("d:\\RStatistics-Tutorial")   # to set working directory
##set colClasses in read.table() to create a data frame




# Manipulating data with dplyr
leadership <- data.frame(
  manager = c(1, 2, 3, 4, 5),
  date    = c("10/24/08", "10/28/08", "10/1/08", "10/12/08", "5/1/09"),
  country = c("US", "US", "UK", "UK", "UK"),
  gender  = c("M", "F", "F", "M", "F"),
  age     = c(32, 45, 25, 39, 99),
  q1      = c(5, 3, 3, 3, 2),
  q2      = c(4, 5, 5, 3, 2),
  q3      = c(5, 2, 5, 4, 1),
  q4      = c(5, 5, 5, NA, 2),
  q5      = c(5, 5, 2, NA, 1)
)

library(dplyr)                                                  
leadership <- mutate(leadership,                                
                     total_score = q1 + q2 + q3 + q4 + q5,      
                     mean_score = total_score / 5)              
leadership$gender <- recode(leadership$gender,                  
                            "M" = "male", "F" = "female")       
leadership <- rename(leadership, ID = "manager", sex = "gender")
leadership <- arrange(leadership, sex, total_score)             
leadership_ratings <- select(leadership, ID, mean_score)        
leadership_men_high <- filter(leadership,                       
                              sex == "male" & total_score > 10)





###

data("mtcars")
#select only cars with six cylinders
six.cyl.only <- filter(mtcars, cyl == 6)
six.cyl.only









###Filter commands in Dplyr
library(tidyverse)
data("mtcars")
head(mtcars)
#Single-Condition Filter
#select only cars with six cylinders
six.cyl.only <- filter(mtcars, cyl == 6)
six.cyl.only


#Multiple-Condition Filter
#Filter the dataset mtcars for both six cylinders and 110 horsepower:
six.cylinders.and.110.horse.power <- filter(mtcars, cyl == 6,hp == 110)
six.cylinders.and.110.horse.power


#OR Logic for Filtering
gear.eq.4.or.more.than.8 <- filter(mtcars, gear == 4|cyl > 6)
gear.eq.4.or.more.than.8


#Filter by Minimums, Maximums, and Other Numeric Criteria
#a single row with the smallest engine displacement:
smallest.engine.displacement <- filter(mtcars, disp == min(disp))
smallest.engine.displacement


#Filter with conditions separated by commas
data("ChickWeight")
chick.subset <- filter(ChickWeight, Time < 3, weight > 53)
chick.subset


#Filter Out Missing Values (NAs) for a Specific Column
#The built-in dataset “airquality” has a missing value in the 
#fifth row of the first column (Ozone):
data("airquality")
head(airquality,10) #before filter

#then Remove any row with missing values in the Ozone column:
no.missing.ozone = filter(airquality, !is.na(Ozone))
head(no.missing.ozone,8) #after filter


#Filter Rows with NAs Anywhere in the Dataset
#Use complete.cases() to remove any rows containing an NA in any
#column:
airqual.no.NA.anywhere <- filter(airquality[1:10,], complete.cases(airquality[1:10,]))
airqual.no.NA.anywhere


#Filter by %in%
#“%in%” is a powerful operator, providing a convenient shorthand 
#for including/excluding specified values:
data("iris")
table(iris$Species) #counts of species in the dataset
nrow(iris)

iris.two.species <- filter(iris, Species %in% c("setosa", "virginica"))
table(iris.two.species$Species)
nrow(iris.two.species)

#Filter for Ozone > 29 and Include Only Three Columns
data("airquality")
airqual.3.columns <- filter(airquality, Ozone > 29)[,1:3]
head(airqual.3.columns)


#Filter by Total Frequency of a Value Across All Rows
table(mtcars$gear)
#only those rows whose total counts exceed ten are
#included in the output, using n()
more.frequent.no.of.gears <- mtcars %>%
  group_by(gear) %>%
  filter(n() > 10) #
table(more.frequent.no.of.gears$gear)


#only those rows whose total counts exceed ten, and horsepower 
#be less than 105 are included in the output
more.frequent.no.of.gears.and.low.horsepower <- mtcars %>%
  group_by(gear) %>%
  filter(n() > 10, hp < 105)
table(more.frequent.no.of.gears.and.low.horsepower$gear)


#Filter by Column Name Using “starts with”
names(iris)
#records are selected where the column name starts with an “S”
#using select
iris.display <- iris %>% dplyr::select(starts_with("S"))
head(iris.display)


#Filter Rows: Columns Meet Criteria (filter_at)
#Use filter_at to find rows which meet some criteria such as maximum
#select observations that cyl and hp have maximum values
new.mtcars <- mtcars %>% filter_at(vars(cyl, hp),all_vars(. == max(.)))
new.mtcars


#The filter_at function says to look at only variables containing 
#the word “sleep.” Within those variables (in this case, two of them),
#filter for any values greater than 5. The “.”means any variable 
#with sleep in the name.

msleep <- ggplot2::msleep
msleep
msleep.over.5 <- msleep %>%
  select(name, sleep_total:sleep_rem, brainwt:bodywt) %>%
  filter_at(vars(contains("sleep")), all_vars(.>5))
msleep.over.5













### Arange function of Dplyr in R
library(tidyverse)  #OR: library(dplyr)
msleep <- ggplot2::msleep
msleep[,1:4]

#Ascending order
#Sorting in ascending order is the default sorting order 
#in arrange() function
#vore in ascending, order in ascending
animal.name.sequence <- arrange(msleep, vore, order)
animal.name.sequence[,1:4]


#Descending order
#vore in ascending, order in descending order
animal.name.sequence.desc <- arrange(msleep, vore, desc(order))
head(animal.name.sequence.desc[,1:4])


#to create another data set for sales and salary
gfg = data.frame(Customers = c("Roohi", "James", "Satish", "Heera", 
                               "Sehnaaz", "Joe","Raj", "Simran", 
                               "Priya","Tejaswi"),
                 
                 Product = c("Product A", "Product B", "Product C",
                             "Product A", "Product D", "Product B",
                             "Product D", "Product C", "Product D",
                             "Product A"),
                 
                 Salary = c(514.65, 354.99, 345.44, 989.56, 767.50,
                            576.90, 878.67, 904.56,123.45, 765.78)
)

gfg                
# Sorting the dataframe in ascending order by salary
arrange(gfg, Salary)

# Sorting the dataframe in descending order
#using pipeline
gfg %>% arrange(desc(Salary))












### Using rename function of Dplyr in R
library(tidyverse)  #OR: library(dplyr)
names(iris)
renamed.iris <- rename(iris, width.of.petals = Petal.Width,
                       various.plants.and.animals = Species)
names(renamed.iris)



#Using rename_with()
#rename_with() is used to change the case of the column. 
# create dataframe with 3 columns id,name 
# and address
data1=data.frame(id=c(1,2,3,4,5,6,7,1,4,2),
                 
                 name=c('sravan','ojaswi','bobby',
                        'gnanesh','rohith','pinkey',
                        'dhanush','sravan','gnanesh',
                        'ojaswi'),
                 
                 address=c('hyd','hyd','ponnur','tenali',
                           'vijayawada','vijayawada','guntur',
                           'hyd','tenali','hyd'))

# convert all columns to upper
rename_with(data1,toupper)
print("==============")
# convert all columns to lower
rename_with(data1,tolower)















### Using mutate() function of Dplyr in R
library(tidyverse)  #OR: library(dplyr)
#Applying a Function to a Single Column
#adds the natural log of length and weight to the dataframe created
#earlier that contains just the length and weight variables.
data("ChickWeight")
ChickWeight[1:2,] #first two rows

Chickweight.with.log <- mutate(ChickWeight,log.of.weight = log10(weight))
Chickweight.with.log[1:2,]


#apply the same function to multiple columns in a data frame
#mutate_all to Add New Fields All at Once
#create 6 columns square root simultaneously. 
msleep <- ggplot2::msleep
names(msleep)

msleep.with.square.roots <- mutate_all(msleep[,6:11],
                            funs("square root" = sqrt( . )))
names(msleep.with.square.roots)
str(msleep.with.square.roots)



#Applying Different Functions to Different Columns

df <- data.frame(col1 = runif(10),
                 col2 = runif(10),
                 col3 = runif(10))

#applying the logarithm function to columns 1 and 3
#and applying the square root function to column 2
df_log_sqrt <- df %>% 
  mutate_at(c(1, 3), ~ log(.)) %>% 
  mutate_at(2, ~ sqrt(.))


df_log_sqrt



#mutate_if combines IF logic and mutate to create a new 
#variable or alter an existing one

divide.by.10 <- function (a.number) (a.number / 10)
head(CO2)
#Now divide any column which has a numeric format by 10, 
#using the preceding custom function:
new.df <- CO2 %>%
  mutate_if(is.numeric, divide.by.10)
head(new.df)


#Any NA in a numeric field is replaced by zero
df <- data.frame(
  alpha = c(22, 1, NA),
  almond = c(0, 5, 10),
  grape = c(0, 2, 2),
  apple = c(NA, 5, 10))
df

#“coalesce” is a function of DPLYR
#which finds the first non-missing value at each position. 
#A set of three dots in R is called an ellipsis. It means 
#that a function will accept any number of arguments:
df.fix.alpha <- df %>% mutate_if(is.numeric, coalesce, ... = 0)
df.fix.alpha



#String Detect and True/False Duplicate Indicator
#detect string, and fill out values wanted
msleep <- ggplot2::msleep
table(msleep$vore)
str(msleep)
msleep.no.c.or.a <- filter(msleep, !str_detect(vore,
                          paste(c("c","a"), collapse = "|")))
table(msleep.no.c.or.a$vore)
str(msleep.no.c.or.a)



#Mutate Add a field indicating whether a particular value in a column 
#occurs more than once using duplicated
msleep.with.dup.indicator <- mutate(msleep,
                    duplicate.indicator = duplicated(conservation))
msleep.with.dup.indicator[1:60,c(1,2,5,12)]

#Either conservation or genus have to be duplicated for the 
#duplicate.indicator to be set to TRUE.
#Sort by conservation as major key and genus as minor key:
msleep.with.dup.indicator2 <- mutate(msleep,
  duplicate.indicator = duplicated(conservation, genus)) #%>%
  #arrange(conservation,genus)
msleep.with.dup.indicator2[1:60,c(1,2,5,12)]



#Drop Variables Using NULL
fruit <- c("apple","pear","orange","grape", "orange","orange")
x <- c(1,2,4,9,4,6)
y <- c(22,3,4,55,15,9)
z <- c(3,1,4,10,12,8)
df <- data.frame(fruit,x,y,z)
df
df <- mutate(df, z = NULL)
df



#Transmute allows you to create an entirely new dataframe 
#based on calculations performed on existing variables:
fruit <- c("apple","pear","orange","grape", "orange","orange")
x <- c(1,2,4,9,4,6)
y <- c(22,3,4,55,15,9)
z <- c(3,1,4,10,12,8)
df <- data.frame(fruit,x,y,z)
df #before transmute

#transmute
df <- transmute(df, new.variable = x + y + z)
df



#Use Across to Apply a Function over Multiple Columns
#Define a simple function to double the value of a number:
double.it <- function(x) x*2

#original dataset
head(iris)

#Show a new iris dataframe with doubled values for the numeric columns:
iris %>%
  mutate(across(where(is.numeric), double.it)) %>%
  head()


#Using everything() and across() function
#Let’s use the iris dataset as an example, and suppose we 
#want to round all the numerical columns to the nearest integer. 
#We can do this as follows:
iris_num <- iris %>%
  select(where(is.numeric))

# Apply the round function to each numeric column
iris_rounded <- iris_num %>%
  mutate(across(everything(), ~ round(., 0)))



#Conditional Mutating Using case_when
#Using conditional mutating plus case_when, you can mutate a 
#new field and then set values based on multiple conditions

row1 <- c("a","b","c","d","e","f","column.to.be.changed")
row2 <- c(1,1,1,6,6,1,2)
row3 <- c(3,4,4,6,4,4,4)
row4 <- c(4,6,25,5,5,2,9)
row5 <- c(5,3,6,3,3,6,2)
df <- as.data.frame(rbind(row2,row3,row4,row5))
names(df) <- row1
df

#If any of them are true, then the last column
#(column.to.be.changed) will be either a 2 or a 3.
new.df <-df %>%
  mutate(column.to.be.changed = case_when(a == 2 | a == 5 |
   a == 7 | (a == 1 & b == 4) ~ 2, a == 0 | a == 1 | a == 4 |
   a == 3 | c == 4 ~ 3, TRUE ~ NA_real_))
new.df













### Use select function in Dplyr to Choose Variables/Columns
library(tidyverse)

fruit <- c("apple","pear","orange","grape", "orange","orange")
x <- c(1,2,4,9,4,6)
y <- c(22,3,4,55,15,9)
z <- c(3,1,4,10,12,8)
df <- data.frame(fruit,x,y,z) #before select
df

#select columns
new.x.y <- dplyr::select(df,x,y)
new.x.y

#Delete a Column
#Put a minus sign in front of any variable(s) to be dropped. 
#In this case, the fruit column is not included in the new dataframe:
new.df.no.fruit <- dplyr::select(df, -fruit)
new.df.no.fruit #after select


#Delete Columns by Name Using starts_with or ends_with
data("mtcars")
names(mtcars)

#Delete any columns with names starting with a “d”:
mtcars.no.col.names.start.with.d <- select(mtcars, -starts_with("d"))
names(mtcars.no.col.names.start.with.d)


#Drop any columns with names ending in “t”. In this case, 
#“drat” and “wt” are removed:
mtcars.no.col.names.ends.with <- select(mtcars, - ends_with("t"))
names(mtcars.no.col.names.ends.with)




#Use select_all to apply a function to all columns.
#Before - column names are not capitalized:
#create new dataframe
state <- c("Maryland", "Alaska", "New Jersey")
income <- c(76067,74444,73702)
median.us <- c(61372,61372,61372)
life.expectancy <- c(78.8,78.3,80.3)
top.3.states <- data.frame(state, income, median.us,
                           life.expectancy)
top.3.states #before - column names are not capitalized


#Capitalize column names, using the “toupper” function:
new.top.3.states <- select_all(top.3.states, toupper)
new.top.3.states #after function "toupper" applied



#Reorder the column of dataframe
data = data.frame(id = c(7058, 7059, 7060, 7089,
                         7072, 7078, 7093, 7034),
                  
                  department = c('IT','sales','finance',
                                 'IT','finance','sales',
                                 'HR','HR'),
                  
                  salary = c(34500.00, 560890.78, 67000.78, 
                             25000.00, 78900.00, 25000.00,
                             45000.00, 90000))

# display dataframe
data

# reorder the columns using select
reordered.data <- select(data, salary, id, department)
reordered.data

#Alternative way using column index
reordered.data <- select(data, 3,1,2)
reordered.data


#Select Columns Using the Pull Function
#The pull function acts somewhat like the dataframe$variable syntax 
#in R. It isolates a specified column. You can specify a column 
#from the left (e.g., second column via 2) or,using a negative 
#number, a column from the right.
top.3.states <- data.frame(state, income, median.us, life.expectancy)
top.3.states #display dataframe values

#Get only the first column from the left, the state:
pull.first.column <- pull(top.3.states,1)
pull.first.column

#Use a negative number to pull a column from the right
pull.last.column <- pull(top.3.states,-1)
pull.last.column



#Select Rows: Any Variable Meets Some Condition
#You may have a dataset where you want to know, for example, 
#if anything exceeds a certain value. The following
#code filters for anything in the dataset over 200, in any column

nrow(mtcars)

mtcars.more.than.200 <- filter_all(mtcars, any_vars(. > 200))
nrow(mtcars.more.than.200)


#Select Columns: Omit If Column Name Contains
#Specific Characters
names(mtcars)
#Select specified columns plus any column without a “p”:
cars.with.no.p <- mtcars %>%
  dplyr::select(-contains("p"))
names(cars.with.no.p)


#Select Using Wildcard Matching
names(mtcars)

#Column names selected contain the characters “ra” or “ca” or "s". 
#The pipe symbol means “OR”:
subset.mtcars <- select(mtcars,matches("ra|ca|s"))
names(subset.mtcars)














### Join datasets with Dplyr in R
library(tidyverse)

# inner_join
#In this example, we will be using the inner_join() function 
#from the dplyr package to join two different data as 
#shown in the image above in the R programming language.
# create dataframe with 1 to 5 integers
gfg1 <-data.frame(ID=c(1: 5))
gfg1

# create dataframe with 4 to 8 integers
gfg2 <-data.frame(ID=c(4: 8))
gfg2

# perform inner join
inner_join(gfg1, gfg2, by="ID")


##Left join
#Consider two simple tables: Table A contains a US state 
#abbreviation and that state’s population. Table B contains 
#the US state abbreviation and the full US state name. 
#You want to create a new dataframe which has US state full 
#name and state population. In table A, state abbreviation 
#is a primary key. The corresponding state abbreviation in
#table B is a foreign key.
us.state.areas <- as.data.frame(cbind(state.abb, state.area))
us.state.areas

us.state.abbreviation.and.name <- as.data.frame(cbind(state.abb,
                                                      state.name))
us.state.abbreviation.and.name<- us.state.abbreviation.and.name[1:25,]
us.state.abbreviation.and.name

state.info.abb.area.name <- us.state.areas %>%
  left_join(us.state.abbreviation.and.name, by = "state.abb")
state.info.abb.area.name


# right join
# create dataframes

gfg1<-data.frame(ID=c(1:5),price=c(100,50,23,12,57))
gfg1

gfg2<-data.frame(ID=c(3:7),Obj=c("ball","pen","ball","pen","ball"))
gfg2

# perform right join
right_join(gfg1,gfg2, by = "ID")  






#full join
#Create first dataframe:
names = c("Sally","Tom","Frieda","Alfonzo")
team.scores = c(3,5,2,7)
team.league = c("alpha","beta","gamma", "omicron")
team.info = data.frame(names, team.scores, team.league)
team.info

#Create second dataframe:
names = c("Sally","Tom", "Bill", "Alfonzo")
school.grades = c("A","B","C","B")
school.info = data.frame(names, school.grades)
school.info

#Create new dataframe using full join (note that Frieda shows school.grades as “NA”):


team.info.and.or.grades <- full_join(team.info, school.info, by = "names")
team.info.and.or.grades




#Semi-join
#A semi-join keeps all observations in dataset1 which match 
#dataset2. Again, the order you list dataframes determines the outcome.
#Use team.info and school.info from prior code. 
#Keep team.info rows which have a grade:
#Note that DPLYR is smart enough to understand that “names”
#is a common key. Frieda has no grades so is not included in 
#the output:

#Create first dataframe:
names = c("Sally","Tom","Frieda","Alfonzo")
team.scores = c(3,5,2,7)
team.league = c("alpha","beta","gamma", "omicron")
team.info = data.frame(names, team.scores, team.league)
team.info

#Create second dataframe:
names = c("Sally","Tom", "Bill", "Alfonzo")
school.grades = c("A","B","C","B")
school.info = data.frame(names, school.grades)
school.info


team.info.with.grades <- semi_join(team.info, school.info)
team.info.with.grades




#anti join, return all rows from x where there are no matching 
#values in y, keeping just columns from x. 
#Create first dataframe:
names <- c("Sally","Tom","Frieda","Alfonzo")
team.scores <- c(3,5,2,7)
team.league <- c("alpha","beta","gamma", "omicron")
team.info <- data.frame(names, team.scores, team.league)
team.info

#Create second dataframe:
names <- c("Sally","Tom", "Bill", "Alfonzo")
school.grades <- c("A","B","C","B")
school.info <- data.frame(names, school.grades)
school.info

team.info.but.no.grades <- anti_join(team.info, school.info,
                                     by = "names")
team.info.but.no.grades









### slice function in dplyr
library(tidyverse)

#create dataset
df <- data.frame(team=c('A', 'A', 'A', 'B', 'B', 'C', 'C'),
                 points=c(1, 2, 3, 4, 5, 6, 7),
                 assists=c(1, 5, 2, 3, 2, 2, 0))

#view dataset
df
#Method 1: Subset One Specific Row
#get row 3 only
df %>% slice(3)

#Method 2: Subset Several Rows
#get rows 2, 5, and 6
df %>% slice(2, 5, 6)


#Method 3: Subset A Range of Rows
#get rows 1 through 3
df %>% slice(1:3)

#Method 4: Subset Rows by Group
#get first row by group
df %>%
  group_by(team) %>%
  slice(1)


#Load the msleep dataframe from the package ggplot2:
msleep <- ggplot2::msleep
nrow(msleep) #initially 83 rows

#Rows 6–83 are dropped
msleep.only.first.5 <- slice(msleep, -6:-n())
#Now only the first five rows are retained
nrow(msleep.only.first.5)











### summarise function in dplyr

library(MASS)
data(gehan)
gehan2 <- gehan
head(gehan2)

library(tidyverse)  #load tidyverse last
#How many patients were in the medical trial?
gehan2 %>% summarise( kount = n())

#count by treatment/no treatment?
gehan2 %>%
  group_by(treat) %>%
  summarise(kount = n())

#general statistics for treatment/no treatment?
gehan2 %>%
  group_by(treat) %>%
  summarise(average.remiss.time = mean(time),
            median.remiss.time = median(time),
            std.dev.remiss.time = sd(time),
            median.abs.deviation = mad(time),
            IQR.remiss.time = IQR(time))


#minimum/maximum within the “by” group.
gehan2 %>%
  group_by(treat) %>%
  summarise(minimum.remission = min(time),
            max.remission = max(time))


#Summarise Across, “across” for all numeric columns
library(MASS)
#Get the first ten rows and copy to a new dataframe:
subset.survey <- survey[1:10,]
library(dplyr)
head(subset.survey)

#mean of each numeric column by sex group
subset.survey %>%
  na.omit() %>% #remove any NAs
  group_by(Sex) %>%
  summarise(across(where(is.numeric), mean,
                   .names = "mean_{col}")) %>%
  head()


#Use summarise to count variable combinations:
new.sleep <- msleep %>%
  group_by(vore, order)
s <- summarise(new.sleep, n())
s


#alternative way to get the same result
new.sleep.totals <- msleep %>%
  group_by(vore, order) %>%
  summarise(n())

new.sleep.totals


#The summarise_all method in R is used to affect every column 
df <- data.frame(col1=sample(rep(c(1: 5), each=3)),
                  col2=5: 19)

print("original dataframe")
print(df)


# summarising the data
print("summarised dataframe")
summarise_all(df, mean)



#The summarise_at() affects variables that are extracted with 
#a character vector or vars(). It applies the selected function 
#to the data frame. 
# creating a data frame
df <- data.frame(col1=sample(rep(c(1: 5), each=3)),
                  col2=1: 15,
                  col3=letters[1:15])

print("original dataframe")
print(df)

# summarising the data
print("summarised dataframe")
df %>%
  summarise_at(c("col1", "col2"), mean, na.rm=TRUE)













### gather() function in dplyr to convert multiple columns into one
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
library(tidyverse)
df_1 <- data_frame(Type = c("TypeA", "TypeA", "TypeB", "TypeB"),
                   Answer = c("Yes", "No", NA, "No"), n = 1:4)
df_1 #before

#After using spread, “No” and “Yes” answers are in separate columns
df_2 <- df_1 %>%
  filter(!is.na(Answer)) %>%
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














### Use separate() of Dplyr in R to divide a Single Column 
#into Multiple Columns

library(tidyverse)
state <- c("Maryland", "Alaska", "New Jersey")
income <- c(76067,74444,73702)
median.us <- c(61372,61372,61372)
life.expectancy <- c(78.8,78.3,80.3)
teen.birth <- c("17//34.3//54.1", "29.0//42.9//66.0", "12.1//24.9//41.3")
top.3.states <- data.frame(state, income, median.us,
                           life.expectancy,teen.birth)
top.3.states

#Using the separate function, the three years’ data crammed 
#into one column are separated out into three columns:
top.3.states.separated.years <- top.3.states %>%
  separate(teen.birth,
           into = c("2015", "2007","1991"), sep = "//")
top.3.states.separated.years



# create sample data frame
df <- data.frame(Name=c('Priyank Mishra', 'Abhiraj Srivastava',
                        'Pawananjani Kumar'),
                 State= c("Uttar Pradesh", "Maharashtra", "Bihar"))

print(" Data frame before splitting: ")
df


# Split name column into firstname and last name
df <- df %>% separate(Name, c('First Name', 'Last Name'))

print(" Data frame after splitting: ")
df











### Use n(),Nth,n_distinct() of dplyr for counting in R
library(tidyverse)
#n() for basic counts
new.sleep <- msleep %>%
  group_by(vore, order)
new.sleep
m <- mutate(new.sleep, kount = n()) #new variable, kount added to extreme right
m[1:5,c(1:4,10:12)] #limit number of columns to fit on page
m


#Filter by count of vore order which exceeds 14:
f <- filter(new.sleep, n() > 14)
f[1:5,c(1:4,10:11)]
f

#Nth Functions
#First entry:
salary.description <- c("Golden parachute type","Well to do",
                        "Average","Below average", "bring date seeds instead of flowers")
first(salary.description)

#Last entry:
last(salary.description)

#Third from the end:
nth(salary.description, -3)

#Second element of vector:
nth(salary.description,2)


#Count Distinct Values using n_distinct()

a.vector <- c(22,33,44,1,2,3,3,3,4)
original.length <- length(a.vector)
original.length

#Show number of distinct elements:
distinct.a.vector <- n_distinct(a.vector)
distinct.a.vector










### Use na_if() and coalesce() of dplyr to deal with NA values
#substitute NA rather than Inf in dividing by zero
library(tidyverse)
test <- c(100, 0, 999)
x <- 5000/test
x    #get inf in result


#Rather than having a value of infinite in the resulting vector, 
#we can tell R to substitute NA rather than Inf:
x <- 5000/na_if(test,0) # if any zero occurs in test,
x

#use coalesce() to Replace Missing Values
#Replace missing values with 999 
x1 <- c(23,4,51,NA,9)
x1

x2 <- coalesce(x,999)
x2















### Ranking functions in dplyr
library(tidyverse)  #OR library(dplyr)

#Integer ranking functions
#Ranking via Index
x <- c(39,41,25,25,30,11)
xdata <-row_number(x) #gives every input a unique rank
xdata


#Minimum Rank, to  give every tie the same (smallest) value
rank_x <- min_rank(x) 
rank_x    


#Dense Rank , works like min_rank(), but doesn't leave any gaps
rank_d <- dense_rank(x)
rank_d


test = data.frame(name=c("c", "d", "e", "f"), score = c(20, 20, 19, 18))
test
test %>% mutate(rank = dense_rank(desc(score)))


#Proportional ranking functions

#Percent Rank, shows the proportion of all values less than 
#or equal to the current rank value
#percent_rank(x) counts the total number of values less than x_i, 
#and divides it by the number of observations minus 1
x <- c(39,41,25,25,30,11)
rank_p <- percent_rank(x)
rank_p

#cume_dist(x) counts the total number of values less than or equal 
#to x_i, and divides it by the number of observations.
rank_c <- cume_dist(x)
rank_c



#ntile() creates evenly sized buckets of a dataset with ranking
#If length(x) is not an integer multiple of n, the size of the 
#buckets will differ by up to one
x <- c(39,41,25,25,30,11,90,5)
rank_n <- ntile(x,3)
rank_n













### Random sampling with dplyr 
library(tidyverse)  #OR library(dplyr)
data("mtcars")
str(mtcars)
sample_1 <- sample_n(mtcars, 12)
sample_1



#Set a seed number,reproduce the same result
set.seed(123)
sample_1 <- sample_n(mtcars, 12)
sample_1


set.seed(456)
sample_1 <- sample_n(mtcars, 12)
sample_1


set.seed(123)
sample_1 <- sample_n(mtcars, 12)
sample_1


#Sampling with replacement = TRUE means that you could get 
#the same row or element more than once
sample_rt <- sample_n(mtcars, 20, replace = TRUE)
duplicated(sample_rt)

sample_rf <- sample_n(mtcars, 20, replace = FALSE)
duplicated(sample_rf)


#sampling with weights
sample_wt <- sample_n(mtcars, 25, weight = cyl)
sample_wt[,1:5]


#sample_frac, to obtain a sample equal to a specific percentage 
#of the observations
sample_f <- sample_frac(mtcars, 0.2)
sample_f


#cars by cyl groups, and get sampling fraction of 0.3 in each group
car_group <- mtcars %>% group_by(cyl)
sample_gr_f <- sample_frac(car_group, .3, replace = TRUE)

sample_gr_f

#use tally() , count() to count
sample_gr_f %>% tally()
sample_gr_f %>% count()
















### Count Observations with Dplyr
library(tidyverse)

# count(), the unique values of one or more variables
str(mtcars)
mtcars %>% count(cyl)


#same as
mtcars %>% group_by(cyl) %>% summarise(n = n())


#tally() gets weighted counting values
mtcars %>% tally(cyl)

#sort, to show the largest group at the top
mtcars %>% count(cyl, sort = TRUE)

#count by two variables, most occured at the top
mtcars %>% count(cyl, gear, sort = TRUE)

#Creat new variable name and round, count
mtcars %>% count(time = round(qsec, 0))

#tally(), same as count()
mtcars %>% group_by(cyl) %>% tally()

# count() has add_ variants that work like
# mutate() to add variable column
mtcars %>% add_count(cyl)










