df = read.csv('Social_Network_Ads.csv')

df$User.ID = NULL

#feature scaling
df[,1:2] = scale(df[,1:2])

View(df)
library(caTools)
set.seed(123)

split = sample.split(df$Purchased,SplitRatio = 0.7)
training_set = subset(df,split == TRUE)
test_set = subset(df,split == FALSE)


#train model KNN
library(class)
y_pred = knn(train = training_set[,-3],
             test = test_set[,-3],
             cl = training_set[,3],
             k = 5
             )
summary(y_pred)

result = cbind(test_set,y_pred)
View(result)


#conf matrix
cm = table(test_set[,3], y_pred)

cm

y_pred_num =  as.numeric(y_pred)
colAUC(y_pred_num, test_set[,3], plotROC = TRUE)
