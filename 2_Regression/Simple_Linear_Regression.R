#Importing datasets
dataset = read.csv('Salary_Data.csv')

library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)

training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Fitting simple regression to training set
regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)

#summary(regressor)
y_pred = predict(regressor, newdata = test_set)

#Visualising the training set results
#install.packages('ggplot2')
library(ggplot2)
ggplot() +
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary VS YearsOfExperience (Training Set)') +
  xlab('Years of experience') +
  ylab('Salary')

#Visualising the test set results
ggplot() +
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary VS YearsOfExperience (Test Set)') +
  xlab('Years of experience') +
  ylab('Salary')
  

