#!/bin/python3

import mysql.connector
mydb = mysql.connector.connect(host="localhost",user="root",password="1234")

mycursor = mydb.cursor()
mycursor.execute("CREATE DATABASE students")
mycursor.execute("USE students")
mycursor.execute("CREATE TABLE customers (name VARCHAR(255), address VARCHAR(255))")