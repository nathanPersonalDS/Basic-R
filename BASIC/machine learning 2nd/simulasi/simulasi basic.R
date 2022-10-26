library(dplyr)

#cran.studio.com

data = read.csv('K Means Data.csv')
View(data)


#elbow method reuseable

set.seed(6)
wcss = vector()

for(i in 1:10) wcss[i]= sum(kmeans(data,i)$withinss)
plot(1:10,wcss,type = 'b',
     main = paste('cluster'),
     xlabs = 'number',
     ylabs = wcss 
     )

# build kmeans
set.seed(29)
kmeans6 = kmeans(data,6,iter.max = 10, nstart = 10)

kmeans6$size
kmeans6$cluster
kmeans6$centers
View(kmeans6)


datafinal = cbind(data,kmeans6$cluster)

View(datafinal)


#get new data

data_pred = read.csv('K Means Data.csv')
install.packages('clue')
library(clue)

result =cl_predict(kmeans6, newdata = data_pred)
table(result)


