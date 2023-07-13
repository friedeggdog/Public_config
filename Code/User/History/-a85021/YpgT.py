#!/usr/bin/python

from tkinter import *
import tkinter as tk
from PIL import Image,ImageTk

root = Tk()

root.title("")
root.geometry('350x200')

image = Image.open("/home/jagannathanm/Pictures/prof2.png")
image = image.resize((40,40))
img  = ImageTk.PhotoImage(image)

root.columnconfigure(0, weight=1)
root.columnconfigure(1, weight=5)

root.rowconfigure(0, weight=5)
root.rowconfigure(1, weight=1)

txtbox = Entry(root,width=40,font=('sans-serif',12))
txtbox.place(x=50,y=160,width=290,height=30)
#txtbox.grid(column = 1, row=1, sticky=tk.SE, pady=10, padx=10)

lbl = Label(root, image = img)
lbl.grid(column = 0, row = 1, sticky=tk.SW, pady=5, padx=5)


message=''
def enterevent(event):
    message=txtbox.get()
    root.destroy()

root.bind('<Return>',enterevent)
root.mainloop()

print("sdkf")