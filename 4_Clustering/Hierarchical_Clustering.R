# Importing dataset
dataset <- read.csv('Mall_Customers.csv')
X = dataset[4:5]

# Using dendrograms to find optimal number of clusters
dendrogram = hclust(dist(X, 'euclidean'), method = 'ward.D')
plot(dendrogram,
     main = paste('Dendrogram'),
     xlab = 'Customers',
     ylab = 'Euclidean distances')


# Applying hierarchical to dataset
hc = hclust(dist(X, 'euclidean'), method = 'ward.D')
y_hc = cutree(hc, k=5)

# Visualising the clusters
library(cluster)
clusplot(X, 
         y_hc,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of clients'),
         xlab = 'Annual income',
         ylab = 'Spending Score')