# Luis Valdivia
################################################################################

#necessary libraries for databases
library(DBI)
library(RSQLite)
library(sqldf)

# create the database connection
my.db.conn <- dbConnect(RSQLite::SQLite(), "Tiny_Clothes")

# 1
sqldf("SELECT * FROM STOCK_TOTAL JOIN INVOICES
      WHERE INVOICES.PROD_NO = STOCK_TOTAL.PROD_NO", dbname = "Tiny_Clothes")


# 2
sqldf("SELECT NAME FROM DEPARTMENT WHERE NAME != 'Stores'", dbname = "Tiny_Clothes")


# 3
sqldf("SELECT E.NAME, D.NAME AS 'DEPARTMENT' FROM EMPLOYEE E JOIN DEPARTMENT D
      WHERE E.DEPT_NO = D.DEPT_NO", dbname = "Tiny_Clothes")


# 4
sqldf("SELECT EMP_NO FROM EMPLOYEE_PHONE WHERE EXTENSION = 123", 
      dbname = "Tiny_Clothes")


# 5
sqldf("SELECT ORDER_NO, SUM(QUANTITY) AS 'Total_Quantity'
      FROM INVOICES
      GROUP BY ORDER_NO
      HAVING SUM(QUANTITY) < 20000", dbname = "Tiny_Clothes")


# 6
sqldf("SELECT PROD_NO, ORDER_NO, QUANTITY FROM SALES_ORDER_LINE
      ORDER BY ORDER_NO DESC", dbname = "Tiny_Clothes")
