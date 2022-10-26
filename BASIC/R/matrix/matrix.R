

mat = matrix(c(1,2,3,4,5,6,7,8,9), nrow = 3, byrow = TRUE)

matrix(c(1,2,3,4,5,6), nrow = 3, byrow = FALSE)

mat[c(1:2),3]

mat[2,3]

mat*2


mat2 = matrix(c(2,3,4,5,6,7,8,9,10), nrow = 3, byrow = TRUE)

mat2


mat*mat2


DATA KONTINYU vs DISKRIT


x <- c(0,1,1,0,0,1,0,0,1,1,1,0)
y <- as.factor(x)
levels(y)
summary(y)
