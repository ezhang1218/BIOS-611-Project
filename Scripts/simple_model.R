library(ggplot2)
library(reshape2)


source('Scripts/read_data.R')

bikes$workingday = as.factor(bikes$workingday)

#simple multiple regression
model1 <- lm(bikes$count ~ bikes$temp + bikes$humidity + bikes$ windspeed + bikes$workingday)
summary(model1)

#check for interaction
model2 <- lm(bikes$count ~ bikes$temp + bikes$humidity + bikes$ windspeed + bikes$workingday + bikes$temp*bikes$humidity)
summary(model2)

#compare two models
anova(model1,model2,test = "F")