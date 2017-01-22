# ====== Data processing ======

# Import data
Data = read.csv('Data.csv')

# Handle missing data
Data$Age = ifelse(is.na(Data$Age),
                     ave(Data$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                     Data$Age)

Data$Salary = ifelse(is.na(Data$Salary),
                  ave(Data$Salary, FUN = function(x) mean(x, na.rm = TRUE)),
                  Data$Salary)

Data$Country = factor(Data$Country,
                      levels = c('France', 'Spain', 'Germany'),
                      labels = c(1, 2, 3))

Data$Purchased = factor(Data$Purchased,
                      levels = c('No', 'Yes'),
                      labels = c(0, 1))

# ====== Split data sets into training and test sets =====

# install.packages('caTools')
# activate library
library(caTools)
# set seed
set.seed(123)
# create split criteria
split = sample.split(Data$Purchased, SplitRatio = 0.8)
# create training set of 8
training_subset = subset(Data, split == TRUE)
# create test set of 2
test_subset = subset(Data, split == FALSE)


# ====== Feature Scaling ======
training_subset[, 2:3] = scale(training_subset[, 2:3])
test_subset[, 2:3] = scale(test_subset[, 2:3])


