
df = read.csv('Social_Network_Ads - na.csv')
View(df)


is.na(df$Age)


df2 = subset(df,is.na(df$Age)== FALSE)


df2$EstimatedSalary = ifelse(df2$EstimatedSalary >100000, 100000, df2$EstimatedSalary)


df$EstimatedSalary[is.na(df$EstimatedSalary)] = 0



df$Age[is.na(df$Age)]= mean(df$Age, na.rm = TRUE)
