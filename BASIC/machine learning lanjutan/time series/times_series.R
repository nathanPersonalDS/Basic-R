

data = read.csv('Timeseries Data.csv')


X = data[,2]

install.packages('forecast')
library(forecast)

X_TS  = ts(X, frequency = 12, start = c(2014,1))
plot(X_TS)


#x only
mod = auto.arima(X_TS)
result = data.frame(mod$fitted)
x_predict = forecast(mod, h = 13)


accuracy(x_predict)
plot(x_predict)


x_predict = data.frame(x_predict)
