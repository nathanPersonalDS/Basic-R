

data = read.csv('Salary_Data.csv')

data = read.table('Salary_Data.csv', header =TRUE, sep = ',')


class(data)

data

var1 = data$Salary

data$Salary <=100000

var = as.numeric(data$Salary<=100000)

var


dim(data)

length(data$Salary)

head(data)
tail(data)

data


data$Salary[5:10]
data[5:10,1]


data[data$Salary <=100000,]

mean(data$YearsExperience[data$Salary<=100000])

data[data$Salary <=100000 | data$YearsExperience<3 & data$Salary <50000,]


