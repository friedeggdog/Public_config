#!/bin/python3
import sys
cases = int(input("Enter no of cases"))
for i in range(cases):
    no_elements = int(input("Enter no of elements"))
    for i in sys.stdin:
        a = [int(elem) for elem in i.split()]


    count = 0
    while True:
        if (sorted(a) == a):
            print(count)
            break
        else:
            for i in range(no_elements):
                if a[i] != 0:
                    a[i] = a[i]-1
            count = count + 1

