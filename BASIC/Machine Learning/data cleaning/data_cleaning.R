
df = read.csv('Social_Network_Ads - na.csv')

View(df)

df$Gender = as.factor(df$Gender)

summary(df$Gender)

levels(df$Gender)
