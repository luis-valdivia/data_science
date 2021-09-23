# Luis Valdivia
################################################################################
# 1
# values for x
x.vals <- seq(from = -10, to = 20, length.out = 1000)

# vectors for each distribution
first.dist <- dnorm(x.vals, 0, 3)
second.dist <- dnorm(x.vals, 4, 1)
third.dist <- dnorm(x.vals, 5, 5)

# the y values will be between 0 and this number
y.max <- max(dnorm(0, 0, 3), dnorm(4, 4, 1), dnorm(5, 5, 5))

# then we plot the three density functions
plot(x.vals, first.dist, type = 'l', col = 'green', lwd = 1, lty = 1, 
     xlab = "X", ylab = "Density", main = "Three Normal Distributions", 
     ylim = c(0, y.max), xlim = c(-8,16))
lines(x.vals, second.dist, type = 'l', col = 'red', lwd = 2, lty = 2)
lines(x.vals, third.dist, type = 'l', col = 'blue', lwd = 3, lty = 3)


# 2
# scores are normally distributed with mean 68 and standard deviation 9
# P(X > 77)
pnorm(77, 68, 9, lower.tail = F)


# 3
# X is normally distributed with mean 80 and standard deviation 12
# a
# P(65 < X < 95) = P(X < 95) - P(X < 65)
pnorm(95, 80, 12) - pnorm(65, 80, 12)

# b
# P(X < 74)
pnorm(74, 80, 12)


# 4
# IQ is normally distributed with mean 100 and standard deviation 16
# a
# What percentage of the population have an IQ in the interval (84, 116)?
pnorm(116, 100, 16) - pnorm(84, 100, 16)
# 68.26895%

# b
# P(X > M) = 0.02, find M.
qnorm(0.02, 100, 16, lower.tail = F)
# so 132.86 is the minimum IQ to get into MENSA


# 5
# iterates over the numbers 4 through 15 and prints the cube of each number
# using print()
for(i in 4:15){
  print(i^3)
}


# 6
# miles.to.kilometers() converts miles to kilometers
miles.to.kilometers <- function(m){
  return(m* 1.60934)
}
  

