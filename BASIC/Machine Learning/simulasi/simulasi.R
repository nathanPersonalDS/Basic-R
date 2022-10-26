
df= read.csv('Social_Network_Ads.csv')

df$User.ID=NULL

df [,1:2] = scale(df[,1:2])


library(caTools)

set.seed(123)

split= sample.split(df$Purchased, SplitRatio = 0.7)
training_set = subset(df, split == TRUE)
test_set = subset(df, split == FALSE)

#train logistic regression

classifier = glm(formula = Purchased ~.,
                 family = binomial,
                 data = training_set
                 )
summary(classifier)

#predict new data

prob_pred = predict(classifier,
                    type='response',
                    newdata = test_set[-3]
                    )

prob_pred

y_pred = ifelse(prob_pred >= 0.5, 1,0)
result = cbind(test_set,y_pred)

View(result)


#conf matrix

cm = table(test_set[,3],y_pred)

cm

#auc
y_pred_num = as.numeric(y_pred)
colAUC(y_pred_num,test_set[,3],plotROC = TRUE)
