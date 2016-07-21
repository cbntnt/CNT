# Exercise K Means Clustering

# data for the exercise: extract the first 3 numeric columns from the iris dataset
head(iris)
# check if the extraction worked (hint: head, summary, nrow, class, ...)
# perform K means clustering on the dataset (experiment with the number of K)

# create a vector with all observation numbers of a specifc cluster (hint: which, on cluster 3)
# visualize your results in a 3d plot (hint: library rgl, plot3d)

# at first lets get the dataset to work with
clusterdata = data.frame(iris$Sepal.Length, iris$Sepal.Width, iris$Petal.Length)

# checking if the data frame has the attributes we want
head(clusterdata); summary(clusterdata); nrow(clusterdata); class(clusterdata)

# I am performing 3 kmeans analyses with K of 3, 5, 8
clusterk3 = kmeans(clusterdata, centers = 3, nstart = 35)

clusterk5 = kmeans(clusterdata, centers = 5, nstart = 35)

clusterk8 = kmeans(clusterdata, centers = 8, nstart = 35)

# Lets take a look at the 3 objects
clusterk3; clusterk5; clusterk8

# extracting a vector with all observation IDs in a given cluster
cluster3vector = which(clusterk3$cluster == 3)

cluster3vector

library(rgl) # for an easy 3d scatterplot function

# using the plot3d function to get a 3 dimensional scatterplot
plot3d(clusterdata, size = 6, col = clusterk3$cluster,
       xlab = "", ylab = "", zlab = "", sub = "3 Clusters")
plot3d(clusterdata, size = 6, col = clusterk5$cluster,
       xlab = "", ylab = "", zlab = "", sub = "5 Clusters")
plot3d(clusterdata, size = 6, col = clusterk8$cluster,
       xlab = "", ylab = "", zlab = "", sub = "8 Clusters")

# which plots are most overlapping?



