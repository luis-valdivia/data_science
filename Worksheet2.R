# Luis Valdivia

# 1
# create vector x
x <- c(5, 7, 3, 10, 1, 7, 19 ,5, 2)
# extract the 4th element of x
x[4]
# extract all elements of x except the 4th element
x[-4]
# extract the 5th, 6th and 7th elements of x
x[c(5:7)]
# change the 3rd element of x to 12
x[3] <- 12
# Replace the 1st and 3rd elements of x with the number 4
x[c(1,3)] <- 4

# 2
# a
c(1:6)
# b
c(10:14)
# c
c(-3:2)

# 3
# a
seq(from = 20, to = 80, by = 20)
# b
seq(from = 7, to = -3, by = -2)
# c
seq(from = 0.5, to = 1.07, by = 0.03)

# 4
# a
rep(4, times = 8)
# b
rep(c(1:4), each = 2)
# c
rep(c(1:3), times = 3)

# 5
# create vector y
y <- c(15, 7, 3, 2, 8, 7, 4 ,8 , 1, 7, 19 ,5, 2)
# the mean
mean(y)
# the median
median(y)
# sort in ascending order
sort(y)
# sort in descending order
sort(y, decreasing = TRUE)
