df = read.csv('Social_Network_Ads.csv')

df$User.ID = NULL

#feature scaling
#df[,1:2] = scale(df[,1:2])

View(df)
library(caTools)
set.seed(123)

split = sample.split(df$Purchased,SplitRatio = 0.7)
training_set = subset(df,split == TRUE)
test_set = subset(df,split == FALSE)

#train decision tree
library(rpart)

classifier = rpart(formula = as.factor(Purchased)~. ,
                   data = training_set
                   )
classifier

y_pred = predict(classifier,
                 newdata = test_set[-3],
                 type = 'class'
                 )
#typenya bisa prob/
result = cbind(test_set,y_pred)
View(result)
