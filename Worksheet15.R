# Luis Valdivia
################################################################################

#necessary libraries for databases
library(DBI)
library(RSQLite)
library(sqldf)

# create the database connection
my.db.conn <- dbConnect(RSQLite::SQLite(), "Tiny_Clothes")

# 1
# a
# schema for CUSTOMER is CUSTOMER(CUST_NO, NAME, ADDRESS)
# schema for PRODUCT is PRODUCT(PROD_NO, NAME, COLOR)
# schema for SALES_ORDER_LINE is SALES_ORDER_LINE(ORDER_NO, PROD_NO, QUANTITY)


# b
# Identify the primary key for each relation and any foreign keys for each relation.
# primary key for CUSTOMER is CUST_NO
# no foreign key

# primary key for PRODUCT is PROD_NO
# no foreign key

# primary key for SALES_ORDER_LINE is {ORDER_NO, PROD_NO}
# foreign key is PROD_NO


# 2
# age of the oldest employee at ‘Tiny Clothes'
sqldf("SELECT MAX(AGE) FROM EMPLOYEE", dbname = "Tiny_Clothes")


# 3
# Are there any employees under the age of 50 whose name contains the letter ‘R’
sqldf("SELECT * FROM EMPLOYEE WHERE (NAME LIKE '%R%') AND (AGE < 50)", 
      dbname = "Tiny_Clothes")
# no


# 4
# Retrieve the employment number of the sales department manager.
sqldf("SELECT * FROM DEPARTMENT", dbname = "Tiny_Clothes")
# no manager, hence no employer number


# 5
# How many departments are there at ‘Tiny Clothes’ ?
sqldf("SELECT COUNT() FROM DEPARTMENT", dbname = "Tiny_Clothes")


# 6
# What is Carol’s customer number?
sqldf("SELECT CUST_NO FROM CUSTOMER WHERE NAME = 'CAROL'", dbname = "Tiny_Clothes")


# 7
# Who works in Department D2?
sqldf("SELECT * FROM EMPLOYEE WHERE DEPT_NO = 'D2'", dbname = "Tiny_Clothes")


# 8
# Should Tiny Clothes sell PINK SOCKS? How would you answer if you were asked 
# this question by a non-technical manager?
# so let's see how many socks we have of each color
sqldf("SELECT * FROM PRODUCT NATURAL JOIN STOCK_TOTAL WHERE NAME = 'SOCKS'", 
      dbname = "Tiny_Clothes")
# so we have 1500 green socks and 200 white socks
# how many orders for each?
sqldf("SELECT * FROM PRODUCT NATURAL JOIN SALES_ORDER_LINE WHERE NAME = 'SOCKS'", 
      dbname = "Tiny_Clothes")
# we have 1 order for 20 white socks and none for green
# we have so many green socks and we haven't sold any yet, 
# let's stick with the standard colors, which probably cost less to make too

# also, I don't like pink socks


