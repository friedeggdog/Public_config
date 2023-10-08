#!/usr/python 
import socket, paramiko, threading

def handle_connection(client):




def main():
    server_sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server_sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    server_sock.bind(('',2222))
    server_sock.listen()

    while True:
        client,addr = server_sock.accept()
        print(f"{addr[0]}':'{addr[1]}")
        t = threading.Thread(target=handle_connection, args=(client,))
        t.start()

if __name__ == "__main__":
    main()
