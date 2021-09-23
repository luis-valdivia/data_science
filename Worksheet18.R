# Luis Valdivia
################################################################################

#necessary libraries for databases
library(DBI)
library(RSQLite)

# create the database connection
my.db.conn <- dbConnect(RSQLite::SQLite(), "Tiny_Clothes")


# 1
# write the table into the database
dbWriteTable(conn = my.db.conn, "Iris", iris)

# query it with dbSendQuery
my.relation <- dbSendQuery(my.db.conn, "SELECT * FROM Iris")

# store the three sets of 10 somewhere
first10 <- dbFetch(my.relation, n = 10)
second10 <- dbFetch(my.relation, n = 10)
third10 <- dbFetch(my.relation, n = 10)

# clear the results
dbClearResult(my.relation)


# 2
# create the two views
dbExecute(my.db.conn, "CREATE VIEW View1 
          AS SELECT * FROM Iris 
          WHERE [Petal.Length] > 1.2")

dbExecute(my.db.conn, "CREATE TEMP VIEW View2 
          AS SELECT * FROM Iris 
          WHERE [Petal.Length] <= 1.2")

# disconnect and reconnect
dbDisconnect(my.db.conn)
my.db.conn <- dbConnect(RSQLite::SQLite(), "Tiny_Clothes")

# check which one is still there
dbListTables(conn = my.db.conn)

# View1 where the petals are > 1.2 survived, so we drop it
dbExecute(my.db.conn, "DROP VIEW View1")


# 3
dbExecute(my.db.conn, "UPDATE DEPARTMENT
          SET MANAGER = (SELECT EMP_NO FROM EMPLOYEE WHERE NAME = 'GREEN')
          WHERE NAME = 'Sales'")


# 4
dbDisconnect(my.db.conn)


