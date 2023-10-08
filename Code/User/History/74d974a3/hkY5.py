#!/bin/python3
import numpy as n


cases = int(input("Enter no of cases"))
for i in range(cases):
    no_elements = int(input("Enter no of elements"))
    a = [0] * no_elements
    for j in range(no_elements):
        element = int(input("Enter element"))
        a[j] = element


    count = 0
    while True:
        if (sorted(a) == a):
            print("0")
            break
        else:
            for i in range(no_elements):
                if a[i] != 0:
                    a[i] = a[i]-1
                    count = count + 1
