# Dynamic Programming

## Table of Contents
1. [Introduction](#introduction)
2. [Key Concepts](#key-concepts)
3. [Designing a DP Solution](#designing-a-dp-solution)
4. [Advanced Topics](#advanced-topics)
5. [Common DP Patterns](#common-dp-patterns)
6. [When NOT to Use DP](#when-not-to-use-dp)

---

## Introduction

### What is Dynamic Programming?

Dynamic Programming (DP) is an algorithmic technique for solving complex problems by breaking them down into simpler subproblems. It's primarily used when:
- The problem exhibits **overlapping subproblems** (the same subproblems are solved multiple times)
- The problem has **optimal substructure** (an optimal solution is built from optimal solutions to subproblems)

Unlike Divide and Conquer, where subproblems are typically independent, DP deals with overlapping subproblems and reuses computed solutions.

### Core Principles

The essence of DP lies in three key ideas:

1. **Solve each subproblem only once** - Rather than recomputing the same subproblem repeatedly
2. **Store solutions** (memoization or tabulation) - Avoid recomputing values by storing them in a cache or table
3. **Build up the solution** - Construct the solution to the larger problem from solutions of its subproblems

---

## Key Concepts

### 1. Optimal Substructure

A problem exhibits optimal substructure when an optimal solution to the problem contains optimal solutions to its subproblems. In other words, if we optimally solve overlapping subproblems and combine them, we get an optimal solution to the original problem.

**Example:**  
In the shortest path problem, if P is the shortest path from vertex u to vertex v, and w is an intermediate vertex on P, then the segment of P from u to w must also be the shortest path from u to w.

### 2. Overlapping Subproblems

This property occurs when a recursive algorithm solves the same subproblems repeatedly. Without identifying and reusing these solutions, the time complexity becomes exponential.

**Example:**  
The recursive Fibonacci sequence: F(n) = F(n-1) + F(n-2)
- Computing F(5) requires computing F(4) and F(3)
- Computing F(4) also requires computing F(3)
- F(3) is calculated multiple times unnecessarily

### 3. Memoization (Top-Down Approach)

Memoization is a recursive approach where the results of function calls are cached (stored) so that subsequent calls with the same arguments return the cached result without recomputation.

**Process:**
1. Define a recursive function for solving the problem
2. Initialize a cache (usually an array or dictionary) with sentinel values (like -1 or null) to mark uncomputed states
3. At the start of each function call, check if the result is in the cache
4. If yes, return the cached value immediately
5. If no, compute the result, store it in the cache, then return it

**Advantage:** Natural, intuitive recursive structure  
**Disadvantage:** Recursion overhead may lead to stack overflow for large inputs

### 4. Tabulation (Bottom-Up Approach)

Tabulation is an iterative approach where the DP table is filled from base cases upward to the desired solution. This avoids recursion overhead.

**Process:**
1. Initialize a DP table based on the problem's state definition
2. Fill in the base cases of the DP table
3. Iterate through the table, computing each state's value based on previously computed (smaller) states
4. The final answer will be stored in a specific cell(s) of the DP table

**Advantage:** Iterative approach avoids recursion overhead and is more efficient in practice  
**Disadvantage:** Requires careful ordering of computation to ensure all dependencies are computed first

---

## Designing a DP Solution

### Step 1: Characterize the Structure of an Optimal Solution

Analyze how an optimal solution relates to optimal solutions of its subproblems. This step identifies whether the problem has optimal substructure.

**Questions to ask:**
- Can the problem be broken into smaller subproblems?
- Do optimal solutions to subproblems lead to an optimal solution for the whole problem?

### Step 2: Define the State and Recurrence Relation

This is the critical step where you formulate the DP state and express how to compute it from smaller states.

**Define:**
- What does `dp[i]` or `dp[i][j]` represent? What information does this state capture?
- How does the current state depend on previous states?

**Example State Definitions:**
- **Longest Increasing Subsequence (LIS):** `dp[i]` = length of the longest increasing subsequence ending at index i
- **0/1 Knapsack:** `dp[i][w]` = maximum value obtainable using items 0 to i-1 with capacity w
- **Coin Change:** `dp[i]` = minimum number of coins needed to make amount i

### Step 3: Compute the Value of an Optimal Solution

Choose between memoization (top-down) or tabulation (bottom-up):
- **Memoization:** Best for problems where most states may not be needed or exploring states sparsely
- **Tabulation:** Best when all states need to be computed, avoiding recursion overhead

For tabulation, determine the order in which to fill the DP table to ensure all required subproblems are solved before they are needed.

### Step 4: Construct an Optimal Solution (Optional)

Often, we only need the optimal value. However, sometimes we need the actual sequence of choices that led to it.

**Approaches:**
- **Backtracking:** Reconstruct the solution by traversing back through the DP table
- **Parent Pointers:** Store links to the choices made during DP computation

---

## Advanced Topics

### 1. State Definition

Defining the state is often the most challenging and critical aspect of DP. A well-defined state must:
- Capture all necessary information needed to solve the subproblem independently
- Be minimal (avoid redundant information)
- Lead to a clear recurrence relation

**Example:**
- In the longest increasing subsequence problem, `dp[i]` alone isn't enough if you need to construct the sequence—you may also need to track the previous element
- In grid path problems, `dp[i][j]` must capture the position, but may also need to capture direction or constraints

### 2. Space Optimization

Many DP problems can have their space complexity significantly reduced by observing that the current state depends on only a limited number of previous states.

**Examples of Space Optimization:**

- **1D to Constant Space:**
  - Fibonacci: Reduce from O(n) to O(1) by only keeping the last two values
  
- **2D to 1D:**
  - In Longest Common Subsequence (LCS), `dp[i][j]` depends on `dp[i-1][j]`, `dp[i][j-1]`, and `dp[i-1][j-1]`
  - Only keep the current and previous rows: O(n × m) → O(min(n, m))

**Key Insight:** Identify dependency patterns and keep only necessary previous states in memory.

### 3. Digit DP

Digit DP is used for counting problems where you need to count integers in a range [L, R] that satisfy certain properties (sum of digits, divisibility, pattern matching, etc.).

**Typical State:** `solve(idx, tight, is_started, ...)`
- **idx:** Current digit position being considered (from most significant to least significant)
- **tight:** Boolean flag indicating if we are still bounded by the digits of the upper limit
- **is_started:** Boolean flag to handle leading zeros (important for counting valid numbers)
- **...:** Additional parameters tracking properties like digit sum, divisibility, parity, etc.

**Process:**
1. Recursively build numbers digit by digit
2. Track whether we're still restricted by the upper bound (tight constraint)
3. Memoize states to avoid recomputation

**Example Problem:**
Count numbers in range [A, B] where the sum of digits equals S.

### 4. Bitmask DP

Bitmask DP uses a bitmask to represent a set or state in the DP. Useful for subset-related problems or when the state involves choosing from a small set of items.

**Common Uses:**
- Traveling Salesman Problem (TSP) - `dp[mask][i]` = minimum cost to visit all cities in the bitmask, ending at city i
- Subset sum variations
- Assignment problems

### 5. DP on Trees

Applying DP principles to tree structures. The state usually depends on the subtree rooted at the current node.

**Process:**
- Usually involves **post-order traversal (DFS)** where a node's DP value is computed after its children's values are computed
- Common state: `dp[node][state]` where state might represent properties like "child is included" or "is colored"

**Common Problems:**
- Maximum weight independent set on a tree
- Tree diameter
- Minimum vertex cover
- Maximum profitability on a tree structure

**Example:** For maximum independent set: `dp[node][0]` = max value if node is NOT included, `dp[node][1]` = max value if node IS included.

### 6. DP on Graphs (DAG)

Dynamic programming can be applied to Directed Acyclic Graphs (DAGs) where the topological order is used for computation.

**Key Idea:** Process nodes in topological order to ensure all dependencies are computed before use.

**Common Problems:**
- Longest path in a DAG
- Shortest path in a DAG with negative weights
- Counting paths with specific properties

---

## Common DP Patterns

### Pattern 1: Linear DP (1D)
**State:** `dp[i]` depends on `dp[i-1]`, `dp[i-2]`, etc.
- Fibonacci
- House Robber
- Climbing Stairs
- Longest Increasing Subsequence

### Pattern 2: 2D DP (Range & Capacity)
**State:** `dp[i][j]` where i and j represent ranges or dimensions
- 0/1 Knapsack
- Longest Common Subsequence
- Edit Distance
- Matrix Chain Multiplication

### Pattern 3: 2D DP (Grid)
**State:** `dp[i][j]` where i and j are row and column in a grid
- Unique Paths
- Minimum Path Sum
- Dungeon Game

### Pattern 4: Sequence/String DP
**State:** `dp[i][j]` where i and j represent positions in sequences
- Longest Common Subsequence
- Edit Distance
- Regular Expression Matching
- Wildcard Matching

---

## When NOT to Use Dynamic Programming

While powerful, DP isn't a universal solution:

### 1. No Overlapping Subproblems
If subproblems are completely distinct and never repeat, DP provides no benefit. A simple Divide and Conquer approach (like Merge Sort) is more suitable.

### 2. No Optimal Substructure
If an optimal solution to the problem does NOT necessarily contain optimal solutions to its subproblems, DP won't work. Consider:
- **Greedy algorithms** instead (e.g., activity selection, Huffman coding)
- **Graph algorithms** for shortest/longest paths
- **Backtracking** for constraint satisfaction

### 3. Problem Constraints Make DP Infeasible
- **State space too large:** If the number of states is exponential (e.g., n > 50 for 2^n states) or the DP table is too large (e.g., O(n²) or O(n × w) is prohibitive in terms of memory)
- **Time limits:** Even with memoization, if the time complexity remains too high
- **Memory limits:** For systems with limited RAM, large DP tables may be infeasible

### 4. Better Alternatives Exist
- **Mathematical closed-form solution:** Some problems have direct formulas (e.g., Fibonacci can be solved using matrix exponentiation or closed-form formula)
- **Greedy algorithm:** Works and is faster if the problem has optimal greedy choice property
- **Other advanced techniques:** Branch and bound, constraint programming, etc.

---

## Summary

Dynamic Programming is a powerful technique when:
- ✓ The problem has **optimal substructure**
- ✓ The problem exhibits **overlapping subproblems**
- ✓ The **state space is manageable** (not exponentially large)

Choose DP when you can define the state clearly, formulate a recurrence relation, and the problem benefits from memoization or tabulation approaches.
