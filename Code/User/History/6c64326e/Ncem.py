#!/bin/python3

import mysql.connector
import sys

mydb = mysql.connector.connect(host="172.25.0.2",user="root",password="1234") ##Name RollNumber Hostel Room Mess MessPref Month Year Dept
mycursor = mydb.cursor()
mycursor.execute("USE students")
if sys.argv[1]=='POST':
    line=sys.argv[1]
    linelist=line.split()
    sql = "INSERT INTO Details VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s) ON DUPLICATE KEY UPDATE Mess = %s, MessPref = %s, Month = %s"
    val = (linelist[0],linelist[1],linelist[2],linelist[3],linelist[4],linelist[5],linelist[6],linelist[7],linelist[8],linelist[4],linelist[5],linelist[6])
    mycursor.execute(sql, val)
elif sys.argv[1]=='GET':
    sql = "select * from Details where "+str(sys.argv[2])+"=%s"
    var = (sys.argv[3],)
    mycursor.execute(sql,var)
    a=mycursor.fetchall()
    print(list(a[0]))
else:
    print('nothing')

mydb.commit()

