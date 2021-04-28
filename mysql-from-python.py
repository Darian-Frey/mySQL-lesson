import os
import pymysql

# get username from dev workspace

username = os.getenv("Gitpod_user")

# connect to the database

connection = pymysql.connect(host="localhost",
                             user=username,
                             password="",
                             db="Chinook")
try:
    # run a query
    with connection.cursor() as cursor:
        sql = "SELECT * FROM Artist;"
        cursor.execute(sql)
        result = cursor.fetchall()
        print(result)
finally:
    # close the connection, regardless of whether the above was successful
    connection.close()
