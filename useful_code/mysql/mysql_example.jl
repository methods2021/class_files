using DataFrames

host = "pursamydbcit.services.brown.edu"
user = "YOUR_USERNAME"

conn = open_mysql_connection(; host, user) # you will be prompted to enter your password

DataFrame(mysql_execute(conn, "show databases;"))
mysql_execute(conn, "use mimic_demo;");
DataFrame(mysql_execute(conn, "show tables;"))
df = DataFrame(mysql_execute(conn, "select * from PATIENTS;"))

close_mysql_connection!(conn) # make sure to close the connection when you are done
