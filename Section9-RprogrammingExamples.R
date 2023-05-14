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








