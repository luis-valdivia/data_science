# Luis Valdivia
################################################################################
# 1
# a
# I uploaded it to my Week 5 folder
setwd("Week 5")
# Use read.csv() to import this file to R
# Saving it as a data frame because we need it later
Batman.Movies <- data.frame(read.csv(file = "Batman_Movies.txt"))

# b
# first we get the average Rotten Tomatoes score and create a logical vector
# of which movies are qualified
good.indeces <- Batman.Movies[ ,4] > mean(Batman.Movies[,4])
# then we make a data frame, GoodBatmanMovies, from such vector
GoodBatmanMovies <- data.frame(Batman.Movies[good.indeces, ])

# c
# export GoodBatmanMovies
write.csv(GoodBatmanMovies, file = "GoodBatmanMovies.csv")


# 2
# P(A) = 0.35, P(B) = 0.7, P(A and B) = 0.25
# a
# 1 = P(B) + P(B^c)
# since P(B) = 0.7, P(B^c) = 0.3

# b
# P(A or B) = P(A) + P(B) - P(A and B)
# = 0.35 + 0.7 - 0.25 
# = 0.8


# 3
# a
# There are four aces and 52 cards in total so the probability that it's an ace is 
# 4/52 = 1/13
# There is only one 4 of spades, so the probability that it is such card is
# 1/52

# b
# Let A be the event that the second card is a club,
# then P(A) = 13/52
# Let B be the event that the first card is red,
# then P(B) = 26/52
# We know that P(A | B) = P(A and B) / P(B) 
# since the first card is replaced, the events are independent,
# so P(A and B) = P(A)P(B) and P(A | B) = P(A) 
# = 13/52

# c
# Here the first card is not replaced, so the events are no longer independent
# since we have one less card in our deck when we draw the second time, so
# P(A and B) = 26/52 * 13/51
# so P(A | B) = P(A and B) / P(B) = (26/52 * 13/51)/ (26/52) = 13/51

# d
# Let C be the event a card is a face card
# Let D be the event a card is black
# 3 spades are black and face cards
# 3 clubs are black and face cards
# so P(C and D) = 6/52
# since P(C and D) is not 0, the events are not mutually exclusive


