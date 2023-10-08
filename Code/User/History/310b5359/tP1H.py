#!/usr/python 
import socket
def main():
    server_sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server_sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR)

    client,addr = server_sock.accept()
    print(client[0]:client[1])