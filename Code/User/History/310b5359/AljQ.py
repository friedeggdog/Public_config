#!/usr/python 
import socket, paramiko, threading

class BasicSshHoneypot(paramiko.ServerInterface):
    #basic implementation more can be added
    client_ip = None

    def __init__(self, client_ip):
        self.client_ip = client_ip
        print(f"ip addr:{client_ip}")

    def check_auth_password(self, username: str, password: str) -> int:
        print(f"username used:{username}\npassword used:{password}")
        return paramiko.AUTH_FAILED


def handle_connection(client,ipaddr):
    transport = paramiko.Transport(client)
    #serverkey = paramiko.RSAKey.generate(2048) ##uncomment this line and comment the next if file is not preferred
    serverkey =  paramiko.RSAKey.from_private_key_file("/home/jagannathanm/Documents/on-spider/honey/key")
    transport.add_server_key(serverkey)
    ssh = BasicSshHoneypot(ipaddr)
    transport.start_server(server=ssh)

def main():
    server_sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server_sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    server_sock.bind(('',2222))
    server_sock.listen()

    while True:
        client,addr = server_sock.accept()
        print(f"{addr[0]}':'{addr[1]}")
        t = threading.Thread(target=handle_connection, args=(client,addr[0]))
        t.start()

if __name__ == "__main__":
    main()


