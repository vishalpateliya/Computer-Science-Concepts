# Searching

## Introduction to Searching

Searching is the process of finding a particular element or checking whether an element exists in a given collection of data (array, list, etc.).

### Types of Searching Algorithms

- **Linear Search**: Sequential search through elements
- **Binary Search**: Efficient search on sorted arrays
- **Other variants**: Jump Search, Interpolation Search, Exponential Search

### Applications

- Database queries
- Finding records in files
- Searching in data structures
- Dictionary implementations
- Autocomplete features

---

## Linear Search

### Concept

Linear search (also called Sequential Search) checks each element in the array sequentially until the target element is found or the end of the array is reached.

### Algorithm

1. Start from the first element
2. Compare each element with the target value
3. If match found, return the index
4. If end of array reached without finding the element, return -1

### Characteristics

- **Time Complexity**: O(n) - worst and average case
- **Space Complexity**: O(1)
- **Best Case**: O(1) - when element is at first position
- **Works on**: Both sorted and unsorted arrays

### When to Use

- Small datasets
- Unsorted arrays
- When elements are frequently changing

### Implementation

#### C++ Implementation

```cpp
#include <iostream>
#include <vector>
using namespace std;

// Linear Search Function
int linearSearch(int arr[], int n, int target) {
    for (int i = 0; i < n; i++) {
        if (arr[i] == target) {
            return i; // Element found at index i
        }
    }
    return -1; // Element not found
}

// Linear Search using Vector
int linearSearchVector(vector<int>& arr, int target) {
    for (int i = 0; i < arr.size(); i++) {
        if (arr[i] == target) {
            return i;
        }
    }
    return -1;
}

int main() {
    int arr[] = {64, 34, 25, 12, 22, 11, 90};
    int n = sizeof(arr) / sizeof(arr[0]);
    int target = 22;
    
    int result = linearSearch(arr, n, target);
    if (result != -1) {
        cout << "Element found at index: " << result << endl;
    } else {
        cout << "Element not found in array" << endl;
    }
    
    // Using vector
    vector<int> vec = {64, 34, 25, 12, 22, 11, 90};
    target = 11;
    result = linearSearchVector(vec, target);
    if (result != -1) {
        cout << "Element found at index: " << result << endl;
    } else {
        cout << "Element not found in vector" << endl;
    }
    
    return 0;
}
```

#### Java Implementation

```java
import java.util.ArrayList;
import java.util.Scanner;

public class LinearSearch {
    
    // Linear Search for Array
    public static int linearSearch(int[] arr, int target) {
        for (int i = 0; i < arr.length; i++) {
            if (arr[i] == target) {
                return i; // Element found at index i
            }
        }
        return -1; // Element not found
    }
    
    // Linear Search for ArrayList
    public static int linearSearchList(ArrayList<Integer> list, int target) {
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i) == target) {
                return i;
            }
        }
        return -1;
    }
    
    // Linear Search for Strings
    public static int linearSearchString(String[] arr, String target) {
        for (int i = 0; i < arr.length; i++) {
            if (arr[i].equals(target)) {
                return i;
            }
        }
        return -1;
    }
    
    public static void main(String[] args) {
        int[] arr = {64, 34, 25, 12, 22, 11, 90};
        int target = 22;
        
        int result = linearSearch(arr, target);
        if (result != -1) {
            System.out.println("Element found at index: " + result);
        } else {
            System.out.println("Element not found in array");
        }
        
        // Using ArrayList
        ArrayList<Integer> list = new ArrayList<>();
        list.add(64);
        list.add(34);
        list.add(25);
        list.add(12);
        list.add(22);
        target = 25;
        
        result = linearSearchList(list, target);
        if (result != -1) {
            System.out.println("Element found at index: " + result);
        } else {
            System.out.println("Element not found in list");
        }
        
        // String search example
        String[] names = {"Alice", "Bob", "Charlie", "David"};
        String searchName = "Charlie";
        result = linearSearchString(names, searchName);
        if (result != -1) {
            System.out.println(searchName + " found at index: " + result);
        } else {
            System.out.println(searchName + " not found");
        }
    }
}
```

#### Python Implementation

```python
# Linear Search Function
def linear_search(arr, target):
    """
    Performs linear search on the array
    Returns index if found, -1 otherwise
    """
    for i in range(len(arr)):
        if arr[i] == target:
            return i  # Element found at index i
    return -1  # Element not found

# Linear Search with element count
def linear_search_count(arr, target):
    """
    Returns index and count of comparisons
    """
    count = 0
    for i in range(len(arr)):
        count += 1
        if arr[i] == target:
            return i, count
    return -1, count

# Linear Search - All Occurrences
def linear_search_all(arr, target):
    """
    Returns all indices where target is found
    """
    indices = []
    for i in range(len(arr)):
        if arr[i] == target:
            indices.append(i)
    return indices if indices else [-1]

# Main execution
if __name__ == "__main__":
    arr = [64, 34, 25, 12, 22, 11, 90]
    target = 22
    result = linear_search(arr, target)
    if result != -1:
        print(f"Element found at index: {result}")
    else:
        print("Element not found in array")
    
    # With comparison count
    target = 11
    result, comparisons = linear_search_count(arr, target)
    print(f"\nElement {target} found at index: {result}")
    print(f"Number of comparisons: {comparisons}")
    
    # Finding all occurrences
    arr_with_duplicates = [5, 2, 8, 2, 9, 2, 4]
    target = 2
    all_indices = linear_search_all(arr_with_duplicates, target)
    print(f"\nElement {target} found at indices: {all_indices}")
    
    # String search
    names = ["Alice", "Bob", "Charlie", "David"]
    search_name = "Charlie"
    result = linear_search(names, search_name)
    if result != -1:
        print(f"\n{search_name} found at index: {result}")
    else:
        print(f"\n{search_name} not found")
```

---

## Binary Search

### Concept

Binary search is an efficient algorithm for searching in a sorted array. It repeatedly divides the search interval in half, comparing the target value with the middle element.

### Prerequisites

- Array must be sorted (ascending or descending order)

### Algorithm (Iterative)

1. Set low = 0 and high = n-1
2. While low ≤ high:
   - Calculate mid = low + (high - low) / 2
   - If arr[mid] == target, return mid
   - If arr[mid] < target, search right half (low = mid + 1)
   - If arr[mid] > target, search left half (high = mid - 1)
3. Return -1 if not found

### Characteristics

- **Time Complexity**: O(log n)
- **Space Complexity**: O(1) for iterative, O(log n) for recursive
- **Best Case**: O(1) - when element is at middle
- **Works on**: Only sorted arrays

### When to Use

- Large sorted datasets
- When searching is performed frequently
- When array doesn't change often

### Implementation

#### C++ Implementation

```cpp
#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

// Iterative Binary Search
int binarySearchIterative(int arr[], int n, int target) {
    int low = 0;
    int high = n - 1;
    
    while (low <= high) {
        int mid = low + (high - low) / 2;  // Prevents overflow
        
        if (arr[mid] == target) {
            return mid;  // Element found
        }
        else if (arr[mid] < target) {
            low = mid + 1;  // Search in right half
        }
        else {
            high = mid - 1;  // Search in left half
        }
    }
    
    return -1;  // Element not found
}

// Recursive Binary Search
int binarySearchRecursive(int arr[], int low, int high, int target) {
    if (low > high) {
        return -1;  // Base case: element not found
    }
    
    int mid = low + (high - low) / 2;
    
    if (arr[mid] == target) {
        return mid;  // Element found
    }
    else if (arr[mid] < target) {
        return binarySearchRecursive(arr, mid + 1, high, target);  // Right half
    }
    else {
        return binarySearchRecursive(arr, low, mid - 1, target);  // Left half
    }
}

// Binary Search using STL
bool binarySearchSTL(vector<int>& arr, int target) {
    return binary_search(arr.begin(), arr.end(), target);
}

// Find first and last occurrence
pair<int, int> findFirstAndLast(int arr[], int n, int target) {
    int first = -1, last = -1;
    
    // Find first occurrence
    int low = 0, high = n - 1;
    while (low <= high) {
        int mid = low + (high - low) / 2;
        if (arr[mid] == target) {
            first = mid;
            high = mid - 1;  // Continue searching in left half
        }
        else if (arr[mid] < target) {
            low = mid + 1;
        }
        else {
            high = mid - 1;
        }
    }
    
    // Find last occurrence
    low = 0;
    high = n - 1;
    while (low <= high) {
        int mid = low + (high - low) / 2;
        if (arr[mid] == target) {
            last = mid;
            low = mid + 1;  // Continue searching in right half
        }
        else if (arr[mid] < target) {
            low = mid + 1;
        }
        else {
            high = mid - 1;
        }
    }
    
    return {first, last};
}

int main() {
    int arr[] = {2, 5, 8, 12, 16, 23, 38, 45, 56, 67, 78};
    int n = sizeof(arr) / sizeof(arr[0]);
    int target = 23;
    
    // Iterative approach
    int result = binarySearchIterative(arr, n, target);
    if (result != -1) {
        cout << "Element found at index (iterative): " << result << endl;
    } else {
        cout << "Element not found" << endl;
    }
    
    // Recursive approach
    result = binarySearchRecursive(arr, 0, n - 1, target);
    if (result != -1) {
        cout << "Element found at index (recursive): " << result << endl;
    } else {
        cout << "Element not found" << endl;
    }
    
    // Using STL
    vector<int> vec = {2, 5, 8, 12, 16, 23, 38, 45, 56, 67, 78};
    if (binarySearchSTL(vec, target)) {
        cout << "Element found using STL" << endl;
    } else {
        cout << "Element not found" << endl;
    }
    
    // Find first and last occurrence
    int arr2[] = {1, 2, 2, 2, 3, 4, 5, 5, 5, 6};
    int n2 = sizeof(arr2) / sizeof(arr2[0]);
    target = 5;
    pair<int, int> positions = findFirstAndLast(arr2, n2, target);
    cout << "\nFirst occurrence of " << target << " at index: " << positions.first << endl;
    cout << "Last occurrence of " << target << " at index: " << positions.second << endl;
    
    return 0;
}
```

#### Java Implementation

```java
import java.util.Arrays;

public class BinarySearch {
    
    // Iterative Binary Search
    public static int binarySearchIterative(int[] arr, int target) {
        int low = 0;
        int high = arr.length - 1;
        
        while (low <= high) {
            int mid = low + (high - low) / 2;  // Prevents overflow
            
            if (arr[mid] == target) {
                return mid;  // Element found
            }
            else if (arr[mid] < target) {
                low = mid + 1;  // Search in right half
            }
            else {
                high = mid - 1;  // Search in left half
            }
        }
        
        return -1;  // Element not found
    }
    
    // Recursive Binary Search
    public static int binarySearchRecursive(int[] arr, int low, int high, int target) {
        if (low > high) {
            return -1;  // Base case: element not found
        }
        
        int mid = low + (high - low) / 2;
        
        if (arr[mid] == target) {
            return mid;  // Element found
        }
        else if (arr[mid] < target) {
            return binarySearchRecursive(arr, mid + 1, high, target);  // Right half
        }
        else {
            return binarySearchRecursive(arr, low, mid - 1, target);  // Left half
        }
    }
    
    // Binary Search using Arrays.binarySearch()
    public static int binarySearchBuiltIn(int[] arr, int target) {
        return Arrays.binarySearch(arr, target);
        // Returns: index if found (>=0), negative value if not found
    }
    
    // Find first occurrence
    public static int findFirstOccurrence(int[] arr, int target) {
        int low = 0;
        int high = arr.length - 1;
        int result = -1;
        
        while (low <= high) {
            int mid = low + (high - low) / 2;
            if (arr[mid] == target) {
                result = mid;
                high = mid - 1;  // Continue searching in left half
            }
            else if (arr[mid] < target) {
                low = mid + 1;
            }
            else {
                high = mid - 1;
            }
        }
        
        return result;
    }
    
    // Find last occurrence
    public static int findLastOccurrence(int[] arr, int target) {
        int low = 0;
        int high = arr.length - 1;
        int result = -1;
        
        while (low <= high) {
            int mid = low + (high - low) / 2;
            if (arr[mid] == target) {
                result = mid;
                low = mid + 1;  // Continue searching in right half
            }
            else if (arr[mid] < target) {
                low = mid + 1;
            }
            else {
                high = mid - 1;
            }
        }
        
        return result;
    }
    
    // Count occurrences of an element
    public static int countOccurrences(int[] arr, int target) {
        int first = findFirstOccurrence(arr, target);
        if (first == -1) {
            return 0;
        }
        int last = findLastOccurrence(arr, target);
        return last - first + 1;
    }
    
    public static void main(String[] args) {
        int[] arr = {2, 5, 8, 12, 16, 23, 38, 45, 56, 67, 78};
        int target = 23;
        
        // Iterative approach
        int result = binarySearchIterative(arr, target);
        if (result != -1) {
            System.out.println("Element found at index (iterative): " + result);
        } else {
            System.out.println("Element not found");
        }
        
        // Recursive approach
        result = binarySearchRecursive(arr, 0, arr.length - 1, target);
        if (result != -1) {
            System.out.println("Element found at index (recursive): " + result);
        } else {
            System.out.println("Element not found");
        }
        
        // Built-in method
        result = binarySearchBuiltIn(arr, target);
        if (result >= 0) {
            System.out.println("Element found at index (built-in): " + result);
        } else {
            System.out.println("Element not found");
        }
        
        // Working with duplicates
        int[] arr2 = {1, 2, 2, 2, 3, 4, 5, 5, 5, 6};
        target = 5;
        int first = findFirstOccurrence(arr2, target);
        int last = findLastOccurrence(arr2, target);
        int count = countOccurrences(arr2, target);
        
        System.out.println("\nFirst occurrence of " + target + " at index: " + first);
        System.out.println("Last occurrence of " + target + " at index: " + last);
        System.out.println("Total occurrences: " + count);
    }
}
```

#### Python Implementation

```python
# Iterative Binary Search
def binary_search_iterative(arr, target):
    """
    Performs iterative binary search
    Returns index if found, -1 otherwise
    """
    low = 0
    high = len(arr) - 1
    
    while low <= high:
        mid = low + (high - low) // 2  # Prevents overflow
        
        if arr[mid] == target:
            return mid  # Element found
        elif arr[mid] < target:
            low = mid + 1  # Search in right half
        else:
            high = mid - 1  # Search in left half
    
    return -1  # Element not found

# Recursive Binary Search
def binary_search_recursive(arr, low, high, target):
    """
    Performs recursive binary search
    """
    if low > high:
        return -1  # Base case: element not found
    
    mid = low + (high - low) // 2
    
    if arr[mid] == target:
        return mid  # Element found
    elif arr[mid] < target:
        return binary_search_recursive(arr, mid + 1, high, target)  # Right half
    else:
        return binary_search_recursive(arr, low, mid - 1, target)  # Left half

# Find first occurrence
def find_first_occurrence(arr, target):
    """
    Finds the first occurrence of target
    """
    low = 0
    high = len(arr) - 1
    result = -1
    
    while low <= high:
        mid = low + (high - low) // 2
        if arr[mid] == target:
            result = mid
            high = mid - 1  # Continue searching in left half
        elif arr[mid] < target:
            low = mid + 1
        else:
            high = mid - 1
    
    return result

# Find last occurrence
def find_last_occurrence(arr, target):
    """
    Finds the last occurrence of target
    """
    low = 0
    high = len(arr) - 1
    result = -1
    
    while low <= high:
        mid = low + (high - low) // 2
        if arr[mid] == target:
            result = mid
            low = mid + 1  # Continue searching in right half
        elif arr[mid] < target:
            low = mid + 1
        else:
            high = mid - 1
    
    return result

# Count occurrences
def count_occurrences(arr, target):
    """
    Counts total occurrences of target
    """
    first = find_first_occurrence(arr, target)
    if first == -1:
        return 0
    last = find_last_occurrence(arr, target)
    return last - first + 1

# Binary search with comparison count
def binary_search_with_count(arr, target):
    """
    Returns index and number of comparisons
    """
    low = 0
    high = len(arr) - 1
    comparisons = 0
    
    while low <= high:
        mid = low + (high - low) // 2
        comparisons += 1
        
        if arr[mid] == target:
            return mid, comparisons
        elif arr[mid] < target:
            low = mid + 1
        else:
            high = mid - 1
    
    return -1, comparisons

# Main execution
if __name__ == "__main__":
    arr = [2, 5, 8, 12, 16, 23, 38, 45, 56, 67, 78]
    target = 23
    
    # Iterative approach
    result = binary_search_iterative(arr, target)
    if result != -1:
        print(f"Element found at index (iterative): {result}")
    else:
        print("Element not found")
    
    # Recursive approach
    result = binary_search_recursive(arr, 0, len(arr) - 1, target)
    if result != -1:
        print(f"Element found at index (recursive): {result}")
    else:
        print("Element not found")
    
    # With comparison count
    result, comparisons = binary_search_with_count(arr, target)
    print(f"\nElement found at index: {result}")
    print(f"Number of comparisons: {comparisons}")
    
    # Working with duplicates
    arr2 = [1, 2, 2, 2, 3, 4, 5, 5, 5, 6]
    target = 5
    first = find_first_occurrence(arr2, target)
    last = find_last_occurrence(arr2, target)
    count = count_occurrences(arr2, target)
    
    print(f"\nFirst occurrence of {target} at index: {first}")
    print(f"Last occurrence of {target} at index: {last}")
    print(f"Total occurrences: {count}")
```

---

## Comparison and Complexity Analysis

### Time Complexity Comparison

| Algorithm | Best Case | Average Case | Worst Case | Space Complexity |
|-----------|-----------|--------------|------------|------------------|
| Linear Search | O(1) | O(n) | O(n) | O(1) |
| Binary Search | O(1) | O(log n) | O(log n) | O(1) iterative, O(log n) recursive |

### Example Calculation

For an array of 1,000,000 elements:
- **Linear Search**: May need up to 1,000,000 comparisons
- **Binary Search**: Needs at most $\log_2(1,000,000) \approx 20$ comparisons

### When to Use Which Algorithm

#### Use Linear Search when:
- Array is unsorted
- Array size is small (n < 100)
- Searching is performed rarely
- Data structure doesn't support random access

#### Use Binary Search when:
- Array is sorted (or can be sorted once)
- Large dataset (n > 100)
- Multiple searches on same dataset
- Memory for sorted array is available

### Key Differences

| Feature | Linear Search | Binary Search |
|---------|---------------|---------------|
| Sorted Array Required | No | Yes |
| Approach | Sequential | Divide and Conquer |
| Efficiency | Less efficient for large data | Highly efficient |
| Implementation | Simple | Moderately complex |
| Data Structure | Any | Arrays, Lists with random access |
