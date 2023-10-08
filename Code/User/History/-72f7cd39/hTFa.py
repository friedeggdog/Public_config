#!/bin/python3  
import socket,sys,pyautogui,pickle,io
import PIL.Image as Image
HOST = "172.25.0.2"
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
        image =  pyautogui.screenshot()
        buffer = io.BytesIO()
        image.save(buffer, 'JPEG')
        imageData = buffer.getvalue()

        
        break

    print("Disconnected")
    client.close() 

main()
