library(DBI)
library(RSQLite)
library(sqldf)

# create the database
my.db.conn <- dbConnect(RSQLite::SQLite(), "Tiny_Clothes")
# read in a file from there
dbWriteTable(conn = my.db.conn, "DEPARTMENT", 
             "/home/jovyan/PSTAT10_Tiny_Clothes/DEPARTMENT.txt")
# using sqldf for a sql query
sqldf("SELECT * FROM DEPARTMENT", dbname = "Tiny_Clothes")
# check relations in the database, see all the tables
dbListTables(conn = my.db.conn)


# we can also read in a dataframe
customer.df <- read.csv(file = "/home/jovyan/PSTAT10_Tiny_Clothes/CUSTOMER.txt")
# read in a file from there
dbWriteTable(conn = my.db.conn, "CUSTOMER", customer.df)
# using sqldf for a sql query
sqldf("SELECT * FROM CUSTOMER", dbname = "Tiny_Clothes")
# check relations in the database, see all the tables
dbListTables(conn = my.db.conn)


# another way
read.csv.sql(file = "/home/jovyan/PSTAT10_Tiny_Clothes/EMPLOYEE.txt", 
             sql = "CREATE TABLE EMPLOYEE AS SELECT * FROM file",
             dbname = "Tiny_Clothes")
# look at first 3 lines
sqldf("SELECT * FROM EMPLOYEE LIMIT 3", dbname = "Tiny_Clothes")
# look at everything
sqldf("SELECT * FROM EMPLOYEE", dbname = "Tiny_Clothes")
# check relations in the database, see all the tables
dbListTables(conn = my.db.conn)


# doing queries
query.one <- dbGetQuery(conn = my.db.conn, statement = "SELECT * FROM EMPLOYEE")
# what class is it?
class(query.one) # data.frame


# example with mtcars
# load data
data(mtcars)
# make car names an attribute
mtcars$car_names <- row.names(mtcars)
rownames(mtcars) <- c()
# create the database
mtcars.db.conn <- dbConnect(RSQLite::SQLite(), "mtcarsDB")
# write the relation, overwrite to clean up your mistakes
dbWriteTable(conn = mtcars.db.conn, "MTCARS", mtcars, overwrite = T)
# can use sqldf or dbGetQuery
# see first 5 tuples
sqldf("SELECT * FROM MTCARS LIMIT 5", dbname = "mtcarsDB")
# see all weights with mpg > 30
sqldf("SELECT wt FROM MTCARS WHERE mpg > 30", dbname = "mtcarsDB")

# number of cylinders in cars
dbGetQuery(mtcars.db.conn, "SELECT cyl FROM MTCARS")
# number of distinct cylinders in cars
dbGetQuery(mtcars.db.conn, "SELECT DISTINCT cyl FROM MTCARS")
# gears and cylinder pairs
dbGetQuery(mtcars.db.conn, "SELECT cyl, gear FROM MTCARS")
# unique gears and cylinder pairs
dbGetQuery(mtcars.db.conn, "SELECT DISTINCT cyl, gear FROM MTCARS")


sqldf("SELECT * FROM INVOICES", dbname = "Tiny_Clothes")

# How many items in each order
sqldf("SELECT ORDER_NO, SUM(QUANTITY) FROM INVOICES
      GROUP BY ORDER_NO
      ORDER BY SUM(QUANTITY) DESC", 
      dbname = "Tiny_Clothes")

# or
sqldf("SELECT ORDER_NO, SUM(QUANTITY) FROM INVOICES
      GROUP BY ORDER_NO", 
      dbname = "Tiny_Clothes")

# example of HAVING
sqldf("SELECT ORDER_NO, SUM(QUANTITY) FROM INVOICES
      GROUP BY ORDER_NO
      HAVING SUM(QUANTITY) > 20000", 
      dbname = "Tiny_Clothes")

# example of inner join
sqldf("SELECT 
      EMPLOYEE.EMP_NO AS 'EMPLOYEE NUMBER',
      EMPLOYEE.NAME, 
      DEPARTMENT.NAME AS 'DEPARTMENT NAME'
      FROM DEPARTMENT INNER JOIN EMPLOYEE
      ON EMPLOYEE.EMP_NO = DEPARTMENT.MANAGER", 
      dbname = "Tiny_Clothes")

# example of selecting from many relations
sqldf("SELECT C.CUST_NO, C.NAME, P.NAME AS 'PRODUCT NAME', P.COLOR AS 'PRODUCT COLOR'
      FROM CUSTOMER C, SALES_ORDER_LINE O, SALES_ORDER S, PRODUCT P
      WHERE C.CUST_NO = 'C1'
      AND C.CUST_NO = S.CUST_NO
      AND S.ORDER_NO = O.ORDER_NO
      AND O.PROD_NO = P.PROD_NO", 
      dbname = "Tiny_Clothes")

dbExecute(my.db.conn, 
          "CREATE TABLE SOFT_TOYS(
          TOY_ID INTEGER PRIMARY KEY,
          NAME TEXT,
          COLOR TEXT,
          PRICE REAL
          )")

dbWriteTable(my.db.conn, "SOFT_TOYS", 
             "/home/jovyan/Week 9/SOFT_TOYS_DATA.txt", append = T)

dbReadTable(my.db.conn, "SOFT_TOYS")


dbGetQuery(my.db.conn, "SELECT * FROM EMPLOYEE WHERE EMP_NO IN 
           (SELECT EMP_NO FROM EMPLOYEE_PHONE WHERE EXTENSION = 123)")

dbGetQuery(my.db.conn, "SELECT * FROM EMPLOYEE WHERE AGE >
           (SELECT MAX(AGE) FROM EMPLOYEE WHERE DEPT_NO = 'D1')")
