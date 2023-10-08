#!/usr/python 
import socket, paramiko
def main():
    server_sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server_sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    server_sock.bind(('',2222))
    server_sock.listen()


    client,addr = server_sock.accept()
    print(f"{addr[0]}':'{addr[1]}")
    transport = paramiko.Transport(client)
    #serverkey = paramiko.RSAKey.generate(2048)
    serverkey =  paramiko.RSAKey.from_private_key_file("key")
    transport.add_server_key(serverkey)
    ssh = paramiko.ServerInterface()
    transport.start_server(server=ssh)

if __name__ == "__main__":
    main()
