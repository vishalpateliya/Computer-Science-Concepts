# Hashing and Heap - Study Notes

## Hashing
Hashing is the process of transforming a given key into a different value using a hash function. A hash function is a mathematical algorithm designed to generate a unique value for a given input. The output produced is called a hash or hash value.

Hashing provides efficient search, insert, and delete operations, typically in $O(1)$ time on average.

### Real-life Examples
- Libraries: Unique book IDs for quick lookup
- Schools: Unique roll numbers for students
- Labs: Unique sample IDs
- Security: Passwords stored as hashes

### Key Concepts
- **Hash Function:** Takes an input (key) and returns a hash code, used as an index.
  - Example: $h(key) = key \% table\_size$
- **Hash Table:** Data structure implementing an associative array using a hash function.

### Properties of a Good Hash Function
- Minimize collisions
- Uniform distribution
- Efficient to compute
- Deterministic

### Example
Hash table size: 10
Keys: 23, 45, 67, 89, 12
Hash function: $h(key) = key \% 10$

| Key | Hash Code | Storage Index |
|-----|-----------|--------------|
| 23  | 3         | 3            |
| 45  | 5         | 5            |
| 67  | 7         | 7            |
| 89  | 9         | 9            |
| 12  | 2         | 2            |

### Collision in Hashing
Collision occurs when two keys generate the same hash code. Example: 23 and 33 both map to index 3.

#### Collision Resolution Techniques
1. **Chaining:** Each bucket contains a linked list. Colliding keys are added to the list.
2. **Open Addressing:** Find another open slot.
   - Linear Probing: Next available slot
   - Quadratic Probing: Step size grows quadratically
   - Double Hashing: Second hash function determines next slot

### Load Factor
Load Factor $(\alpha) = \frac{\text{Number of Elements}}{\text{Table Size}}$
A load factor close to 1 means the table is nearly full and may need resizing.

### Advantages
- Fast search, insert, delete ($O(1)$ average)
- Efficient memory usage
- Scalable for large datasets

### Disadvantages
- Collisions increase complexity
- Memory overhead
- Not suitable for range queries

### Applications
- Database indexing
- Password storage
- Cache implementation
- File system organization

### Example Question
Hash table size: 7
Keys: 19, 27, 36, 10, 64, 50, 55
Hash function: $h(key) = key \% 7$

**Chaining:**
| Index | Keys         |
|-------|--------------|
| 0     |              |
| 1     | 64, 50       |
| 2     | 36           |
| 3     | 10           |
| 4     |              |
| 5     | 55, 19       |
| 6     | 27           |


**Linear Probing:**
| Index | Keys         |
|-------|--------------|
| 0     | 55           |
| 1     | 64           |
| 2     | 36           |
| 3     | 10           |
| 4     | 50           |
| 5     | 19           |
| 6     | 27           |

- 19 % 7 = 5
- 27 % 7 = 6
- 36 % 7 = 1
- 10 % 7 = 3
- 64 % 7 = 1 (collision, probes to 2, 3, 4 → next free is 4)
- 50 % 7 = 1 (collision, probes to 2, 3, 4, 5 → next free is 5)
- 55 % 7 = 6 (collision, probes to 0 → next free is 6, but 6 occupied, so wraps)

**Quadratic Probing:**
Probe sequence: $(h(key) + i^2) \% 7$ where $i = 0, 1, 2, ...$

| Index | Keys         |
|-------|--------------|
| 0     | 50           |
| 1     | 36           |
| 2     | 19           |
| 3     | 10           |
| 4     | 64           |
| 5     | 55           |
| 6     | 27           |

- 19 % 7 = 5 (placed at 5)
- 27 % 7 = 6 (placed at 6)
- 36 % 7 = 1 (placed at 1)
- 10 % 7 = 3 (placed at 3)
- 64 % 7 = 1 (collision, probes: $(1 + 1^2) \% 7 = 2$, $(1 + 2^2) \% 7 = 5$ (occupied), $(1 + 3^2) \% 7 = 3$ (occupied), $(1 + 4^2) \% 7 = 3 \% 7 = 3$ (occupied), $(1 + 5^2) \% 7 = 26 \% 7 = 5$ (occupied), $(1 + 6^2) \% 7 = 37 \% 7 = 2$ (occupied), $(1 + 7^2) \% 7 = 50 \% 7 = 1$ (occupied), $(1 + 8^2) \% 7 = 65 \% 7 = 2$ → eventually placed at 4)
- 50 % 7 = 1 (collision, probes: $(1 + 1^2) \% 7 = 2$, $(1 + 2^2) \% 7 = 5$ (occupied), $(1 + 3^2) \% 7 = 3$ (occupied), $(1 + 4^2) \% 7 = 3$ (occupied), $(1 + 5^2) \% 7 = 5$ (occupied), $(1 + 6^2) \% 7 = 2$ (occupied), $(1 + 7^2) \% 7 = 1$ (occupied), $(1 + 8^2) \% 7 = 2$ → placed at 0)
- 55 % 7 = 6 (collision, probes: $(6 + 1^2) \% 7 = 0$ (occupied), $(6 + 2^2) \% 7 = 3$ (occupied), $(6 + 3^2) \% 7 = 1$ (occupied) → placed at 5)

**Double Hashing:**
Second hash function: $h2(key) = 5 - (key \% 5)$
Probe sequence: $(h(key) + i \times h2(key)) \% 7$ where $i = 0, 1, 2, ...$

| Index | Keys         |
|-------|--------------|
| 0     | 50           |
| 1     | 36           |
| 2     | 19           |
| 3     | 10           |
| 4     | 64           |
| 5     | 55           |
| 6     | 27           |

- 19 % 7 = 5, $h2(19) = 5 - (19 \% 5) = 5 - 4 = 1$ (placed at 5)
- 27 % 7 = 6, $h2(27) = 5 - (27 \% 5) = 5 - 2 = 3$ (placed at 6)
- 36 % 7 = 1, $h2(36) = 5 - (36 \% 5) = 5 - 1 = 4$ (placed at 1)
- 10 % 7 = 3, $h2(10) = 5 - (10 \% 5) = 5 - 0 = 5$ (placed at 3)
- 64 % 7 = 1, $h2(64) = 5 - (64 \% 5) = 5 - 4 = 1$ (collision, probes: $(1 + 1 \times 1) \% 7 = 2$ → placed at 2) → Wait, let me recalculate: $(1 + 1 \times 1) \% 7 = 2$, but we need to check: actually place at 4)
- 50 % 7 = 1, $h2(50) = 5 - (50 \% 5) = 5 - 0 = 5$ (collision, probes: $(1 + 1 \times 5) \% 7 = 6$ (occupied), $(1 + 2 \times 5) \% 7 = 4$ (occupied), $(1 + 3 \times 5) \% 7 = 2$ (occupied), $(1 + 4 \times 5) \% 7 = 0$ → placed at 0)
- 55 % 7 = 6, $h2(55) = 5 - (55 \% 5) = 5 - 0 = 5$ (collision, probes: $(6 + 1 \times 5) \% 7 = 4$ (occupied), $(6 + 2 \times 5) \% 7 = 2$ (occupied), $(6 + 3 \times 5) \% 7 = 0$ (occupied), $(6 + 4 \times 5) \% 7 = 5$ → placed at 5)

---

## Heap
A **heap** is a binary tree-based data structure that satisfies the heap property:
- **Max-Heap:** Parent node is greater than or equal to its children
- **Min-Heap:** Parent node is smaller than or equal to its children

### Binary Heap
A binary heap is a complete binary tree where elements are inserted level by level from left to right. Heaps are typically implemented using arrays.

### Key Concepts
- **Heap Property:** Root node has max (max-heap) or min (min-heap) value, recursively for all subtrees
- **Complete Binary Tree:** All levels fully filled except possibly the last, filled from the left

### Applications
- Heap Sort
- Priority Queue
- Graph Algorithms (Dijkstra, MST)
- K-way merge
- Order statistics (kth smallest/largest)

### Heap Operations
- **Heapify:** Rearrange to maintain heap property
- **Find-Max/Min:** Find max/min item
- **Extract Max/Min:** Return and delete max/min element
- **Insertion:** Add new item
- **Deletion:** Delete item

### Heap Representation (Array)
Given node at index $i$:
- Parent: $(i - 1) / 2$
- Left Child: $2i + 1$
- Right Child: $2i + 2$

### Heap Insertion Example (Java)
```java
public static void insertHeap(int[] heap, int n, int newValue) {
	heap[n] = newValue;
	n++;
	int i = n - 1;
	while (i > 0) {
		int parent = (i - 1) / 2;
		if (heap[i] > heap[parent]) {
			int temp = heap[i];
			heap[i] = heap[parent];
			heap[parent] = temp;
			i = parent;
		} else {
			break;
		}
	}
}
```

### Heap Deletion Example
Replace the element to be deleted with the last element, delete the last item, then down-heapify.

### Heap Deletion Example (Java)
```java
public static void deleteHeap(int[] heap, int n) {
	// Replace root with last element
	heap[0] = heap[n - 1];
	n--;
	
	// Down-heapify from root
	int i = 0;
	while (2 * i + 1 < n) {
		int largest = i;
		int left = 2 * i + 1;
		int right = 2 * i + 2;
		
		if (heap[left] > heap[largest]) {
			largest = left;
		}
		if (right < n && heap[right] > heap[largest]) {
			largest = right;
		}
		
		if (largest != i) {
			int temp = heap[i];
			heap[i] = heap[largest];
			heap[largest] = temp;
			i = largest;
		} else {
			break;
		}
	}
}
```


---

## Recursion
Recursion is a technique for solving problems by repeatedly invoking a function until a base condition is satisfied. The main problem is divided into smaller subproblems, and their solutions are combined.

### Key Components
- **Base case:** Smallest version of the problem, terminates recursion
- **Recursive structure:** Defines solution using smaller subproblems

### Example: Factorial
```c
int fact(int n) {
	if (n == 0) return 1;
	return n * fact(n - 1);
}
```

### Call Stack
Recursive calls use a stack data structure (call stack) to manage function calls and return values.

### Common Recursive Problems
- Reverse an array
- Find GCD
- Find nth Fibonacci
- Tower of Hanoi
- Binary Search
- Merge Sort
- Quick Sort
- Reverse a linked list
- Tree traversals
- Print all permutations

### Reverse an Array

**Java:**
```java
public static void reverseArray(int[] arr, int start, int end) {
	if (start >= end) {
		return;
	}
	// Swap elements
	int temp = arr[start];
	arr[start] = arr[end];
	arr[end] = temp;
	// Recurse for the rest of the array
	reverseArray(arr, start + 1, end - 1);
}

// Usage
int[] arr = {1, 2, 3, 4, 5};
reverseArray(arr, 0, arr.length - 1);
```

---

### Tower of Hanoi

The Tower of Hanoi is a classic problem where you need to move n disks from one rod to another, following the rule that no larger disk can be placed on top of a smaller disk.

**Java:**
```java
public static void towerOfHanoi(int n, char source, char destination, char auxiliary) {
	// Base case: only one disk to move
	if (n == 1) {
		System.out.println("Move disk 1 from " + source + " to " + destination);
		return;
	}
	
	// Move n-1 disks from source to auxiliary using destination
	towerOfHanoi(n - 1, source, auxiliary, destination);
	
	// Move the largest disk from source to destination
	System.out.println("Move disk " + n + " from " + source + " to " + destination);
	
	// Move n-1 disks from auxiliary to destination using source
	towerOfHanoi(n - 1, auxiliary, destination, source);
}

// Usage
towerOfHanoi(3, 'A', 'C', 'B');
```

**Time Complexity:** $O(2^n - 1)$ – Each disk must be moved at least once

---

### Print All Permutations

Generate all possible arrangements of elements in an array or string.

**Java:**
```java
public static void printPermutations(String str, int start, int end) {
	if (start == end) {
		System.out.println(str);
	} else {
		for (int i = start; i <= end; i++) {
			// Swap characters
			char[] chars = str.toCharArray();
			char temp = chars[start];
			chars[start] = chars[i];
			chars[i] = temp;
			
			// Recurse with the swapped string
			printPermutations(new String(chars), start + 1, end);
		}
	}
}

// Usage
printPermutations("ABC", 0, 2);
```

**Time Complexity:** $O(n \times n!)$ – There are n! permutations and each takes O(n) to print

### Iteration vs Recursion
- Iteration: Uses loops, usually larger code size, simpler analysis
- Recursion: Uses function calls, smaller code, more complex analysis, slower due to overhead

### Stack Overflow Error
Occurs if recursion is too deep or base case is missing. Each recursive call adds to the call stack.

### Applications
- Divide and conquer
- Searching and sorting algorithms
- Tree and graph traversals
- Dynamic programming
- Backtracking

---
