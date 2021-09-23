# Luis Valdivia
################################################################################

#necessary libraries for databases
library(DBI)
library(RSQLite)
library(sqldf)

# create the database connection
my.db.conn <- dbConnect(RSQLite::SQLite(), "Tiny_Clothes")


# 1
# using dbExecute
dbExecute(my.db.conn, "CREATE TABLE IMPORTANT_CONTACT_1 AS 
      SELECT NAME, EXTENSION FROM EMPLOYEE NATURAL JOIN EMPLOYEE_PHONE 
      WHERE EMP_NO IN (SELECT MANAGER FROM DEPARTMENT WHERE NAME = 'Accounts')")
# check that the relation was created correctly
dbListTables(my.db.conn)
# along with its contents
dbReadTable(my.db.conn, "IMPORTANT_CONTACT_1")


# 2 
# using dbSendQuery
my_relation <- dbSendQuery(my.db.conn, "CREATE TABLE IMPORTANT_CONTACT_2 AS 
      SELECT * FROM IMPORTANT_CONTACT_1")
dbClearResult(my_relation)
# check that the relation was created correctly
dbListTables(my.db.conn)
# along with its contents
dbReadTable(my.db.conn, "IMPORTANT_CONTACT_2")


# 3
# Remove IMPORTANT_CONTACT_1 and IMPORTANT_CONTACT_2 from the database
dbRemoveTable(my.db.conn, "IMPORTANT_CONTACT_1")
dbRemoveTable(my.db.conn, "IMPORTANT_CONTACT_2")


# 4
# Choosing a suitable customer number, add a new customer Charles, whose address 
# is ATLANTIC to the database with either dbExecute or dbSendQuery. 
dbExecute(my.db.conn, "INSERT INTO CUSTOMER(CUST_NO, NAME, ADDRESS)
      VALUES
      ('C7', 'Charles', 'Atlantic')")


# 5
# Names and phone extension of all employees who share an office
sqldf("SELECT NAME, EXTENSION FROM EMPLOYEE_PHONE NATURAL JOIN EMPLOYEE
      WHERE OFFICE IN (SELECT OFFICE FROM EMPLOYEE_PHONE
      GROUP BY OFFICE
      HAVING COUNT(*) > 1)", dbname = "Tiny_Clothes")


# 6
# create relation as described in spec
dbExecute(my.db.conn, "CREATE TABLE SHOES(
      SHOE_ID INTEGER PRIMARY KEY,
      MODEL TEXT,
      COLOR TEXT
)")
# a
# check that the relation was created correctly
dbListTables(my.db.conn)

# b
# add requested tuples
dbExecute(my.db.conn, "INSERT INTO SHOES(SHOE_ID, MODEL, COLOR)
      VALUES
      (001, 'Running', 'PINK')")
dbExecute(my.db.conn, "INSERT INTO SHOES(SHOE_ID, MODEL, COLOR)
      VALUES
      (002, 'XCountry', 'GREEN')")

# c
# try adding bad tuple
dbExecute(my.db.conn, "INSERT INTO SHOES(SHOE_ID, MODEL, COLOR)
      VALUES
      (001, 'Climbing', 'BLUE')")
# Error: UNIQUE constraint failed: SHOES.SHOE_ID
# this happens because we set SHOE_ID to be the primary key, 
# so it must have unique values