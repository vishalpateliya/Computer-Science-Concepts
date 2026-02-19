# Study Notes: Sorting Algorithms

## Introduction

When you want to search quickly among a large set of values, sorting becomes essential. Sorting is the process of arranging items or values in either ascending or descending order, which makes searching easier and more efficient.
## Criteria for Comparing Sorting Algorithms

The two main criteria to judge which algorithm is better than another are:

1. **Time Complexity:** The time taken to sort the given data
2. **Space Complexity:** The memory space required to perform the sorting

## Types of Sorting Algorithms

There are many different sorting techniques available, differentiated by their efficiency and space requirements. The following algorithms will be covered in detail:

1. [Bubble Sort](#1-bubble-sort)
2. [Insertion Sort](#2-insertion-sort)
3. [Selection Sort](#3-selection-sort)
4. [Quick Sort](#4-quick-sort)
5. [Merge Sort](#5-merge-sort)
6. [Heap Sort](#6-heap-sort)
---

## 1. Bubble Sort

Bubble Sort is used to sort numbers stored in an array. It compares the values one by one.

If the array needs to be sorted in ascending order, bubble sort starts by comparing the first element with the second element. If the first element is greater than the second, it swaps both elements and then moves on to compare the second and third elements, and so on. For n values, we must do this n-1 times.

### Why is it called Bubble Sort?

It is called bubble sort because with every complete iteration, the largest element in the array "bubbles up" towards the last position (highest index), just like a water bubble rises to the water surface.

### Implementation

- Starting with the first element (index = 0), compare the current element with the next element of the array.
- If the current element is greater than the next element, swap them.
- If the current element is less than the next element, move to the next element.
- Repeat this process.

After one complete iteration, the largest element is placed at the end of the array. In the next iteration, the second largest element will be placed at the next position, and so on.

### C Function for Bubble Sort

```c
void bubbleSort(int arr[], int n)
{
    int i, j, temp;
    for(i = 0; i < n-1; i++)
    {
        for(j = 0; j < n-i-1; j++)
        {
            if( arr[j] > arr[j+1])
            {
                // swap the elements
                temp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = temp;
            }
        }
    }
}
```

### Optimization of Bubble Sort

To optimize bubble sort, we can introduce a flag to monitor whether elements are being swapped inside the inner loop. If no swapping occurs in a particular iteration, it means the array is already sorted, and we can exit the loop instead of continuing all iterations.

### C Function for Optimized Bubble Sort

```c
void bubbleSort(int arr[], int n) {
    int i, j, temp;
    for(i = 0; i < n-1; i++) {
        // flag to monitor swapping in this pass
        int flag = 0; 
        for(j = 0; j < n-i-1; j++) {
            if( arr[j] > arr[j+1]) {
                // swap the elements
                temp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = temp;
                // swapping happened, set flag to 1
                flag = 1;
            }
        }
        // if no swapping occurred, the array is sorted
        if(!flag) {
            break;
        }
    }
}
```

### Complexity

In Bubble Sort, n-1 comparisons are done in the 1st pass, n-2 in the 2nd pass, n-3 in the 3rd pass, and so on.

| Complexity | Value |
|-----------|-------|
| Worst Case Time Complexity [Big-O] | $O(n^2)$ |
| Best Case Time Complexity [Big-Omega] | $O(n)$ |
| Average Time Complexity [Big-Theta] | $O(n^2)$ |
| Space Complexity | $O(1)$ |
---

## 2. Insertion Sort

Insertion Sort is a simple sorting algorithm that works the way we sort playing cards in our hand.

### Implementation

1. We start by making the second element of the given array (element at index 1) the key. The key element is the new card that we need to add to our existing sorted set of cards.

2. We compare the key element with the element(s) before it (element at index 0):
   - If the key element is less than the first element, we insert the key element before the first element.
   - If the key element is greater than the first element, we insert it after the first element.

3. Then we make the third element of the array as the key and compare it with elements to its left, inserting it at the right position.

4. We repeat this process until the array is sorted.

### Points for Insertion Sort

- It is efficient for smaller data sets but very inefficient for larger lists.
- Insertion Sort is adaptive—it reduces its total number of steps if a partially sorted array is provided as input, making it efficient.
- It is better than Selection Sort and Bubble Sort algorithms.
- Its space complexity is less. Like Bubble Sort, Insertion Sort also requires only a single additional memory space.
- It is a stable sorting technique, as it does not change the relative order of equal elements.

### C Function for Insertion Sort

```c
void insertionSort(int arr[], int length)
{
    int i, j, key;
    for (i = 1; i < length; i++)
    {
        j = i;
        while (j > 0 && arr[j - 1] > arr[j])
        {
            key = arr[j];
            arr[j] = arr[j - 1];
            arr[j - 1] = key;
            j--;
        }
    }
}
```

### Complexity

| Complexity | Value |
|-----------|-------|
| Worst Case Time Complexity [Big-O] | $O(n^2)$ |
| Best Case Time Complexity [Big-Omega] | $O(n)$ |
| Average Time Complexity [Big-Theta] | $O(n^2)$ |
| Space Complexity | $O(1)$ |
---

## 3. Selection Sort

This algorithm first finds the smallest element in the array and swaps it with the element in the first position. Then it finds the second smallest element and swaps it with the element in the second position. This process continues until the entire array is sorted.

It is called Selection Sort because it repeatedly selects the next-smallest element and swaps it into the right place.

### Implementation

- Starting from the first element, we search for the smallest element in the array and replace it with the element in the first position.
- We then move to the second position and look for the smallest element in the subarray starting from index 1 to the last index.
- We replace the element at the second position in the original array with the second smallest element.
- This process is repeated until the array is completely sorted.

### C Function to Implement Selection Sort

```c
void selectionSort(int arr[], int n)
{
    for(int i = 0; i < n - 1; i++)
    {
        int index = indexOfMinimum(arr, i, n);
        swap(arr, i, index);
    }
}
```

Here we have two helper functions inside the selection sort function. The first finds the minimum element in the array, and the second swaps the minimum number with the required element.

```c
int indexOfMinimum(int arr[], int startIndex, int n)
{
    int minIndex = startIndex;
    for(int i = startIndex + 1; i < n; i++)
    {
        if(arr[i] < arr[minIndex])
        {
            minIndex = i;
        }
    }
    return minIndex;
}

void swap(int arr[], int firstIndex, int secondIndex)
{
    int temp;
    temp = arr[firstIndex];
    arr[firstIndex] = arr[secondIndex];
    arr[secondIndex] = temp;
}
```

### Complexity

| Complexity | Value |
|-----------|-------|
| Worst Case Time Complexity [Big-O] | $O(n^2)$ |
| Best Case Time Complexity [Big-Omega] | $O(n^2)$ |
| Average Time Complexity [Big-Theta] | $O(n^2)$ |
| Space Complexity | $O(1)$ |
---

## 4. Quick Sort

Quick Sort is based on the concept of Divide and Conquer. The Divide and Conquer approach involves three steps:

1. **Divide** the problem into multiple small problems.
2. **Conquer** the sub-problems by solving them. This involves breaking down the problem into atomic sub-problems where they are actually solved.
3. **Combine** the solutions of the sub-problems to find the solution of the actual problem.

Quick Sort is also called partition-exchange sort. This algorithm divides the list into three main parts:

1. Elements less than the Pivot element
2. The Pivot element (central element)
3. Elements greater than the pivot element

The pivot element can be any element from the array—it can be the first element, the last element, or any random element.

### Implementation

- After selecting an element as the pivot (which is the last index of the array in our case), we divide the array.
- In quick sort, we call this **partitioning**. It is not a simple breaking down of the array into two subarrays, but rather a rearrangement where all elements smaller than the pivot are positioned on the left side and all elements greater than the pivot are on the right side.
- The pivot element will be at its final sorted position.
- The elements to the left and right may not be sorted yet.
- We then pick the subarrays (elements on the left and right of the pivot) and perform partitioning on them by choosing a pivot in each subarray.

### C Function to Implement Quick Sort

```c
void quicksort(int a[], int p, int r)
{
    if(p < r)
    {
        int q;
        q = partition(a, p, r);
        quicksort(a, p, q-1);
        quicksort(a, q+1, r);
    }
}

int partition (int a[], int low, int high)
{
    int pivot = a[high]; // selecting last element as pivot
    int i = (low - 1); // index of smaller element
    for (int j = low; j <= high - 1; j++)
    {
        // If current element is smaller than or equal to pivot
        if (a[j] <= pivot)
        {
            i++; // increment index of smaller element
            swap(&a[i], &a[j]);
        }
    }
    swap(&a[i + 1], &a[high]);
    return (i + 1);
}

void swap(int* a, int* b)
{
    int t = *a;
    *a = *b;
    *b = t;
}
```

### Complexity

| Complexity | Value |
|-----------|-------|
| Worst Case Time Complexity [Big-O] | $O(n^2)$ |
| Best Case Time Complexity [Big-Omega] | $O(n \log n)$ |
| Average Time Complexity [Big-Theta] | $O(n \log n)$ |
| Space Complexity | $O(n \log n)$ |

After one iteration of quick sort, the left side of the pivot will have smaller values and the right side will have larger values, which will then be sorted recursively.
---

## 5. Merge Sort

Merge Sort follows the Divide and Conquer paradigm to sort a given set of elements recursively. It divides the array into smaller subarrays, sorts them, and then merges them back together in sorted order.

---

### Implementation

- We take a variable `p` and store the starting index of the array in it.  
- We take another variable `r` and store the last index of the array in it.  
- We find the middle index using the formula:

  ```
  q = p + (r - p) / 2
  ```

  (This form prevents potential integer overflow.)

- We divide the array into two subarrays:
  - From index `p` to `q`
  - From index `q + 1` to `r`
- We recursively divide these subarrays until each subarray contains only one element.
- Once divided into single-element subarrays, we start merging them in sorted order.

---

### C Functions to Implement Merge Sort

```c
void mergeSort(int a[], int p, int r)
{
    if (p < r)
    {
        int q = p + (r - p) / 2;

        mergeSort(a, p, q);
        mergeSort(a, q + 1, r);
        merge(a, p, q, r);
    }
}
```

This function recursively divides the array and calls the `merge()` function after the subarrays are sorted.

---

```c
void merge(int a[], int p, int q, int r)
{
    int n = r - p + 1;
    int b[n];   // Temporary array of required size

    int i = p;
    int j = q + 1;
    int k = 0;

    while (i <= q && j <= r)
    {
        if (a[i] <= a[j])
        {
            b[k++] = a[i++];
        }
        else
        {
            b[k++] = a[j++];
        }
    }

    while (i <= q)
    {
        b[k++] = a[i++];
    }

    while (j <= r)
    {
        b[k++] = a[j++];
    }

    for (i = p, k = 0; i <= r; i++, k++)
    {
        a[i] = b[k]; // Copying back the sorted elements to a[]
    }
}
```

---

### Complexity

| Complexity | Value |
|-----------|--------|
| Worst Case Time Complexity (Big-O) | $O(n \log n)$ |
| Best Case Time Complexity (Big-Omega) | $O(n \log n)$ |
| Average Time Complexity (Big-Theta) | $O(n \log n)$ |
| Space Complexity | $O(n)$ |

---

### Notes

- Merge Sort is a stable sorting algorithm.
- It is not an in-place algorithm because it requires additional memory.
- It guarantees $O(n \log n)$ time complexity in all cases.

## 6. Heap Sort

Heap Sort is an efficient comparison-based sorting algorithm. It is an **in-place** algorithm and works by building a Heap data structure from the given array and then repeatedly extracting elements from the heap to produce a sorted array.

---

### What is a Heap?

A Heap is a special tree-based data structure that satisfies the following properties:

1. **Complete Binary Tree:**  
   A heap is always a complete binary tree, meaning all levels are completely filled except possibly the last level, which is filled from left to right.

2. **Heap Property:**  
   - In a **Max-Heap**, each parent node is greater than or equal to its children.  
   - In a **Min-Heap**, each parent node is less than or equal to its children.

> Heap Sort typically uses a **Max-Heap** for sorting in ascending order.

---

### Implementation

- Build a Max-Heap from the unsorted array.
- Repeatedly swap the root element (maximum element) with the last element of the heap.
- Reduce the heap size.
- Restore the heap property using the `heapify` function.
- Repeat until the heap size becomes 1.

---

### C Functions to Implement Heap Sort

```c
// Function to swap two elements
void swap(int *a, int *b)
{
    int temp = *a;
    *a = *b;
    *b = temp;
}

void heapSort(int arr[], int n)
{
    // Build heap (rearrange array)
    for (int i = n / 2 - 1; i >= 0; i--)
        heapify(arr, n, i);

    // One by one extract elements from heap
    for (int i = n - 1; i > 0; i--)
    {
        // Move current root to end
        swap(&arr[0], &arr[i]);

        // Call max heapify on the reduced heap
        heapify(arr, i, 0);
    }
}
```

Here we use a helper function `heapify()` to maintain the heap property.

---

```c
void heapify(int arr[], int n, int i)
{
    int largest = i;       // Initialize largest as root
    int l = 2 * i + 1;     // Left child index
    int r = 2 * i + 2;     // Right child index

    // If left child is larger than root
    if (l < n && arr[l] > arr[largest])
        largest = l;

    // If right child is larger than largest so far
    if (r < n && arr[r] > arr[largest])
        largest = r;

    // If largest is not root
    if (largest != i)
    {
        swap(&arr[i], &arr[largest]);

        // Recursively heapify the affected sub-tree
        heapify(arr, n, largest);
    }
}
```

---

### Complexity

| Complexity | Value |
|------------|--------|
| Worst Case Time Complexity | $O(n \log n)$ |
| Best Case Time Complexity | $O(n \log n)$ |
| Average Time Complexity | $O(n \log n)$ |
| Space Complexity | $O(1)$ |

---

### Notes

- Heap Sort is an in-place sorting algorithm.
- It is **not stable**.
- Building the heap takes $O(n)$ time.
- Each extraction takes $O(\log n)$ time.
- Overall time complexity remains $O(n \log n)$.

## Summary Comparison Table

| Algorithm       | Best Case        | Average Case     | Worst Case       | Space Complexity        | Stable |
|----------------|------------------|------------------|------------------|--------------------------|--------|
| Bubble Sort     | $O(n)$           | $O(n^2)$         | $O(n^2)$         | $O(1)$                   | Yes    |
| Insertion Sort  | $O(n)$           | $O(n^2)$         | $O(n^2)$         | $O(1)$                   | Yes    |
| Selection Sort  | $O(n^2)$         | $O(n^2)$         | $O(n^2)$         | $O(1)$                   | No     |
| Quick Sort      | $O(n \log n)$    | $O(n \log n)$    | $O(n^2)$         | $O(\log n)$ average*     | No     |
| Merge Sort      | $O(n \log n)$    | $O(n \log n)$    | $O(n \log n)$    | $O(n)$                   | Yes    |
| Heap Sort       | $O(n \log n)$    | $O(n \log n)$    | $O(n \log n)$    | $O(1)$                   | No     |

\* Quick Sort has $O(n)$ space complexity in the worst case due to recursion stack depth.

