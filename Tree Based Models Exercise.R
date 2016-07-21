# Exercise Classification tree
### example with diamonds data

# Library: ggplot2, dataset: diamonds
# create a tree to classify for color with price and the variable x
# use the first 500 rows for your tree
# plot and visualize the tree
# check the test error by splitting the set of 500 in 2 subgroups

library(tree)

library(ggplot2)

attach(diamonds)


mytree = tree(data=diamonds[1:500,], color ~ price + x)

summary(mytree)

plot(mytree)

text(mytree)

title("Classification Tree Color of Diamonds")


# Lets check the test error rate


diamonds.df = data.frame(color, price, x)

diamonds.new = diamonds.df[1:500,]

head(diamonds.new); class(diamonds.new)

train = diamonds.new[1:250,]

test = diamonds.new[251:500,]

mytree.train = tree(color ~ price + x, data=train)

mytree.pred = predict(mytree.train, test, type="class")
# type class for classification

table(mytree.pred, test$color)


(sum(diag(table(mytree.pred, test$color))))/250








