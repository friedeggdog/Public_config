#!/usr/python 
import socket, paramiko, threading

class SSHServer(paramiko.ServerInterface):

    def check_auth_password(self, username: str, password: str) -> int:
        print(f"{username}:{password}")
        return paramiko.AUTH_FAILED


def handle_connection(client):
    transport = paramiko.Transport(client)
    #serverkey = paramiko.RSAKey.generate(2048)
    serverkey =  paramiko.RSAKey.from_private_key_file("/home/jagannathanm/Documents/on-spider/honey/key")
    transport.add_server_key(serverkey)
    ssh = SSHServer
    transport.start_server(server=ssh)

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
