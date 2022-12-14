
df = read.csv('Social_Network_Ads.csv')

View(df)

df$User.ID = NULL

install.packages('caTools')
library(caTools)


set.seed(123)

split = sample.split(df$Purchased, SplitRatio = 0.7,)

training_set = subset(df,split == TRUE)
test_set = subset(df,split == FALSE)

training_set$Purchased = as.factor(training_set$Purchased)
test_set$Purchased = as.factor(test_set$Purchased)

summary(training_set$Purchased)
summary(test_set$Purchased)
