#!/bin/python3

import mysql.connector
print('Hello')
mydb = mysql.connector.connect(host="localhost:3306",user="root",password="1234")

print(mydb)