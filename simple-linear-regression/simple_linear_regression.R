# Simple Linear Regression

# Import data
dataset = read.csv('Salary_Data.csv')

# Split data into test and training sets
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Fit training set to simple linear regression
regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)

# Predicting test results
y_pred = predict(regressor, newdata = test_set)

# Visualing the training results
# install.packages('ggplot2')
library(ggplot2)

# Plot training set
ggplot() +
  geom_point(aes(x = training_set$YearsExperience,
                 y = training_set$Salary),
             colour= 'red') +
  geom_line(aes(x = training_set$YearsExperience,
                y = predict(regressor, newdata = training_set)),
            colour= 'blue') +
  ggtitle('Salary vs Years Of Experience (Training Set)') +
  xlab('Years of Experience') +
  ylab('Salary')

# Plot test set
ggplot() +
  geom_point(aes(x = test_set$YearsExperience,
                 y = test_set$Salary),
             colour= 'red') +
  geom_line(aes(x = training_set$YearsExperience,
                y = predict(regressor, newdata = training_set)),
            colour= 'blue') +
  ggtitle('Salary vs Years Of Experience (Test Set)') +
  xlab('Years of Experience') +
  ylab('Salary')
