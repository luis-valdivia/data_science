# Luis Valdivia
################################################################################
# 1
# load dataset HairEyeColor
data(HairEyeColor)

# a
# column names, here as eye color
colnames(HairEyeColor)
# row names, here as hair color
rownames(HairEyeColor)

# b
# create array as in picture
my.array <- array(1:24, dim = c(3,4,2), dimnames = list(c("Row1", "Row2", "Row3"),
                                         c("Col1", "Col2", "Col3", "Col4"),
                                         c("Layer1", "Layer2")))

# 2
# make the given vector
my.vector <- c(4,9,-19,10,-2,38,17.9)

# a 
# Extract all the numbers that are even and greater than 8
my.vector[my.vector %% 2 == 0 & my.vector > 8]

# b
# Extract all the numbers that are greater than 8 or less than 0
my.vector[my.vector > 8 | my.vector < 0]

# c
# Extract all the even numbers that are greater than 8 or less than 0
my.vector[(my.vector %% 2 == 0) & (my.vector > 8 | my.vector < 0)]

# d
# Extract all the numbers other than those specified in b 
my.vector[!(my.vector > 8 | my.vector < 0)]

# 3
# a
data(faithful)
# a
# bin the waiting time data into the intervals [30, 50], (50,70], (70, 100]
cut(faithful$waiting, breaks = c(30, 50, 70, 100), include.lowest = T)

# b
# Give each interval a label and bin the waiting time data into these labels
cut(faithful$waiting, breaks = c(30, 50, 70, 100), include.lowest = T, 
    labels = c("short", "medium", "long"))

                              