# Study Notes: Linked List (Introduction and Insertion)

## What is a Linked List?
A **linked list** is a linear data structure consisting of a group of nodes arranged in sequence. Each node holds its data value and the address of the next node, forming a chain-like structure.

- The first node is called the **head**.
- The last node's pointer points to `NULL`, indicating the end of the list.

### Types of Linked Lists
1. **Singly Linked List**
2. **Doubly Linked List**
3. **Circular Linked List**

---

## Syntax to Declare a Linked List Node in C
A linked list node contains two data items: the data and a pointer to the next node (self-referencing pointer).

```c
struct Node {
    int data;
    struct Node* next;
};
```

---

## Creating a Simple Linked List of 3 Nodes
```c
#include <stdio.h>
#include <stdlib.h>

struct Node {
    int data;
    struct Node* next;
};

int main() {
    struct Node* head = NULL;
    struct Node* second = NULL;
    struct Node* third = NULL;

    // Allocate memory in heap
    head = (struct Node*)malloc(sizeof(struct Node));
    second = (struct Node*)malloc(sizeof(struct Node));
    third = (struct Node*)malloc(sizeof(struct Node));

    // Assign data and link nodes
    head->data = 1;
    head->next = second;

    second->data = 2;
    second->next = third;

    third->data = 3;
    third->next = NULL;

    return 0;
}
```

- This creates a singly linked list: `1 -> 2 -> 3 -> NULL`
- Singly linked lists can only be traversed in one direction.

---

## Traversing the Linked List
```c
#include <stdio.h>
#include <stdlib.h>

struct Node {
    int data;
    struct Node* next;
};

void PrintLinkedList(struct Node* n) {
    while (n != NULL) {
        printf("%d ", n->data);
        n = n->next;
    }
}

int main() {
    struct Node* head = NULL;
    struct Node* second = NULL;
    struct Node* third = NULL;

    head = (struct Node*)malloc(sizeof(struct Node));
    second = (struct Node*)malloc(sizeof(struct Node));
    third = (struct Node*)malloc(sizeof(struct Node));

    head->data = 1;
    head->next = second;
    second->data = 2;
    second->next = third;
    third->data = 3;
    third->next = NULL;

    PrintLinkedList(head); // Output: 1 2 3
    return 0;
}
```

---

## Insertion in Linked List
A node can be added in three ways:
1. **Insertion at the front/start**
2. **Insertion after a specified node**
3. **Insertion at the end**

### 1. Insertion at the Front
Add a node at the start by updating the head to the new node and pointing the new node's next to the previous head.

```c
void InsertAtFront(struct Node** head_ref, int new_data) {
    struct Node* new_node = (struct Node*)malloc(sizeof(struct Node));
    new_node->data = new_data;
    new_node->next = *head_ref;
    *head_ref = new_node;
}
```

### 2. Insertion After a Given Node
Insert a node after a specified node.

```c
void InsertAfterNode(struct Node* prev_node, int new_data) {
    if (prev_node == NULL) {
        printf("Insertion cannot be done with null previous node.\n");
        return;
    }
    struct Node* new_node = (struct Node*)malloc(sizeof(struct Node));
    new_node->data = new_data;
    new_node->next = prev_node->next;
    prev_node->next = new_node;
}
```

### 3. Insertion at the End
Insert a node at the end of the linked list.

```c
void InsertAtEnd(struct Node** head_ref, int new_data) {
    struct Node* new_node = (struct Node*)malloc(sizeof(struct Node));
    struct Node* last = *head_ref;
    new_node->data = new_data;
    new_node->next = NULL;
    if (*head_ref == NULL) {
        *head_ref = new_node;
        return;
    }
    while (last->next != NULL)
        last = last->next;
    last->next = new_node;
}
```

---
