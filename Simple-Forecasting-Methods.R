######################################
# Forecasting Models with R          #
# 2. Simple Forecasting Methods      #
# (c) Diego Fernandez Garcia 2016    #
# www.exfinsis.com                   #
######################################

# 1.1. Load R packages 
library("forecast")
library("tseries")

# 1.2. Set working directory
# getwd()
# setwd("C:/.../Forecasting Models with R")

# 1.3. Read .CSV file
x <- read.csv("Apple_Daily.csv",header=T)
# plot(x, type="l",main="Daily Apple Stock Prices 10/2014-10/2015",ylab="Level",xlab="Day")

# 1.4. Delimit training range
xt <- window(x[,2],end=252)
# plot(xt, type="l",main="Daily Apple Stock Prices 10/2014-09/2015",ylab="Level",xlab="Day",xlim=c(1,274))

# 1.5. Delimit forecasting test range
xf <- window(x[,2],start=253)
# plot(xf, type="l",main="Daily Apple Stock Prices 10/2015",ylab="Level",xlab="Day")

# 1.6. Automatic script run
# For .txt file
## Ctrl + A and paste in console
# For .R file
## source("1. Forecasting Models Data.R",echo=T)

#########

# 2.1. Arithmetic Mean
mean <- meanf(xt,h=22) #forecasting with the trading range # h=22 is the number of days (ie.# of observations (days)) we are going to forecast into the future
plot(mean,main="Arithmetic Mean Method",ylab="Level",xlab="Day")
lines(x)
summary(mean)

# 2.2. Naïve or Random Walk Method
rw1 <- naive(xt,h=22)
rw2 <- rwf(xt,h=22)
plot(rw1,main="Naïve or Random Walk Method 1",ylab="Level",xlab="Day")
plot(rw2,main="Naïve or Random Walk Method 2",ylab="Level",xlab="Day")
lines(x) # check how the forecasting went. The line fills in the actual data within our forecasting range
summary(rw1) # if you want to see data



# 2.3. Seasonal Random Walk Method
srw <- snaive(xt,h=22)
plot(srw,main="Seasonal Naïve Method",ylab="Level",xlab="Day")
lines(x)

# 2.4. Random Walk with Drift Method (To get forecasted value tt takes the arithmetic mean of prior periods added to previous periods data)
rwd <- rwf(xt,drift=T,h=22)
plot(rwd,main="Random Walk with Drift Method",ylab="Level",xlab="Day")
lines(x)
summary(rwd)


# 2.5. Forecasting Accuracy
# Training set = Data from 1 to 252 (1/oct/2014 - 29/sep/2015)
# Test set = Data form 253 to 274 (1/oct/2015 - 30/oct/2015)
accuracy(mean,xf)
accuracy(rw1,xf)
accuracy(srw,xf)
accuracy(rwd,xf)

##########