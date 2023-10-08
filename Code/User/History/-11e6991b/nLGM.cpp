
#include <climits>
#include <iostream>
#define MAX 50
using namespace std;

int queue[MAX];
int Top = -1, rear = -1;

void Insert(int num) {
    if ((rear == MAX - 1 && Top == 0) || (Top == rear + 1)) {
        cout << "Queue is Full !!\n";
        return;
    }

    if (rear == MAX - 1)
        rear = -1;
    rear++;
    queue[rear] = num;
    if (Top == -1)
        Top = 0;
}

void Pop() {
    if (Top == -1) {
        cout << "Queue is Empty !!\n";
        return;
    }
    int number;
    number = queue[Top];
    queue[Top] = INT_MAX;

    if (Top == rear) {
        Top = -1;
        rear = -1;
    } else if (Top == MAX - 1)
        Top = 0;
    else
        Top++;

    cout << "Popped element = " << number << "\n";
}

void queue_Top() {
    if (Top == -1) {
        cout << "Queue is Empty !!\n";
        return;
    }
    cout << "Top of the queue = " << queue[Top] << "\n";
}

void queue_Empty() {
    if (rear == -1) {
        cout << "Queue is Empty !!\n";
        return;
    }
    cout << "Queue is not Empty" << "\n";
}

int main() {
    int optn, number;

    for (int i = 0; i < MAX; i++)
        queue[i] = INT_MAX;

    while (1) {
        cout << "1: Insert\n2: Pop\n3: Top\n4: isEmpty\n";
        cout << "Enter your choice : ";
        cin >> optn;

        switch (optn) {
        case (1):
            cout << "Enter the number : ";
            cin >> number;
            Insert(number);
            break;
        case (2):
            Pop();
            break;
        case (3):
            queue_Top();
            break;
        case (4):
            queue_Empty();
            break;
        case (0):
            exit(0);
        }
    }
    return 0;
}
