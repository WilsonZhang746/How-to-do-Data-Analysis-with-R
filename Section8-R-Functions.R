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

