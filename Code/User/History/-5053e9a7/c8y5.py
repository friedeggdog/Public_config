#!/bin/python3  
import socket
import os

HOST = "10.2.48.251"
PORT = 65432
STANDARD = 'utf-8'

client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client.connect((HOST,PORT))

def main():
    while True:
        msg = client.recv(1024).decode(STANDARD)
        print(msg)

        exp = input("Enter command then file path ")
        exp = exp.split(' ')
        cmd = exp[0]

        if cmd == 'Logout':
            client.send(F"{cmd}<!>".encode(STANDARD))
            break
        elif cmd == 'Upload':
            file_path = exp[1]
            file_name = os.path.basename(file_path)

            with open(file_path, "r") as file:
                text = file.read()

            client.send(f"{cmd}|{file_name}|{text}<!>".encode(STANDARD))
        elif cmd == "Delete":
            file_name = exp[1]
            client.send(f"{cmd}|{file_name}<!>".encode(STANDARD))
        elif cmd == "Search":
            regex = exp[1]
            client.send(f"{cmd}|{regex}<!>".encode(STANDARD))

    print("Disconnected")
    client.close()


main()