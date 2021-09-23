# Luis Valdivia
################################################################################
# 1
# we use tibbles so
library(tibble)
# a
# Is CO2 a data frame or tibble?
is.data.frame(CO2)
is.tibble(CO2)   
# so it's a data frame

# b
# Create an object CO2.tibble by coercing CO2 to a tibble. Is a CO2.tibble 
# tibble or data frame?
CO2.tibble <- as_tibble(CO2)
class(CO2.tibble)   # so it's both

# c
# Q: Based your findings in part a & b, is a data frame necessarily a tibble? 
# Is a tibble necessarily a data frame?
# A: a tibble is data frame but a data frame is not a tibble

# d 
# View CO2 and CO2.tibble, comment on the difference.
CO2
CO2.tibble
# Different: the tibble starts with a comment saying "A tibble: 84 x 5" and right
# below the column names, it tells the data types. It also only shows the first 10
# rows and has a comment at the bottom saying " … with 74 more rows", unlike the 
# data frame that shows everything and is messy

# e 
# date type of CO2.tibble[["uptake"]] and CO2.tibble["uptake"]
class(CO2.tibble[["uptake"]])     # numeric vector
class(CO2.tibble["uptake"])       # tibble
# we want to use the first one if we want to plot it

# 2
# Create the following data frame
subject <- c("English", "Maths", "Chemistry", "Physics")
percentage <- c(80, 100, 85, 95)
my.df <- data.frame(subject, percentage)

# a
# Create my.tibble1 with the same data as my.df using tibble()
# sorry about my naming scheme...
my.tibble1 <- tibble(subject = subject, percentage = percentage)

# b
# Create my.tibble2 with the same data as my.df using tribble()
my.tibble2 <- tribble(
  ~`subject`, ~`percentage`,
  #-----------|---------
  "English",   80,
  "Maths",     100,
  "Chemistry", 85,
  "Physics",   95
)

# c
# Find the data type of the columns of my.df, my.tibble1 and my.tibble2
class(my.df$subject)          # factor
class(my.df$percentage)       # numeric vector
class(my.tibble1$subject)     # character vector
class(my.tibble1$percentage)  # numeric vector
class(my.tibble2$subject)     # character vector
class(my.tibble2$percentage)  # numeric vector

# d
# Use my.tibble1 to create the following output
my.tibble1 <- add_column(my.tibble1, .before = "subject", 
                         quarter = c("W20", "W20", "S20", "S20"))
my.tibble1 <- add_column(my.tibble1, Final = c("Y", "Y", "N", "N"))

