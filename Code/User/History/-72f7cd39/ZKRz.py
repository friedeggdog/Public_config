#!/bin/python3  
import socket,sys,pyautogui,pickle,io,time,numpy
import PIL.Image as Image
HOST = "192.168.43.170"
PORT = 65432
STANDARD = 'utf-8'


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
        #time.sleep(5) ##waits 5 seconds before sending screen to the server can be changed as required
        image =  pyautogui.screenshot()
        imageArray = numpy.asarray(image)
        imageBytes = pickle.dumps(imageArray)
        print(len(imageBytes))
        #print(f'------\n{imageBytes}')
        client.send(imageBytes)
        break
        if client.recv(1024).decode(STANDARD) == 'EXIT':
            break

    print("Disconnected")
    client.close() 

main()