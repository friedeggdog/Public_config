#!/bin/python3

import mysql.connector
mydb = mysql.connector.connect(host="172.19.0.1",user="root",password="1234") ##Name RollNumber Hostel Room Mess MessPref Month Year Dept
mycursor = mydb.cursor()
mycursor.execute("CREATE DATABASE students")
mycursor.execute("USE students")
mycursor.execute("CREATE TABLE Details (Name VARCHAR(255), Roll VARCHAR(12) PRIMARY KEY, Hostel VARCHAR(10), Room VARCHAR(4), Mess VARCHAR(1), MessPref VARCHAR(3), Month VARCHAR(12), Year VARCHAR(4), Dept VARCHAR(5))")
