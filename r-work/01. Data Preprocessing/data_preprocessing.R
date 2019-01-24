#Data Preprocessing

#importing the dataset

working_dir <- 'F:\\workspaces\\machine_learning\\Machine_Learning_AZ_Template_Folder\\Part 1 - Data Preprocessing\\Section 2 -------------------- Part 1 - Data Preprocessing --------------------\\Data.csv'
dataset = read.csv(working_dir)

#missing data handling in R using the trick 
#mean of the column

dataset$Age = ifelse(test=is.na(dataset$Age), 
                     ave(dataset$Age,FUN = function(x) mean(x,na.rm = TRUE)), 
                     dataset$Age)

dataset$Salary = ifelse(test=is.na(dataset$Salary), 
                     ave(dataset$Salary,FUN = function(x) mean(x,na.rm = TRUE)), 
                     dataset$Salary)

#Encoding categorical data
dataset$Country = factor(dataset$Country, 
                         levels = c('France','Spain','Germany'),
                         labels = c(1,2,3)
                         )

dataset$Purchased = factor(dataset$Purchased, 
                         levels = c('No','Yes'),
                         labels = c(0,1)
                         )

#Splitting the dataset into the Training set and Test set

#importing the caTools
#install.packages('caTools')

library(caTools)

#seeding the random number
set.seed(123)

#in R we use split ratio for the training model
#in python we have used it for the test model
split = sample.split(dataset$Purchased,SplitRatio = 0.8)

training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

