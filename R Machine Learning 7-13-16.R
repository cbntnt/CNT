# (Cross-) validation

# simple validation

set.seed(23) # to make the example reproducible

?sample

library(ggplot2)

?diamonds
mydiamonds = diamonds[1:500,]

attach(mydiamonds)

trainingdiamonds = sample(x=500, size=200) # 200 observations from 500 in the dataset LM = linear model

mylm = lm(data = mydiamonds, subset = trainingdiamonds, x ~ y + z)

mean ((x - predict(mylm, mydiamonds))[-trainingdiamonds]^2) # MSE (Mean Standard Error)

library(boot) # for the CV functions

# LOOCV

myglm = glm(data = mydiamonds, x~y+z)

myglm.error = cv.glm(data = mydiamonds, myglm)

myglm.error$delta # delta is the cv estimate or the error rate - raw and adjusted

# Cross Validation K=5

myglm.error2 = cv.glm(data = mydiamonds, myglm, K=5) # using K I can adjust the 

myglm.error2$delta

# Excercise Cross Validation


