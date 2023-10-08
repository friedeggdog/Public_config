#!/bin/python3

cases = int(input("Enter no of cases"))
for i in range(cases):
    no_elements = int(input("Enter no of elements"))
    a = [0] * no_elements
    for j in range(no_elements):
        element = int(input("Enter element"))
        a[j] = element
    print(a)
    print(a.sorted())
    if (a.sorted() == a):
        print("0")
    else:
        print(max(a))
