######################################
## INTRODUCTION TO R SOFTWARE       ##
## Author: Dr. Mohsin Ali           ##
######################################


## Before Start
## Create a folder for your project
## Open RStudio
## Create an R script (.R extension)


print("Hello World!")

## Save it
## Programming practices
## Comments!

#get working directory
getwd()
setwd("?") # fill with your desire path 

## RStudio: Session -> Set Working Directory -> ... clicking approach

# calculator
2+2 #sum
10-5 #minus
10/2 #division

# square root
9^0.5
sqrt(9) 

## Logarithm
log(10)
log(10,base = 10)
log(10,base = 2) 

# Any confusion ; need help
?sqrt

log(sqrt(9))#Function within a function

## lets create some object
## Object classes

a <- 2
b <- "trait"
c <- 0>1

class(a)
class(b)
class(c)


# let creat some vectors
nums <- c(1,"NA",8,6) # NA represents missing value
letters <- c("A", "b", "C")
class(letters)
rep_value <- rep(x = 5, 10)
rep_value
rep_values <- rep(x = c(1,2,3), 3)
rep_values

# creat data frame 

ID <- c(1,2,3,4,5)
trt <- c("A", "B", "C", "D", "E" )
trait1 <- rnorm(5, 5, 3)
trait2 <- rnorm(5, 6, 5)

first_data <- data.frame(ID, trt, trait1, trait2)
head(first_data)
View(first_data)

# Read file 
myfile  <- read.table("testdata.csv", sep = ",", header = T) # CSV

# available datasets in the R
data()

# iris data

iris <- iris
str(iris) # structure of data
head(iris)
View(iris)
dim(iris)
nrow(iris)
ncol(iris)
rownames(iris)
colnames(iris)

# summary statistics
summary(iris) 

# first method and some useful function 
min(iris$Sepal.Length) # $ sign is used to select specific column 
max(iris$Sepal.Length)
mean(iris$Sepal.Length)
median(iris$Sepal.Length)
sd(iris$Sepal.Length) # summary function does not compute standard deviation
var(iris$Sepal.Length)
range(iris$Sepal.Length)
quantile(iris$Sepal.Length, probs = 0.2)
length(iris$Sepal.Length)
round(iris$Sepal.Length, 0)
ceiling(5.5)
floor(7.2)
unique(as.vector(iris$Species)) # return unique values


# second method to select colmuns

min(iris[,1]) # [,1] lets us to select first column of the data.frame 
max(iris[,1])
mean(iris[,1])

iris[1,1] # first row and first column 

standard_error <- sd(iris$Sepal.Length)/length(iris$Sepal.Length) #
standard_error


# LOGIC OPERATIONS
# ==
# !=
# <
# >
# >=
# <=
# |
# ! 
# %in%

# create numeric vector

# Sample statistics from random samples

random_data <- rnorm(n = 100, mean = 20, sd = 10) 
random_data

random_data > 25
random_data == 25
random_data >= 25

# lets index vector (filter)
random_data[random_data > 25]
random_data[random_data < 25]

random_data > 25 | random_data <30
random_data[random_data > 25 | random_data <30]

# combine multiple or comparisons much faster

pop1  <- 1:50 
print(pop1)
pop2  <- 25:60
print(pop2)

# lets extract common numbers 

dataset1 %in% dataset2
pop1[pop1 %in% pop2]


library(pheatmap)
data("iris")
?summary()
summary(iris)


# data visualization 
hist(iris$Sepal.Length, xlab = "Sepal length", ylab = "Counts", col = "grey90", main = "My first plot in R")
boxplot(iris$Sepal.Length)
boxplot(iris$Sepal.Length, xlab = "Sepal length", col = "orange", border = "brown", horizontal = TRUE,notch = TRUE)
plot(iris$Sepal.Length, iris$Petal.Length, col="blue", pch=16, xlab = "Sepal length", ylab = "Petal length") # ?pch to get dot type
plot(iris$Sepal.Length, iris$Petal.Length, 
     col = gray(.0, .2), pch=16, xlab = "Sepal length", ylab = "Petal length") # ?pch to get dot type

# lets export plot in pdf format

pdf("my_first_plot.pdf", width = 4, height = 4)
hist(iris$Sepal.Length, xlab = "Sepal length", ylab = "Counts", col = "grey90", main = "My first plot in R")
dev.off()


jpeg("my_first_plot.jpg")
hist(iris$Sepal.Length, xlab = "Sepal length", ylab = "Counts", col = "grey90", main = "My first plot in R")
dev.off()

# correlation

cor(iris[,-5], method = c("pearson")) # removed 5th colum, i.e., species
mycor <- cor(iris[,-5], method = c("pearson"))
heatmap(mycor, symm=TRUE)

# Hypothesis tests

cor.test(iris$Sepal.Length, iris$Petal.Length)
t.test(iris$Sepal.Length, iris$Petal.Length)
t.test(iris$Sepal.Length, iris$Petal.Length, alternative = "two.sided")

model_fit <- lm(data = iris, Sepal.Length ~ Species)
anova(model_fit)

#regression 

model_fit_reg <- lm(data = iris, Sepal.Length ~ Species)
summary(model_fit)


#############################################################
###                   Wasn't that easy?!
###   Now that you've jumped in, let's learn how to swim.
#############################################################
mYtrait <- iris$Sepal.Length
is.array(mytrait)
MYTRAIT <- as.array( iris$Sepal.Length)
??pheatmap
citation("pheatmap")
summary(MYTRAIT)
hist(MYTRAIT)
boxplot(MYTRAIT)
plot(density(MYTRAIT))


fit.model <- lm(iris$Sepal.Length ~ iris$Species+ iris$year)
?lm
summary.aov(fit.model)
plot(fit.model)
PerformanceAnalytics::chart.Correlation(iris[,-5])



mydat <- read.csv("testdata.csv", header = FALSE)
sum_stats <- summary(mydat)
write.table(sum_stats, "mysummary_stats.txt", sep = "\t", row.names = F)
