#!/usr/python 
import socket, paramiko
def main():
    server_sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server_sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR)

    client,addr = server_sock.accept()
    print(client[0]+':'+client[1])
    transport = paramiko.Transport(client)
    serverkey= paramiko.RSAKey.generate(2048)
    transport.add_server_key(serverkey)
    ssh = paramiko.ServerInterface()
    transport.start_server(server=ssh)

if __name__ == "__main__":
    main()
