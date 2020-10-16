# DA_Lab3_regression_tree.R
# 
# This script is used to study the usage of Regression tree 
# using the msleep dataset

# Clear everything
rm(list = ls())

# Install and import necessary libraries
if (!require('rpart')) install.packages('rpart')
# if (!require('ggplot2')) install.packages('ggplot2', dependencies = TRUE)
install.packages('ggplot2', dependencies = TRUE)

library(rpart)
library(ggplot2)

# Get the dataset
data('msleep')
str('msleep') # show the details

str(data)

# Create a new dataframe with the columns: 3 = vore, 6 = sleep_total, 10 = brainwt, 11 = bodywt
mSleepDF1 <- msleep[ 3, 6, 10, 11  ]

# Observe the structure of the mSleepDF
str(mSleepDF1)
head(mSleepDF1)

# Bulding regression decision tree that predicts the total sleeping hours of the
# mammals based on the other variables on the datasets
sleepModel_1 <- rpart(sleep_total~., data = mSleepDF1, method = 'anova')
# We are using anoma method because the dependent variable, i.e. sleep_total is numerical

print(sleepModel_1)

# Let visualize the model
rpart.plot(sleepModel_1, type = 3, fallen.leaves = TRUE)
# Here, type = 3 means to draw separate split labels for the left and right directions.
# fallen_leaves = TRUE is the deafult so as to place the leaves at the bottom of the graph
# It may help to set fallen_leaves to FALSE if the graph is too crowded with extremely
# small font size.

rpart.plot(sleepModel_1, type = 3, digits = 3, fallen_leaves = TRUE) # with 3 digits
rpart.plot(sleepModel_1, type = 3, digits = 4, fallen_leaves = TRUE)

