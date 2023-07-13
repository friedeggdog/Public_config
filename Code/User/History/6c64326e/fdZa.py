#!/bin/python3

import mysql.connector
import sys

line=sys.argv[1]
linelist=line.split()

mydb = mysql.connector.connect(host="172.19.0.1",user="root",password="1234") ##Name RollNumber Hostel Room Mess MessPref Month Year Dept

##for i in /home/*/*/*/userDetails.txt; do ./iniDatabase.py "$i"; done

mycursor = mydb.cursor()
mycursor.execute("USE students")
sql = "INSERT INTO Details VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)"
val = (linelist[0],linelist[1],linelist[2],linelist[3],linelist[4],linelist[5],linelist[6],linelist[7],linelist[8])
mycursor.execute(sql, val)
mydb.commit()