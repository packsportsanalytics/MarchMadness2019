# clear workspace
rm(list = ls())

# read in data sets
# fullStandardizedData was randomly split into trainingDataset (70%) and testDataset (30%)
# these contain all tournament games from 2004-2016
# for each game, it has tons of stats for each team
trainingDataset <- read.csv("trainingData.csv")
testDataset <- read.csv("testData.csv")
fullStandardizedData <- read.csv("finalDatasetStandardized.csv")



# Modeling using Logistic Regression
# predict win probability for "Team 1" - from 0 to 1
# this is a simple example just using Adjusted Efficiency Margin for one team
logitFit <- glm(Won ~ AdjEM.x, family = "binomial", data = trainingDataset)

# summary() lets us view the details of the model
summary(logitFit)

# now that the model is built, we test it on the other data - testDataset
logitPredict <- predict(object = logitFit, newdata = testDataset, type = "response")

# this simply calculates the percentage of games the model predicted correctly
sum(testDataset$Won == round(logitPredict)) / nrow(testDataset)


#######################################
# use this area to copy/paste and test out a bunch of different models

logitFit <- glm(Won ~ AdjEM.x, family = "binomial", data = trainingDataset)
summary(logitFit)
logitPredict <- predict(object = logitFit, newdata = testDataset, type = "response")
sum(testDataset$Won == round(logitPredict)) / nrow(testDataset)