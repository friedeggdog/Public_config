#!/bin/python3
import socket,sys,threading,io
from PIL import Image
HOST = socket.gethostbyname(socket.gethostname())
PORT = 65435
ADDR = (HOST, PORT)
STANDARD = 'utf-8'


try:
    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server.bind(ADDR) 
except Exception as e:
    print(f"An error has occurred:{e}, Exiting ...")
    sys.exit(1)

def client_handle(conn, addr):
    try:
        while True:

            imagedata = b''
            dataPack = conn.recv(4096)
            while dataPack[-5:] != b'<END>':
                imagedata = imagedata + dataPack
                dataPack = conn.recv(4096)
            imagedata = imagedata + dataPack


            imagedata =  imagedata[0:-5]
            dataBytesIO = io.BytesIO(imagedata)
            image = Image.open(dataBytesIO)
            image.show()
            image.close()
            conn.send('CONT'.encode(STANDARD))
    except (Exception, KeyboardInterrupt) as e:
        print(f"An error has occurred:{e} at address:{addr}, Disconnecting ...")
        conn.send("EXIT".encode(STANDARD))

    print(f'Closing:{addr}')
    conn.close()

def start():
    server.listen()
    while True:
        conn, addr = server.accept()
        thread = threading.Thread(target=client_handle, args=(conn, addr))
        thread.start()
        print("No of connections:",threading.active_count()-1)


print("Starting Server...")
print(HOST)
start()
