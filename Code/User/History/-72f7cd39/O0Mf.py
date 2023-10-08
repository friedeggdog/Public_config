#!/bin/python3  
import socket,sys,pyautogui,pickle,io,time
import PIL.Image as Image
HOST = "192.168.1.5"
PORT = 65432
STANDARD = 'utf-8'
HEADER = 16


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
        time.sleep(5) ##waits 5 seconds before sending screen to the server can be changed as required
        #image =  pyautogui.screenshot()
        #buffer = io.BytesIO()
        #image.save(buffer, 'JPEG')
        #imageData = buffer.getvalue()
        imageData = 'meow'.encode(STANDARD)
        msgHead = f"{len(imageData):<{HEADER}}".encode(STANDARD)
        client.send(msgHead+imageData)
        if client.recv(1024).decode(STANDARD) == 'EXIT':
            break

    print("Disconnected")
    client.close() 

main()