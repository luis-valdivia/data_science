# Luis Valdivia
################################################################################
# 1
# a
# Create the following data frame using the data frame function.

subject <- c("English", "Maths", "Chemistry", "Physics")
precentage <- c(80, 100, 85, 95)
my.data.frame.1 <- data.frame(subject, precentage)

# b
# Rename columns as "Course" and "Score", respectively
colnames(my.data.frame.1) <- c("Course", "Score")

# Write code to extract the "Course" column
my.data.frame.1[1]


# 2
# a
# read the dataset description
?state.x77

# b
# load state dataset
data(state)
# look at state.x77
state.x77

# c
# What kind of object is state.x77?
class(state.x77)
# it's a matrix

# d
# create a data frame using state.x77
df1 <- data.frame(state.x77)

# e
# how many states have income less than $4300
length(df1[df1[,2] < 4300, 2])

# 3
# load swiss data
data(swiss)
# create a data.frame from swiss with only the rows and columns states below
s.rows <- c(1, 2, 3, 10, 11, 12, 13)
s.col <- c("Examination", "Education", "Infant.Mortality")
data.frame(swiss[s.rows, s.col])
