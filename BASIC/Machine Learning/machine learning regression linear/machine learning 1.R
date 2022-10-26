

df = read.csv('Salary_Data.csv')

library(caTools)

set.seed(123)

split = sample.split(df$Salary, SplitRatio = 0.7)

training_set = subset(df,split == TRUE)
test_set = subset(df,split == FALSE)

regressor = lm(formula = Salary ~ YearsExperience, data = training_set )



y_pred = predict(regressor, newdata = test_set)


result = cbind(test_set,y_pred)

View(result)
