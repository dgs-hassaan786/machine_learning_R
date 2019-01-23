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