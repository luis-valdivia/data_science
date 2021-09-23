# Luis Valdivia
################################################################################

#necessary libraries for databases
library(DBI)
library(RSQLite)
library(sqldf)

# create the database
my.db.conn <- dbConnect(RSQLite::SQLite(), "Tiny_Clothes")

# read in the relations
customer.df <- read.csv(file = "/home/jovyan/PSTAT10_Tiny_Clothes/CUSTOMER.txt")
dbWriteTable(conn = my.db.conn, "CUSTOMER", customer.df)

department.df <- read.csv(file = "/home/jovyan/PSTAT10_Tiny_Clothes/DEPARTMENT.txt")
dbWriteTable(conn = my.db.conn, "DEPARTMENT", department.df)

employee.df <- read.csv(file = "/home/jovyan/PSTAT10_Tiny_Clothes/EMPLOYEE.txt")
dbWriteTable(conn = my.db.conn, "EMPLOYEE", employee.df)

employee_phone.df <- read.csv(file = "/home/jovyan/PSTAT10_Tiny_Clothes/EMPLOYEE_PHONE.txt")
dbWriteTable(conn = my.db.conn, "EMPLOYEE_PHONE", employee_phone.df)

invoices.df <- read.csv(file = "/home/jovyan/PSTAT10_Tiny_Clothes/INVOICES.txt")
dbWriteTable(conn = my.db.conn, "INVOICES", invoices.df)

product.df <- read.csv(file = "/home/jovyan/PSTAT10_Tiny_Clothes/PRODUCT.txt")
dbWriteTable(conn = my.db.conn, "PRODUCT", product.df)

sales_order.df <- read.csv(file = "/home/jovyan/PSTAT10_Tiny_Clothes/SALES_ORDER.txt")
dbWriteTable(conn = my.db.conn, "SALES_ORDER", sales_order.df)

sales_order_line.df <- read.csv(file = "/home/jovyan/PSTAT10_Tiny_Clothes/SALES_ORDER_LINE.txt")
dbWriteTable(conn = my.db.conn, "SALES_ORDER_LINE", sales_order_line.df)

stock_total.df <- read.csv(file = "/home/jovyan/PSTAT10_Tiny_Clothes/STOCK_TOTAL.txt")
dbWriteTable(conn = my.db.conn, "STOCK_TOTAL", stock_total.df)

# check that all 9 relations are there
dbListTables(conn = my.db.conn)

# 1
# all distinct employee names at Tiny Clothes
sqldf("SELECT DISTINCT NAME FROM EMPLOYEE", dbname = "Tiny_Clothes")


# 2
# name of all departments beginning with the letter 'S' and contain the letter ‘r’
sqldf("SELECT NAME FROM DEPARTMENT WHERE (NAME LIKE 'S%') AND (NAME LIKE '%r%')", 
      dbname = "Tiny_Clothes")
# same result if you use ‘R’ instead of ‘r’


# 3
# Does ‘Tiny clothes’ sell white socks?
sqldf("SELECT * FROM PRODUCT WHERE (NAME = 'SOCKS') AND (COLOR = 'WHITE')", 
      dbname = "Tiny_Clothes")
# yes, it's their 4th product


# 4
# How old is the employee named 'BROWN’?
sqldf("SELECT AGE FROM EMPLOYEE WHERE NAME = 'BROWN'", dbname = "Tiny_Clothes")
# 65


# 5
# employee numbers of all employees whose name contains the letter 'R'.
sqldf("SELECT EMP_NO FROM EMPLOYEE WHERE NAME LIKE '%R%'", dbname = "Tiny_Clothes")


# 6
# Name, age and employee numbers of all employees except those whose age is 21
sqldf("SELECT NAME, AGE, EMP_NO FROM EMPLOYEE WHERE AGE != 21", 
      dbname = "Tiny_Clothes")


# 7
# What are the names of the departments in 'Tiny Clothes'?
sqldf("SELECT NAME FROM DEPARTMENT", dbname = "Tiny_Clothes")
# Accounts, Stores, Sales


# 8
# On what date did customer C3 place their order?
sqldf("SELECT DATE FROM SALES_ORDER WHERE CUST_NO = 'C3'", dbname = "Tiny_Clothes")
# 7/9/19


# 9
# Which products are available in white?
sqldf("SELECT * FROM PRODUCT WHERE (COLOR = 'WHITE')", dbname = "Tiny_Clothes")
# socks and shirts

# 10 
# Which office does employee E2 occupy?
sqldf("SELECT OFFICE FROM EMPLOYEE_PHONE WHERE EMP_NO = 'E3'", dbname = "Tiny_Clothes")
# R35


