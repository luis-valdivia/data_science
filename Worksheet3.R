# Luis Valdivia
################################################################################
# 1
# load CO2 dataset
data(CO2)

# histogram
hist(CO2[, "uptake"], col = 'darkGreen', xlab = "Carbon Dioxide Uptake in 
     μ mol/ m^2 sec", main = "Carbon Dioxide Uptake Rates in Grass Plants")

# the shape of the historgram is bimodal(two peaks)

# 2
# look for how stemplot works
?stem

# make stemplot
stem(c(9, 9, 22, 32, 33, 39, 39, 42, 49, 52, 58, 70), scale = 2)

# Stemplots preserve data by providing, in some cases, accurate representations
# of the data set. Histograms do not preserve data, instead they give a summary 
# of the data set.

# 3
# load state dataset
data(state)

# a, area of the smallest state
min(state.area)
# b, area of the largest state
max(state.area)
# c, mean area of all states
mean(state.area)
# d, median area
median(state.area)
# e, difference between the largest and smallest state areas
diff(range(state.area))


# 4
# create vector
my.vec <- c(2,3,3,3,4,2,5,10)

# find the mode
max(table(my.vec))
