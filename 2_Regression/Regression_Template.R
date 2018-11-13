#Importing datasets
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

#Splitting the dataset into training and test sets
# install.packages('caTools')
# library(caTools)
# set.seed(123)
# split = sample.split(dataset$Profit, SplitRatio = 0.8)
# 
# training_set = subset(dataset, split == TRUE)
# test_set = subset(dataset, split == FALSE)

#Fitting the Regression to dataset
#Create your regressor here

#Predicting a new result with the regression
y_pred = predict(regressor, data.frame(Level = 6.5))

#Visualising the the regression results
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(regressor, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Regression Model)') +
  xlab('Level') +
  ylab('Salary')
