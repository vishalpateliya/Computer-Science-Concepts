# Algorithm Analysis

## 1. Introduction

### 1.1 Motivation for Algorithm Analysis

When designing solutions to computational problems, we often have multiple algorithms available. The choice between them depends on two frequently competing factors:

1. **Development Efficiency**: Algorithm should be easy to understand, write, and debug
2. **Computational Efficiency**: Algorithm should make efficient use of computer resources (CPU, memory, etc.)

**Key Insight**: When a program runs infrequently, development efficiency is prioritized. However, when a program runs frequently or handles large datasets, computational efficiency becomes critical because the cost of execution far exceeds the cost of development.

### 1.2 Parameters for Algorithm Selection

Algorithm efficiency is measured primarily through:
- **Time Complexity**: How the running time grows with input size
- **Space Complexity**: How the memory usage grows with input size

#### Space Complexity
Deals with the memory required to store input data and any auxiliary data structures used by the algorithm.

#### Time Complexity
Deals with the running time of the program. The execution time depends on:
1. Size and nature of the input data
2. Size of the program code
3. Machine's instruction set
4. The processing power of the machine
5. Time required to execute each machine instruction
6. The algorithmic approach and implementation details

---

## 2. Asymptotic Analysis

### 2.1 Growth Rate Measurement

When comparing algorithms that solve the same problem for large input sizes ($n$), we analyze how their performance scales. We focus on the asymptotic behavior (behavior as $n \to \infty$) rather than absolute constants, because:

- Constants are machine-dependent
- For large inputs, the dominant term dominates
- It provides a machine-independent measure of efficiency

### 2.2 Big-O Notation (Upper Bound)

**Definition**: A function $f(n)$ is said to be $O(g(n))$ (read as "Big-O of g(n)") if there exist positive constants $c$ and $k$ such that:

$$f(n) \leq c \cdot g(n) \quad \text{for all } n \geq k$$

**Meaning**: Big-O provides an asymptotic upper bound. It represents the worst-case scenario.

**Examples**:
- $3n + 2 = O(n)$ because $3n + 2 \leq 4n$ for all $n \geq 2$
- $n^2 + 5n = O(n^2)$ because $n^2 + 5n \leq 2n^2$ for all $n \geq 5$
- $2^n + n^3 = O(2^n)$ because exponential dominates polynomial

### 2.3 Big-Omega Notation (Lower Bound)

**Definition**: A function $f(n)$ is said to be $\Omega(g(n))$ (read as "Big-Omega of g(n)") if there exist positive constants $c$ and $k$ such that:

$$f(n) \geq c \cdot g(n) \quad \text{for all } n \geq k$$

**Meaning**: Big-Omega provides an asymptotic lower bound. It represents the best-case scenario or the minimum guaranteed behavior.

**Examples**:
- $3n + 2 = \Omega(n)$ because $3n + 2 \geq n$ for all $n \geq 1$
- $n^2 + 5n = \Omega(n^2)$ because $n^2 + 5n \geq n^2$ for all $n \geq 1$

### 2.4 Theta Notation (Tight Bound)

**Definition**: A function $f(n)$ is said to be $\Theta(g(n))$ (read as "Theta of g(n)") if there exist positive constants $c_1$, $c_2$, and $k$ such that:

$$c_1 \cdot g(n) \leq f(n) \leq c_2 \cdot g(n) \quad \text{for all } n \geq k$$

**Meaning**: Theta provides an asymptotically tight bound on the growth rate from both above and below. It defines the exact asymptotic behavior of the function.

**Examples**:
- $3n + 2 = \Theta(n)$ because $n \leq 3n + 2 \leq 4n$ for all $n \geq 2$
- $n^2 + 5n = \Theta(n^2)$ because $n^2 \leq n^2 + 5n \leq 2n^2$ for all $n \geq 5$

### 2.5 Comparison of Asymptotic Notations

| Notation | Type | Meaning | Use Case |
|----------|------|---------|----------|
| $O(g(n))$ | Upper Bound | $f(n) \leq c \cdot g(n)$ | Worst-case analysis |
| $\Omega(g(n))$ | Lower Bound | $f(n) \geq c \cdot g(n)$ | Best-case analysis |
| $\Theta(g(n))$ | Tight Bound | $c_1 \cdot g(n) \leq f(n) \leq c_2 \cdot g(n)$ | Exact behavior |

### 2.6 Common Time Complexity Classes

Listed from fastest to slowest:

1. $O(1)$ - **Constant time** (accessing array element by index)
2. $O(\log n)$ - **Logarithmic time** (binary search)
3. $O(n)$ - **Linear time** (simple search, linear scan)
4. $O(n \log n)$ - **Linearithmic time** (efficient sorting: merge sort, quicksort)
5. $O(n^2)$ - **Quadratic time** (bubble sort, insertion sort)
6. $O(n^3)$ - **Cubic time** (matrix multiplication)
7. $O(2^n)$ - **Exponential time** (recursive Fibonacci, subset generation)
8. $O(n!)$ - **Factorial time** (permutation generation)

---

## 3. Case Analysis

When analyzing algorithms, we consider three scenarios based on input characteristics:

### 3.1 Worst-Case Analysis (Usually Done)

**Definition**: Calculate the upper bound on the running time when the algorithm encounters the most unfavorable input.

**Method**:
- Identify the input configuration that causes the maximum number of operations
- Count the operations for that specific input
- Express the result using Big-O notation

**Why**: Provides a guarantee that the algorithm will not take longer than this bound, regardless of input.

**Example**: Linear search for a missing element in an array of size $n$ has worst-case complexity $O(n)$.

### 3.2 Average-Case Analysis (Sometimes Done)

**Definition**: Calculate the expected running time considering all possible inputs with some probability distribution.

**Method**:
1. Determine the probability distribution of inputs
2. Calculate running time for each possible input
3. Compute the average: $\text{Average} = \frac{1}{n} \sum_{i=1}^{n} T(i)$

**Challenge**: Requires knowing (or assuming) the distribution of real-world inputs, which is often difficult.

**Example**: Linear search for any element in array of size $n$ has average-case complexity $O(n/2) = O(n)$.

### 3.3 Best-Case Analysis (Often Ignored)

**Definition**: Calculate the lower bound on the running time when the algorithm encounters the most favorable input.

**Method**:
- Identify the input configuration that causes the minimum number of operations
- Count the operations for that specific input

**Limitation**: Provides minimal practical value since algorithms rarely encounter best-case inputs. This analysis is often considered misleading.

**Example**: Linear search for first element in array of size $n$ has best-case complexity $O(1)$.

### 3.4 Comparative Summary

| Analysis Type | Purpose | Frequency | Usefulness |
|---------------|---------|-----------|-----------|
| **Worst-Case** | Guaranteed upper bound | Very Common | High - ensures performance |
| **Average-Case** | Expected typical performance | Sometimes | Medium - practical but complex |
| **Best-Case** | Theoretical lower bound | Rarely | Low - misleading in practice |

---

## 4. Recurrence Relations

### 4.1 Introduction to Recurrence Relations

A **recurrence relation** is an equation that expresses the time complexity of a program in terms of the complexity of smaller inputs. They are particularly useful for analyzing recursive algorithms.

**General Form**:
$$T(n) = aT(n/b) + f(n)$$

where:
- $T(n)$ = time complexity for input size $n$
- $a$ = number of recursive calls
- $n/b$ = size of each subproblem
- $f(n)$ = time spent on non-recursive operations (divide and combine)

### 4.2 Methods to Solve Recurrence Relations

#### 4.2.1 Substitution Method

**Approach**: Guess the solution form and verify it by substitution.

**Example 1**: Solve $T(n) = T(n-1) + 1$ with $T(1) = 1$

```
T(n) = T(n-1) + 1
     = (T(n-2) + 1) + 1 = T(n-2) + 2
     = (T(n-3) + 1) + 2 = T(n-3) + 3
     = T(n-k) + k
     
When n-k = 1, k = n-1:
T(n) = T(1) + (n-1) = 1 + n - 1 = n
```

**Result**: $T(n) = \Theta(n)$

**Example 2**: Solve $T(n) = 2T(n/2) + n$ with $T(1) = 1$

Guess: $T(n) = n \log_2 n$

Verify:
```
T(n) = 2T(n/2) + n
     = 2((n/2) log(n/2)) + n
     = n(log n - log 2) + n
     = n log n - n + n
     = n log n ✓
```

**Result**: $T(n) = \Theta(n \log n)$

#### 4.2.2 Recurrence Tree Method

**Approach**: Expand the recurrence relation into a tree where each level represents a function call.

**Example**: Solve $T(n) = 2T(n/2) + n$

```
                    n                    ← Level 0: cost = n
                   / \
                 n/2   n/2               ← Level 1: cost = n/2 + n/2 = n
                / \   / \
              n/4 n/4 n/4 n/4            ← Level 2: cost = 4(n/4) = n
              ...                         
                    leaf nodes            ← Level log₂n: cost = n (n leaves of T(1))

Total cost = n × (log₂n + 1) = Θ(n log n)
```

**Steps**:
1. Draw the recursion tree
2. Find cost at each level
3. Sum all levels

#### 4.2.3 Master Theorem

For recurrences of the form: $T(n) = aT(n/b) + f(n)$

**Case 1**: If $f(n) = O(n^{\log_b a - \epsilon})$ for some $\epsilon > 0$, then:
$$T(n) = \Theta(n^{\log_b a})$$

**Case 2**: If $f(n) = \Theta(n^{\log_b a} \log^k n)$, then:
$$T(n) = \Theta(n^{\log_b a} \log^{k+1} n)$$

**Case 3**: If $f(n) = \Omega(n^{\log_b a + \epsilon})$ for some $\epsilon > 0$, and if $af(n/b) \leq cf(n)$ for some $c < 1$ and large $n$, then:
$$T(n) = \Theta(f(n))$$

### 4.3 Examples with Calculations

#### Example 1: Linear Search
**Recurrence**: $T(n) = T(n-1) + 1$ with $T(1) = 1$

**Analysis**:
```
T(n) = T(n-1) + 1 = T(n-2) + 2 = ... = T(1) + (n-1) = n
```

**Result**: $T(n) = \Theta(n)$ — Linear time complexity

#### Example 2: Merge Sort
**Recurrence**: $T(n) = 2T(n/2) + n$ with $T(1) = 1$

**Using Master Theorem**:
- $a = 2$, $b = 2$, $f(n) = n$
- $\log_b a = \log_2 2 = 1$
- $f(n) = n = \Theta(n^1)$ → **Case 2** applies
- $k = 0$

$$T(n) = \Theta(n^1 \cdot \log^{0+1} n) = \Theta(n \log n)$$

#### Example 3: Binary Search
**Recurrence**: $T(n) = T(n/2) + 1$ with $T(1) = 1$

**Using Master Theorem**:
- $a = 1$, $b = 2$, $f(n) = 1$
- $\log_b a = \log_2 1 = 0$
- $f(n) = 1 = \Theta(n^0)$ → **Case 2** applies
- $k = 0$

$$T(n) = \Theta(n^0 \cdot \log^{0+1} n) = \Theta(\log n)$$

#### Example 4: Fibonacci (Naive Recursive)
**Recurrence**: $T(n) = T(n-1) + T(n-2) + 1$ with $T(1) = 1$

**Analysis** (using expansion):
```
T(n) ≈ 2T(n-1) (dominated term)
     = 2(2T(n-2)) = 4T(n-2)
     = 4(2T(n-3)) = 8T(n-3)
     = 2^k T(n-k)
     
When n-k = 1: k = n-1
T(n) = 2^(n-1) × T(1) = 2^(n-1)
```

**Result**: $T(n) = \Theta(2^n)$ — Exponential time (inefficient!)

#### Example 5: Nested Loops
**Code**:
```javascript
for (let i = 0; i < n; i++) {
    for (let j = 0; j < n; j++) {
        // Constant time operation
    }
}
```

**Recurrence**: $T(n) = nT(n-1) + n$ (complex!)

**Direct Counting**: Outer loop runs $n$ times, inner loop runs $n$ times → $n \times n = n^2$ operations

**Result**: $T(n) = \Theta(n^2)$

---

## 5. Summary and Best Practices

### 5.1 Key Takeaways

1. **Asymptotic Analysis** is fundamental to comparing algorithms objectively
2. **Big-O notation** is most commonly used for worst-case analysis
3. **Recurrence relations** elegantly express complexity of recursive algorithms
4. **Master Theorem** provides quick solutions for common recurrence patterns
5. **Worst-case analysis** is standard practice for algorithm evaluation

### 5.2 Quick Reference: Common Complexities

| Algorithm | Best Case | Average Case | Worst Case |
|-----------|-----------|--------------|-----------|
| **Linear Search** | $O(1)$ | $O(n)$ | $O(n)$ |
| **Binary Search** | $O(1)$ | $O(\log n)$ | $O(\log n)$ |
| **Bubble Sort** | $O(n)$ | $O(n^2)$ | $O(n^2)$ |
| **Merge Sort** | $O(n \log n)$ | $O(n \log n)$ | $O(n \log n)$ |
| **Quick Sort** | $O(n \log n)$ | $O(n \log n)$ | $O(n^2)$ |
| **Hash Table Insert** | $O(1)$ | $O(1)$ | $O(n)$ |

### 5.3 Guidelines for Algorithm Selection

- Use **simple algorithms** ($O(n)$ or $O(n \log n)$) for small datasets
- For **large datasets**, choose algorithms with better complexity even if overhead is higher
- Consider **space-time tradeoffs**: sometimes using extra memory reduces time
- **Profile actual performance** on your hardware and data before final decisions
