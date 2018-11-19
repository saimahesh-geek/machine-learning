# Importing libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importing data
dataset = pd.read_csv('Market_Basket_Optimisation.csv', header=None)

transactions = []
for i in range(0, len(dataset)):
    transactions.append([str(dataset.values[i, j]) for j in range(0, len(dataset.columns))])

# Training apriori on the dataset
from apyori import apriori
min_support = 3*7/len(dataset)
rules = apriori(transactions, 
                min_support = 0.003,
                min_confidence=0.2,
                min_lift = 3,
                min_length=2)

# Visualising the results
results = list(rules)