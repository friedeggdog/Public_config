#!/usr/bin/python

from tkinter import *
import tkinter as tk
from PIL import Image,ImageTk
import subprocess

root = Tk()

root.title("")
root.geometry('350x200')
root.configure(bg='#313338')

image = Image.open("/home/jagannathanm/programs/minDiscord/prof3.jpg")
image = image.resize((40,40))
img  = ImageTk.PhotoImage(image)

root.columnconfigure(0, weight=1)
root.columnconfigure(1, weight=5)

root.rowconfigure(0, weight=5)
root.rowconfigure(1, weight=1)

txtbox = Entry(root,width=40,font=('sans-serif',12),bg='#383a40',fg='#d3d6d9',highlightbackground='#383a40',highlightcolor='#383a40',relief='flat')
txtbox.place(x=50,y=160,width=290,height=30)
txtbox.focus()
#txtbox.grid(column = 1, row=1, sticky=tk.SE, pady=10, padx=10)

lbl = Label(root, image = img, borderwidth=0)
lbl.grid(column = 0, row = 1, sticky=tk.SW, pady=5, padx=5)

def enterevent(event):
    global message
    message=txtbox.get()
    root.destroy()

root.bind('<Return>',enterevent)
root.mainloop()

print(message)
#subprocess.Popen(['/home/jagannathanm/programs/minDiscord/discord.sh %s' %(message)], shell = True)