# KNN Classification

?mtcars

attach(mtcars)

library(lattice)

# we want to create a model to classify the number of cylinders
#according to weight and mpg

with(mtcars, xyplot(wt ~ mpg, group=cyl,auto.key=T,pch=20, cex=3)) # the lower number of cylinders (i.e. 4) the greater the mpg


# for KNN we need to get the library class
library(class)

# lets take a look at the knn function we are using
?knn

# train: the data we use to create our model
# test: the data we use to test if the model works
# k: number of neighbors we use for the model

# extra agruments:

# l: a minimum amount of votes of one class
# use.all: tie handling
# prob: shows the proportion of winning class votes

# data frame for trianing
train <- cbind(mpg, wt)

# test data
test<- c(26,2.2)

knn(train, test, cl=cyl,k=2,prob=T)


# LDA Classification (Linear Discriminant Analysis)


# we need MASS for the lda function
library(MASS)

?lda
# similar to lm and glm

mylda = lda(data=mtcars, cyl ~ wt + mpg)

mylda

# prior probabilities give the proportions of a class in the dataset
# we see the group means for each independent variable and class
# coefficients are calculated to define the areas of each class

plot(mylda)

# to use the predict function, it is usefule to create a data frame with the test vector

# test data as data frame
wt= c(2.2,4,1.1,5)
mpg=c(26,20,27,15)
class=c(4,6,4,8)
test=data.frame(wt, mpg,class)

mylda.prediction = predict(object = mylda, newdata = test[,c(1,2)])$class
# we specify that we want the class as output

mylda.prediction

table(mylda.prediction, test[,3])
# the diagonal shows the correct predictions




# Logistic Regression

# in this case we want to model a binary outcome am, with wt, mpg and drat

head(mtcars)

mymtcars=data.frame(am = as.factor(mtcars$am),
                    wt = mtcars$wt,
                    mpg = mtcars$mpg,
                    drat = mtcars$drat)

# since we are performing a logistic regression on a classification, we check if our outcome
# variable is indeed a factor (class)
class(mymtcars$am)

# glm with family = binomial is the classic way of logistic regression in R
mylog = glm(data=mymtcars, am ~ wt + mpg + drat, family = "binomial")

summary(glm(data = mymtcars, am ~ wt + mpg + drat, family = "binomial"))
# in this case I deceide to keep all three predictors in the model

# we are going to run the model on the training data itself
testprediction <- predict(mylog, type="response")

testprediction
# prob <= 0.5 means 0 or automatic

# we can get a character vector of the 2 transmission types
predicted.classes = rep("automatic", 32)
predicted.classes[testprediction > .5]="manual"
predicted.classes

table(predicted.classes, mymtcars$am)
# the table tells us that we had 2 misclassifications

# now we see what the model would predict for our test add-on
# for the predict function it is best to use a data frame
addon = data.frame(wt = 4.500, mpg = 30.2, drat = 4.9)

predict(mylog, addon, type="response")
# type response for probabilities

## the model would predict that a car of 4500 lbs has a 0% probability of having a manual transmission






