# import excel data file
library(xlsx)
# install.packages("xlsx")
library(lattice)
library(class)
dataset <- read.xlsx("H:/Prin Amt of Default @ FCL.xlsx", sheetName = "Data Set Combine",
                    header = TRUE)
dataset <- read.xlsx("H:/Prin Amt of Default @ FCL.xlsx", sheetName = "Data Set Combine")
attach(dataset)
with(dataset, xyplot(Prin.Amt.of.Default...FCL ~ CF.Year.Seq, group=Group, auto.key=T, pch=20, cex=2))

#or

with(dataset, xyplot(Payment.Assistance ~ CF.Year.Seq, group=Group, auto.key=T, pch=20, cex=2))


cbindset <- cbind(Prin.Amt.of.Default...FCL, CF.Year.Seq)
test <-c(20,2)
knn(cbindset, test, cl=Group, k=2, prob=T)


# LDA Classification (Linear Discriminant Analysis)
library(MASS)
datasetlda = lda(data=dataset, Group ~ Prin.Amt.of.Default...FCL + CF.Year.Seq)
datasetlda
plot(datasetlda)
with(dataset, xyplot(Prin.Amt.of.Default...FCL ~ Payment.Assistance, group=Group, auto.key = T, pch=20,cex=3))
