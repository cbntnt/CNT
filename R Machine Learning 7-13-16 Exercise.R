

# Exercise Cross Validation

# Create a model with the faithful dataset
?faithful
# explain waiting with eruptions
# get a visual impression to get an idea of the relationship
# get the MSE using simple cross validation and 5-fold CV
# in the solution I Will use a 50/50 split of the dataset for simple CV
# Compare the results - which one has a lower error rate?
# What could be possible problems with the CV approach I outlined

# 1. simple CV
# simple xy plot
plot(faithful$waiting, faithful$eruptions)

# linear model explaining the waiting time - training data 1-136
mymodel = glm(data = faithful[1:136,], waiting ~ eruptions)

#MSE on the second half of the data 9validation set)
mean((faithful$waiting - predict(mymodel, faithful))[137:272]^2)

# Or an alternative way to code it
mean((faithful$waiting[137:272] - predict(mymodel, faithful[137:272,]))^2)

# 2. 5-fold CV

library(boot) # for the cv.glm function

# we are going to get a model with the full dataset
mymodel2 = glm(data=faithful, waiting ~ eruptions)

#cv.glm for 5 fold CV
cv.result = cv.glm(data = faithful, mymodel2, K = 5)

# the error rate is slightly lower than the standard CV
cv.result$delta

#if you perform simple Cv with a 50/50 split, you could get bias in your model

