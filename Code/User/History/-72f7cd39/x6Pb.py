#!/bin/python3  
import socket,sys

HOST = "172.25.0.2"
PORT = 65432
STANDARD = 'utf-8'


try:
    client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
except socket.error as e:
    print(f"Error creating socket:{e}, Exiting ...")
    sys.exit(1)

try:
    client.connect((HOST,PORT))
except socket.gaierror as e:
    print(f"Address-related error connecting to server:{e}, Exiting ...")
    sys.exit(1)
except socket.error as e:
    print(f"Error connecting:{e}, Exiting ...")
    sys.exit(1)

def main():
    while True:
        break

    print("Disconnected")
    client.close() 

main()
