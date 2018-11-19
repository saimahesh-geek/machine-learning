# Importing dataset
#dataset = read.csv('Market_Basket_Optimisation.csv', header = FALSE)

#install.packages('arules')
library(arules)
dataset = read.transactions('Market_Basket_Optimisation.csv', sep = ',', rm.duplicates = TRUE)
summary(dataset)

itemFrequencyPlot(dataset, topenv = 100)

# Training apriori on the dataset
total_rows = nrow(dataset)
#Support a product that purchased 3 times a day for over the whole week
# 3x7/total_rows = 0.003
rules = apriori(data = dataset, parameter = list(support = 0.003, confidence = 0.2))

# Visualising the results
inspect(sort(rules, by = 'lift')[1:10])

#Support a product that purchased 4 times a day for over the whole week
# 3x7/total_rows = 0.003
rules = apriori(data = dataset, parameter = list(support = 0.004, confidence = 0.2))

# Visualising the results
inspect(sort(rules, by = 'lift')[1:10])