# Exercise Iris - LDA and KNN

# Classify the iris dataset according to Specieis
# using the predictors Petal.Length and Petal.Width
# perform both LDA and KNN (k o f3)

# test dataframe
Petal.Width = c(0.7, 2.5)
Petal.Length = c(2.4, 7)
Species = c("Setosa", "virginica")
test = data.frame(Petal.Width, Petal.Length, Species)


library(lattice)

with(iris, xyplot(Petal.Length ~ Petal.Width, group=Species,
                  auto.key=T, pch=20, cex=3))

library(MASS)

mylda = lda(data=iris, Species ~ Petal.Length+Petal.Width) # Species is the outcome variable

mylda

plot(mylda)


# to use the predict function, it is useful to create a data frame
# with test vectors

# test dataframe
Petal.Width = c(0.7, 2.5)
Petal.Length = c(2.4, 7)
Species = c("Setosa", "virginica")
test = data.frame(Petal.Width, Petal.Length, Species)

mylda.prediction = predict(object = mylda, newdata = test[,c(1,2)])$class
# we specify that we want the class as output

mylda.prediction

table(mylda.prediction, test[,3])


# KNN

# clear the environment at first to avoid object name confusion

attach(iris)

train <- cbind(Petal.Width, Petal.Length)

library(class)

test = matrix(c(.7, 2.5, 2.4, 7), nrow=2)

knn(train, test, cl=Species, k=3, prob=T)


