### Clustering

# K means clustering
?kmeans

# for a simple example we can use the rivers dataset
plot(rivers)

# the function is called kmeans, number of clusters = center
# nstart specifies the number of random sets to start with
kclust = kmeans(rivers, centers = 3, nstart = 30)

kclust

# we can get a visual impression of our clustered data
plot(rivers, col = kclust$cluster)

# Hierarchical Clustering

# simple example of euclidean distance
# Square Root of Sum of Squares of Differences in Attributes
a = mtcars[1,]
b = mtcars[11,]
dist(rbind(a,b))


# lets get the distance matrix of the first 16 obs at first
dm = dist(as.matrix(mtcars[1:16,]))

# use the hclust function for hierarchical clustering
hcluster = hclust(dm) # standard method is complete linkage

# dendrogram
plot(hcluster)

