#!/bin/python3

import mysql.connector
mydb = mysql.connector.connect(host="localhost",user="root",password="1234")

##Name RollNumber Hostel Room Mess MessPref Month Year Dept

mycursor = mydb.cursor()
mycursor.execute("CREATE DATABASE students")
mycursor.execute("USE students")
mycursor.execute("CREATE TABLE Details (Name VARCHAR(255), Roll VARCHAR(12), Hostel VARCHAR(10), Room VARCHAR(4), Mess VARCHAR(4), MessPref VARCHAR(8), Month VARCHAR(12), Year VARCHAR(4), Dept VARCHAR(5))")

mycursor.execute("load data infile \"/var/lib/mysql-files/studentDetails.txt\" into table Details FIELDS TERMINATED BY ' ' (Name, Roll, Hostel, Room, Mess, MessPref);")

