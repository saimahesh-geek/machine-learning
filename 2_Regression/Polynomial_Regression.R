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

#Fitting Linear Regression to dataset
lin_reg = lm(formula = Salary ~ Level,
             data = dataset)
#summary(regressor)
y_pred = predict(regressor, new_data = dataset)

#Fitting Polynomial Regression to dataset
dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4
poly_reg = lm(formula = Salary ~ .,
              data = dataset)

#Visualising the linear regression results
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(lin_reg, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Linear Regression)') +
  xlab('Level') +
  ylab('Salary')
  
#Visualising the polynomial regression results
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(poly_reg, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Polynomial Regression)') +
  xlab('Level') +
  ylab('Salary')

#Visualising the polynomial regression results (Smooth curve)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.1)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(poly_reg, newdata = data.frame(Level = x_grid,
                                                                       Level2 = x_grid^2,
                                                                       Level3 = x_grid^3,
                                                                       Level4 = x_grid^4))),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Polynomial Regression)') +
  xlab('Level') +
  ylab('Salary')

#Predicting a new result with Linear Regression
y_pred = predict(lin_reg, data.frame(Level = 6.5))

#Predicting a new result with Polynomial Regression
# y_pred = predict(poly_reg, data.frame(Level = 6.5,
#                                       Level2 = 6.5^2,
#                                       Level3 = 6.5^3,
#                                       Level4 = 6.5^4))