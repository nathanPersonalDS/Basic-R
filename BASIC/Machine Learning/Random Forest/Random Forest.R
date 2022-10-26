df = read.csv('Social_Network_Ads.csv')

df$User.ID = NULL

df$Purchased = as.factor(df$Purchased)
#feature scaling
#df[,1:2] = scale(df[,1:2])

View(df)
library(caTools)
set.seed(123)

level = levels(df$Purchased)
split = sample.split(df$Purchased,SplitRatio = 0.7)
training_set = subset(df,split == TRUE)
test_set = subset(df,split == FALSE)

#train random forest
install.packages('randomForest')
library(randomForest)

classifier = randomForest(x = training_set[-3],
                          y = training_set$Purchased,
                          ntree=10
                          )
classifier

y_pred = predict(classifier,
                 newdata = test_set[-3]
                 )
#typenya bisa prob/
result = cbind(test_set,y_pred)
View(result)

#conf matrix
cm = table(test_set[,3], y_pred)

cm

y_pred_num =  as.numeric(y_pred)
colAUC(y_pred_num, test_set[,3], plotROC = TRUE)
