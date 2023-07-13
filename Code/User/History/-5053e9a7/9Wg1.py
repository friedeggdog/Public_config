#!/bin/python3  
import socket
import os

HOST = "10.2.48.251"
PORT = 65432
STANDARD = 'utf-8'

client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client.connect((HOST,PORT))

def main():
    msg = client.recv(1024).decode(STANDARD)
    print(msg)


    exp = input("Enter command then file path")
    exp = exp.split(' ')
    cmd = exp[0]
    file_path = exp[1]
    while True:
        if cmd == 'Logout':
            client.send(cmd.format(STANDARD))
            break
    client.close()


main()