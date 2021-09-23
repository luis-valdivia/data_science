# Luis Valdivia
################################################################################
# 1
# load mtcars dataset
data(mtcars)

# plot of Miles/(US) gallon versus Rear axle ratio 
plot(mtcars$drat, mtcars$mpg, main = "Miles/(US) Gallon versus Rear Axle Ratio", 
     xlab = "Rear Axle Ratio", ylab = "Miles Per Gallon")

# boxplot to compare of miles per gallon to number of gears
boxplot(mtcars$mpg ~ mtcars$gear, horizontal = T, main = "Miles Per Gallon and 
        Number of Gears Side-by-Side", xlab = "Miles Per Gallon", 
        ylab = "Number of Gears", col = c("Grey", "LightYellow", "Seashell"))

# 2
# a
# create a vector of 15 evenly spaced points on [0,1], including the end points
my.data <- seq(from = 0, to = 1, length.out = 15)

# create a 5x3 matrix from the previous vector, filling it with the deafult,
# which is by column
my.matrix <- matrix(my.data, nrow = 5, ncol = 3, byrow = F)

# b
# extract column 1
my.matrix[,1]

# c
# extract the element in row 3, column 1
my.matrix[3,1]

# 3
# create vectors a and b
a <- c(1,2,3)
b <- c(6,7,8)
# combine into a matrix
cbind(a,b)

# 4
# create array with entries from 1 to 20
my.array <- array(data = 1:20, dim =c(3,4,2))
# a
# Use the apply function, find the column sums of the array.
apply(my.array, 2, sum)

# b
# What does the margin c(1,2) do?
# gives element-wise operation, returning a 3x4 matrix in this case

# 5
# a
# view dataset HairEyeColor
View(HairEyeColor)

# load dataset HairEyeColor
data(HairEyeColor)

# b
# i
# total number of respondents
sum(HairEyeColor)

# ii
# total number of Male respondents in the survey
sum(HairEyeColor[,,1])


# iii
# number of respondents with blue eyes
sum(HairEyeColor[,2,])

# iv
# number of Females with red hair
HairEyeColor[3,,2]

