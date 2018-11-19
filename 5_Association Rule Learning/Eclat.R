# Importing dataset
#dataset = read.csv('Market_Basket_Optimisation.csv', header = FALSE)

#install.packages('arules')
library(arules)
dataset = read.transactions('Market_Basket_Optimisation.csv', sep = ',', rm.duplicates = TRUE)
summary(dataset)

itemFrequencyPlot(dataset, topN = 10)

# Training Eclat on the dataset
total_rows = nrow(dataset)
#Support a product that purchased 3 times a day for over the whole week
# 3x7/total_rows = 0.003
rules = eclat(data = dataset, parameter = list(support = 0.004, minlen = 2))

# Visualising the results
inspect(sort(rules, by = 'support')[1:10])