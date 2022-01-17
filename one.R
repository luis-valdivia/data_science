# install libraries for databases
install.packages("DBI", dependencies = F) # just press enter
install.packages("RSQLite", dependencies = F)
# necessary libraries for databases
library(DBI)
install.packages("vctrs")
library(RSQLite)
install.packages("sqldf")
library(gsubfn)
library(proto)
library(sqldf)

# make connection to the 
my.db.conn <- dbConnect(RSQLite::SQLite(), "The_World")
countries.df <- read.csv(file = "/Users/luisvaldivia/Desktop/result/Country.csv")
dbWriteTable(conn = my.db.conn, "Countries", countries.df, overwrite = T)

dbListTables(my.db.conn)

# you can do stupid stuff like this lol
sqldf("SELECT 'hello, world' AS 'bb'", dbname = "The_World")

# more useful, using LIMIT and OFFSET to read a bit at a time
sqldf("SELECT Name, Continent, Region FROM Countries 
      WHERE Continent = 'Europe'
      ORDER BY Name DESC
      LIMIT 5 OFFSET 0", dbname = "The_World")


sqldf("SELECT COUNT(*) FROM Countries 
      WHERE Population > 10000000", dbname = "The_World")

dbExecute(my.db.conn, "CREATE TABLE boolie(
          a INTEGER,
          b INTEGER
)")

dbExecute(my.db.conn, "INSERT INTO boolie(a, b)
          VALUES
          (1, 1);")

dbExecute(my.db.conn, "ALTER TABLE booltest
          ADD COLUMN wyland TEXT;")

rs <- dbSendQuery(my.db.conn, "SELECT 
          CASE a WHEN 1 THEN 'true' ELSE 'false' END AS boolA,
          CASE b WHEN 1 THEN 'true' ELSE 'false' END AS boolB
          FROM boolie")

dbExecute(my.db.conn, "SELECT * FROM booltest")
rs <- dbSendQuery(my.db.conn, "SELECT * FROM booltest")
dbFetch(rs)
dbClearResult(rs)


rs <- dbSendQuery(my.db.conn, "SELECT * FROM boolie")
dbColumnInfo(rs)
dbFetch(rs)
dbClearResult(rs)


sqldf("SELECT COUNT(DISTINCT HeadOfState) FROM Countries", dbname = "The_World")

