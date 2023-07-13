#!/bin/python3  
import socket
import os

HOST = "10.2.48.251"
PORT = 65432
STANDARD = 'utf-8'

client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client.connect((HOST,PORT))

def main():
    exp = input("Enter command then file path")
    exp = exp.split('')
    cmd = exp[0]
    file_path = exp[1]
    if os.path.isfile(file_path):
        file = open(file_path, "rb")
        file_name = os.path.basename(file_path)

        client.sendall(file_name.encode(STANDARD))

        content = file.read()
        client.sendall(content)
        client.sendall(b"<!EOF>")

        file.close()
    else:
        print("Invalid Path")
    client.close()


main()