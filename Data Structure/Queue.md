# Study Notes: Queue

## What is a Queue?
A **queue** is a special kind of data structure where elements are inserted from one end (the **rear**) and deleted from the other end (the **front**). Queue follows the **FIFO (First In First Out)** principle.

A real-life example is a line at a ticket counter: the first person to join the line is the first to be served.

---

## Applications of Queue
1. **Operating System Features:**
   - Process scheduling (e.g., round robin algorithm)
   - Spooling (maintaining a queue of jobs to be printed)
2. **Client-Server Systems:**
   - Queue of client processes waiting for service from a server process.
3. **Data Structure Algorithms:**
   - Used in BFS (Breadth-First Search) for trees and graphs.

---

## Array Representation of Queue
```c
#define MAX 100

typedef struct queue {
    int data[MAX]; // MAX can be any integer constant
    int front, rear;
} queue;
```

### Basic Operations on Queue
1. **Initialize:** Set both `front` and `rear` to -1.
2. **Enqueue:** Insert an element at the rear end.
3. **Dequeue:** Delete and return the front element.
4. **Empty:** Returns true (1) if the queue is empty, false (0) otherwise.
5. **Full:** Returns true (1) if the queue is full, false (0) otherwise.
6. **Print:** Print all queue elements.

---

## Example C Functions for Queue Operations
```c
void initialize(queue *Q) {
    Q->rear = -1;
    Q->front = -1;
}

int empty(queue *Q) {
    return (Q->front == -1); // More reliable check for an empty queue
}

int full(queue *Q) {
    return (Q->rear == MAX - 1); // Correctly checks against array bounds
}

void enqueue(queue *Q, int x) {
    if (full(Q)) {
        printf("Queue Overflow!\n"); // Safety check is mandatory
        return;
    }
    
    if (Q->front == -1) { 
        Q->front = 0; // Set front to 0 only on the first insertion
    }
    
    Q->rear++; // Increment first, then store
    Q->data[Q->rear] = x;
}
```

---

## Circular Queue
A **circular queue** avoids the wastage of space in a regular queue implemented using arrays. After several enqueue and dequeue operations, unused spaces at the beginning of the array can be reused.

### How Circular Queue Works
- Uses **circular increment**: When incrementing an index reaches the end, it wraps around to the beginning using modulo division.
  - Example: If `REAR + 1 == SIZE` (overflow), then `REAR = (REAR + 1) % SIZE = 0` (start of queue).

### Operations
- Two pointers, `FRONT` and `REAR`, keep track of the first and last elements.
- On initialization, set both to -1.
- On enqueue, circularly increase `REAR` and insert the new element.
- On dequeue, return the value at `FRONT` and circularly increase `FRONT`.
- Before enqueue, check if the queue is full.
- Before dequeue, check if the queue is empty.
- When enqueuing the first element, set `FRONT` to 0.
- When dequeuing the last element, reset both `FRONT` and `REAR` to -1.

#### Full Queue Conditions
- Case 1: `FRONT == 0 && REAR == SIZE - 1`
- Case 2: `FRONT == REAR + 1`

The second case occurs when `REAR` wraps around to the start and is just before `FRONT`.

---
