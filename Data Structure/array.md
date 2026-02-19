# Study Notes: Array (Data Structure)

## What is an Array?
An **array** is a fixed-size collection of elements stored in contiguous memory locations. It is used to store elements of the same type, hence also called a **homogeneous data structure**.

### Key Concepts
1. **Element:** The items or data values stored in the array.
2. **Index:** Each element in an array has an index value used to access it. Indexing starts from 0.

Example: An integer array of size 6 can be visualized as:

| Index | 0 | 1 | 2 | 3 | 4 | 5 |
|-------|---|---|---|---|---|---|
| Value |   |   |   |   |   |   |

Arrays can be one-dimensional, two-dimensional, three-dimensional, and so on.

---

## Array Declaration in C
Arrays can be declared in several ways:

1. **Declaration with size:**
   ```c
   int a[6];
   ```
2. **Declaration with initialization:**
   ```c
   int a[] = {1, 2, 3, 4, 5, 6}; // size is 6
   ```
3. **Declaration with size and initialization:**
   ```c
   int a[6] = {1, 2, 3, 4, 5, 6};
   ```

---

## Accessing Array Elements
Array elements are accessed by their indexes (starting from 0).

```c
#include <stdio.h>
int main() {
    int a[4] = {1, 5, 8, 7};
    printf("%d %d %d %d", a[2], a[0], a[1], a[3]);
    return 0;
}
// Output: 8 1 5 7
```

**Note:** In C, there is no out-of-bounds checking. Accessing an invalid index gives unpredictable results.

```c
#include <stdio.h>
int main() {
    int a[4] = {1, 5, 8, 7};
    printf("%d %d %d %d", a[2], a[0], a[5], a[-2]);
    return 0;
}
// Output: 8 1 <garbage> <garbage>
```

---

## Contiguous Memory Allocation
Array elements are stored in contiguous memory locations.

```c
#include <stdio.h>
int main() {
    int a[4], i;
    printf("Size of int: %d\n", sizeof(int));
    for (i = 0; i < 4; i++)
        printf("Address of a[%d]: %p\n", i, &a[i]);
    return 0;
}
```

**Points to Note:**
1. The array name gives the address of the first element.
2. Array elements can be accessed using pointer arithmetic: `a[i]` is equivalent to `*(a + i)`.
3. Array parameters are always passed as pointers, even when using square brackets.

---

## Basic Operations on Arrays
1. **Traversal:** Printing all elements one by one.
2. **Insertion:** Inserting an element at a given index.
3. **Deletion:** Deleting an element at a given index.
4. **Search:** Searching for an element by index or value.
5. **Update:** Modifying the value of an element at a specific index.

### 1. Traversal
```c
#include <stdio.h>
int main() {
    int a[4] = {1, 2, 3, 4};
    int i;
    for (i = 0; i < 4; i++)
        printf("Value of a[%d] is %d\n", i, a[i]);
    return 0;
}
```

### 2. Insertion
Insert an element at a specific index by shifting elements to the right.

```c
#include <stdio.h>

int main() {
    // 1. Declare array with extra capacity to avoid overflow
    int A[10] = {1, 3, 5, 7, 8}; 
    int item = 10, k = 3, n = 5; // k is the index to insert at
    int i, j;

    printf("Original array:\n");
    for (i = 0; i < n; i++)
        printf("A[%d] = %d\n", i, A[i]);

    // 2. Shift elements to the right starting from the end
    for (j = n - 1; j >= k; j--) {
        A[j + 1] = A[j];
    }

    // 3. Insert the item and increment size
    A[k] = item;
    n = n + 1;

    printf("\nArray after insertion:\n");
    for (i = 0; i < n; i++)
        printf("A[%d] = %d\n", i, A[i]);

    return 0;
}
```

### 3. Deletion
Delete an element from a specific index and shift elements to the left.

```c
#include <stdio.h>
int main() {
    int A[] = {1, 3, 5, 7, 8};
    int k = 3, n = 5;
    int i, j;
    printf("Original array:\n");
    for (i = 0; i < n; i++)
        printf("A[%d] = %d\n", i, A[i]);
    j = k;
    while (j < n - 1) {
        A[j] = A[j + 1]; // Move the next element into the current gap
        j = j + 1;
    }
    n = n - 1;
    printf("Array after deletion:\n");
    for (i = 0; i < n; i++)
        printf("A[%d] = %d\n", i, A[i]);
    return 0;
}
```

### 4. Searching
Search for an element by value and print its position.

```c
#include <stdio.h>
int main() {
    int A[] = {1, 3, 5, 7, 8};
    int item = 5, n = 5;
    int i, j = 0;
    printf("Original array:\n");
    for (i = 0; i < n; i++)
        printf("A[%d] = %d\n", i, A[i]);
    while (j < n) {
        if (A[j] == item) break;
        j = j + 1;
    }
    if (j < n)
        printf("Found element %d at position %d\n", item, j + 1);
    else
        printf("Element not found\n");
    return 0;
}
```

### 5. Update
Update the value of an element at a specific index.

```c
#include <stdio.h>
int main() {
    int A[] = {1, 3, 5, 7, 8};
    int k = 3, n = 5, item = 10;
    int i;
    printf("Original array:\n");
    for (i = 0; i < n; i++)
        printf("A[%d] = %d\n", i, A[i]);
    A[k] = item;
    printf("Array after update:\n");
    for (i = 0; i < n; i++)
        printf("A[%d] = %d\n", i, A[i]);
    return 0;
}
```

---

## Time and Space Complexity
| Operation                | Time Complexity |
|--------------------------|-----------------|
| Read (anywhere)          | $O(1)$          |
| Add/Remove at end        | $O(1)$          |
| Add/Remove at index      | $O(n)$          |
| Resize                   | $O(n)$          |
| Find by position         | $O(1)$          |
| Find by value (search)   | $O(n)$          |

- **Space complexity** of an array of size $n$ is $O(n)$.

---
