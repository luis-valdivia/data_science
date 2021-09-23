# Luis Valdivia
################################################################################
# 1
# a
# 0.2

# b
# 0.1

# c
# 0.3

# d
# 4.6

# e
# the CDF is in the form of a table below
# k                1       2       4       5       6
# P(x <= k)        0.1     0.1     0.3     0.8     1


# 2
# a
dbinom(5, size = 10, prob = 0.3)

# b 
pbinom(8, size = 10, prob = 0.3, lower.tail = F)

# c
pbinom(6, size = 10, prob = 0.3) - pbinom(2, size = 10, prob = 0.3)

