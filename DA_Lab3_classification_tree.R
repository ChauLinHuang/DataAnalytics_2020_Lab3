# DA_Lab3_classification_tree.R
# 
# Use ctree() to build a classification tree. The dataset we are using is C50.

# install the C50 package
if (!require('C50')) install.packages('C50')
library(C50)

# We will use the iris dataset to do the classification
data('iris')
head('iris')
str('iris')
table(iris$Species) # By using table() we can browse the columns of the dataset

# Set the seed
set.seed(9850)
# Generate random numbers
grn <- runif( nrow(iris) )

# Shuffle the iris dataset to create randomness
irisrand <- iris[ order(grn), ]

# Observe that the rows are randomized
str(irisrand)
classificationModel1 <- C5.O( irisrand[ 1:100, -5 ], irisrand[ 1:100, 5 ] )
classificationModel1
summary(classificationModel1)

# Predict
prediction1 <- predict( classificationModel1, irisrand[ 101:150,] )
prediction1

# Use confusion matrix to evaluate our prediction.
table( irisrand[101:150, 5], prediction1)
# it is the same to write as table( irisrand[101:150, 5], Predicted = prediction1)

