# Tree models

# for our example we are using the tree library (one of the main packages for the )

library(tree)

# lets work with the standard mtcars dataset

attach(mtcars)

?tree


# lets plot the data to see what we are dealing with

library(lattice)

with(mtcars, xyplot(mpg ~ wt, group=am, auto.key=T, pch=20, cex=3))



# the function is quite similar to lm

mytree = tree(data=mtcars, am ~ wt + mpg)

# as you can see the terminal nodes give us group means
# which is not useful for a Yes vs No question like transmissions

plot(mytree)

text(mytree)

title("Pseudo_Regression Tree MTCARS", sub="automatic vs manual Transmission")


# for this true classification tree I am factorising am
# you can see it as qualitative now

mytree = tree(data=mtcars, as.factor(am) ~ wt + mpg)

summary(mytree)

plot(mytree)

text(mytree)

title("Pseudo_Regression Tree MTCARS", sub="automatic vs manual Transmission")

# the terminal nodes appear to be the same, so the whole last split


# lets split the dataset in half and calculate the test error rate

# I am creating a new dataframe with am as factor
mtcars.new = data.frame(am.new = as.factor(am) ,wt, mpg)

head(mtcars.new)

class(mtcars.new$am.new)

#training and test data made out of the initial mtcars.new
train = mtcars.new[1:16,]

test = mtcars.new[17:32,]

# tree made from the training set
mytree.train = tree(am.new ~ wt + mpg, data=train)

# now we run a prediction on the test data
mytree.pred = predict(mytree.train, test, type="class")

# and here we compare the results_ predicted vs reality
table(mytree.pred, test$am.new)

treetable = table(mytree.pred, test$am.new)

(sum(diag(treetable)))/16

# in this case the tree would be correct in 87.5% of the cases


# Random Forests and Bagging
# 2 mwthods to reduce variance in the model

# idea bagging: use bootstrapping to sample 100s of training sets and
# calculate a tree model for each of th sets - average the models

# idea randomFo: same as baggin but only a limited number of predictors is 
# used to calculate a given split

library(randomForest)

library(ggplot2)

set.seed(123)

# mtr determines the number of predictor variables to be used
# the full number makes for a baggin approach
bagging = randomForest(formula = color ~ . , data = diamonds[1:500,], mtr=9) # mtr =9 b/c there are 9 predictor variables

plot(bagging)

# now it is a random forest with 3 predictors per split
randomFor = randomForest(formula = color ~ . , data = diamonds[1:500,], mtr=3) # 3 variables used for each split, thus MTR = 3

# we can check the importance of the predictors
importance(randomFor)

# and we can visualize it
varImpPlot(randomFor)

# lets test the random forest with a test data frame
test = diamonds[501:800,]

predicted.bagging = predict(newdata=test, bagging, type = "class")

predicted.randomFor = predict(newdata=test, randomFor, type = "class")

table(predicted.bagging, test$color)

table(predicted.randomFor, test$color)

sum(diag(table(predicted.bagging,test$color)))/300

sum(diag(table(predicted.randomFor,test$color)))/300

# keep in mind that color has 7 levels - .35 better than pure chance of 1/7 ~ 14%



