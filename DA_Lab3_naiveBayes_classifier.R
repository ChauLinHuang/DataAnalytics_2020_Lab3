# DA_Lab3_naiveBayes_classifier.R
# 
# Call the Naive Bayes Classifier to do the prediction

# Call the Naive Bayes classifier package e1071 which in terms would automatically
# call the class package.
install.packages('e1071')
library('e1071')

# Load in the iris dataset
library(tidyverse)
data("iris")

classifier <- naiveBayes( iris[, 1:4], iris[, 5] )
table(predict(classifier, iris[, -5]), iris[5], dnn = list('predicted', 'actual'))
classifier$apriori

classifier$tables$Petal.Length

mean <- 1.462
st_dev <- 0.1736640
plot( function(x) dnorm(x, mean, st_dev), 0, 8, col = 'red', main = 'Petal length dstribution for the three different species' )

mu1 <- 4.260
sigma1 <-0.4699110
curve(dnorm(x, mu1, sigma1), add = TRUE, col = 'blue')

mu2 <- 5.552
sigma2 <- 0.5518947
curve(dnorm(x, mu2, sigma2), add = TRUE, col = 'green')