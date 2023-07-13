#!/usr/bin/python

from tkinter import *
import tkinter as tk
from PIL import Image,ImageTk
import json

root = Tk()

root.title("")
root.geometry('350x200')
root.configure(bg='#313338')

image = Image.open("/home/jagannathanm/programs/minDiscord/prof3.jpg")
image = image.resize((40,40))
img  = ImageTk.PhotoImage(image)

root.columnconfigure(0, weight=1)
root.columnconfigure(1, weight=20)

root.rowconfigure(0, weight=20)
root.rowconfigure(1, weight=1)

txtbox = Entry(root,font=('sans-serif',12),bg='#383a40',fg='#d3d6d9',highlightbackground='#383a40',highlightcolor='#383a40',relief='flat')
#txtbox.place(x=50,y=160,width=290,height=30)
txtbox.grid(column = 1, row=1, sticky=tk.NSEW, pady=10, padx=10)
txtbox.focus()


lbl = Label(root, image = img, borderwidth=0,bg='#313338')
lbl.grid(column = 0, row = 1, sticky=tk.NSEW, pady=5, padx=5)

# fetching old messages
f = open('/home/jagannathanm/programs/minDiscord/output.json')
data = json.load(f)
print(data)
f.close()

# save and exit on enter
def enterevent(event):
    global message
    message=txtbox.get()
    root.destroy()

root.bind('<Return>',enterevent)
root.mainloop()

print(message)