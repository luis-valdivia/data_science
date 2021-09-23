# Luis Valdivia
################################################################################
# 1
# a
# X ~ Unif (5,10)
# Plot the probability density function of X. 
x.val <- seq(from = 0, to = 15, length.out = 1000)
pdf.vec <-dunif(x.val, min = 5, max = 10)
plot(x.val, pdf.vec, type = 'l', lty = 1, lwd = 2, col = 'tomato',
     xlab = "X", ylab = "Density", main = "Probability Density Function of X")

# b
# Manually calculate P(0<X<8).
# The pdf is zero outside of the interval [5,10], so we just care about about the 
# range [5,8], which has length 3. We multiply this by 1/(10-5) = 1/5 to get 
# P(0<X<8) = 3/5 = 0.6.

# c
# Write code to determine P(0<X<8), is it the same as what you get in part b?
punif(8, min = 5, max = 10) - punif(0, min = 5, max = 10) 


# 2
# a
punif(35, min = 20, max = 40)

# b
punif(35, min = 20, max = 40)

# c
punif(22, min = 20, max = 40, lower.tail = F)

# 3
# a
# continuous

# b
# discrete
