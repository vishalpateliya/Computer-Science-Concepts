# Greedy Programming

## Table of Contents
1. [Introduction](#introduction)
2. [Key Characteristics](#key-characteristics)
3. [Components](#components)
4. [Designing a Greedy Algorithm](#designing-a-greedy-algorithm)
5. [Advantages and Disadvantages](#advantages-and-disadvantages)
6. [Classic Examples](#classic-examples)
7. [Advanced Topics](#advanced-topics)
8. [Conclusion](#conclusion)

---

## 1. Introduction

A **Greedy Algorithm** is an algorithmic strategy that makes the locally optimal choice at each stage with the hope of finding a globally optimal solution. In simpler terms, at every step, it picks the option that seems best at that moment without considering the long-term consequences or future possibilities. This approach is often used for optimization problems, where the goal is to find the maximum or minimum result.

### Analogy

Imagine you're trying to make change for a certain amount using the fewest possible coins. A greedy approach would be to always pick the largest denomination coin that is less than or equal to the remaining amount. 

**Example:** To make change for 36 cents with coins {1, 5, 10, 20}:
- Pick a 20-cent coin → remaining: 16 cents
- Pick a 10-cent coin → remaining: 6 cents
- Pick a 5-cent coin → remaining: 1 cent
- Pick a 1-cent coin → remaining: 0 cents

This strategy works for many common currency systems.

---

## 2. Key Characteristics

For a problem to be effectively solved by a greedy algorithm, it typically exhibits the following core properties:

### 2.1 Greedy Choice Property

This property states that a globally optimal solution can be achieved by making a locally optimal (greedy) choice at each step. Once a choice is made, it is not reconsidered. This means that the best immediate option will ultimately lead to the best overall solution.

### 2.2 Optimal Substructure

A problem exhibits optimal substructure if an optimal solution to the problem contains optimal solutions to its subproblems. This allows the problem to be broken down into smaller, independent subproblems. The optimal solution to the original problem can be constructed by combining the optimal solutions to these subproblems.

### 2.3 No Backtracking (Irrevocable Decisions)

Greedy algorithms are **"short-sighted"** and **"non-recoverable"**. Decisions are final and cannot be changed or undone once made. This can be a significant limitation, as a locally optimal choice might not always lead to a globally optimal solution.

---

## 3. Components

A typical greedy algorithm comprises the following key components:

- **Candidate Set:** A collection of all possible items or choices from which the solution is built.
- **Selection Function:** Determines which candidate is the "best" to add to the solution at the current step, based on some criteria.
- **Feasibility Function:** Checks if a selected candidate can be included in the current solution without violating any constraints.
- **Objective Function:** Evaluates the quality or value of the current (partial or complete) solution.
- **Solution Function:** Determines if a complete solution has been reached.

---

## 4. Designing a Greedy Algorithm

Designing a greedy algorithm involves a systematic approach:

1. **Identify the Optimal Substructure:** Break down the problem into smaller subproblems.
2. **Determine Solution Components:** Define what the solution will include (e.g., largest sum, shortest path).
3. **Establish a Greedy Choice:** Find a criterion for making the best local choice at each step.
4. **Iterative Process:** Create an iterative process to build the optimal solution by repeatedly making greedy choices.
5. **Prove Correctness (Crucial!):** Demonstrate that the greedy choices indeed lead to a global optimum. (See Advanced Topics for more details)

---

## 5. Advantages and Disadvantages

### 5.1 Advantages

- **Simplicity and Ease of Implementation:** Greedy algorithms are often straightforward to understand and implement, requiring fewer lines of code.
- **Efficiency:** They are typically fast and efficient in terms of time complexity (often O(n) or O(n log n)), making them suitable for large-scale problems.
- **Memory Efficiency:** They generally require less memory as they don't store all possible solutions or states.
- **Quick Solutions:** For problems where they work, they provide solutions quickly.

### 5.2 Disadvantages

- **Not Always Optimal:** The most significant drawback is that a greedy algorithm does not always guarantee a globally optimal solution. It can get stuck in a local optimum.
- **Lack of Backtracking:** Once a choice is made, it cannot be undone, potentially missing better solutions.
- **Sensitivity to Input Order:** The order of input data can sometimes affect the solution generated.
- **Difficult to Prove Optimality:** Proving that a greedy algorithm is correct can be challenging and requires careful analysis.

---

## 6. Classic Examples

Let's explore some well-known problems where greedy algorithms are applied:

### 6.1 Activity Selection Problem

**Problem:** Given a set of activities, each with a start time and a finish time, select the maximum number of non-overlapping activities that can be performed by a single resource.

**Greedy Strategy:** 
1. Sort the activities by their finish times in non-decreasing order
2. Select the first activity
3. Iteratively select the next activity whose start time is greater than or equal to the finish time of the previously selected activity

**Why it works:** By choosing the activity that finishes earliest, you leave the maximum amount of time available for subsequent activities, thus maximizing the total number of activities.

### 6.2 Fractional Knapsack Problem

**Problem:** Given a set of items, each with a weight and a value, and a knapsack with a maximum capacity, determine the items to include in the knapsack to maximize the total value. You can take fractions of items.

**Greedy Strategy:**
1. Calculate the value-to-weight ratio (value/weight) for each item
2. Sort the items in descending order based on this ratio
3. Add items to the knapsack starting with the highest ratio until the knapsack is full
4. If an item doesn't fully fit, take a fraction of it

**Why it works:** By prioritizing items that give the most value per unit of weight, you ensure that the knapsack is filled with the most "dense" value, leading to the optimal solution.

### 6.3 Huffman Coding

**Problem:** Given a set of characters and their frequencies, construct a binary tree (Huffman tree) to assign variable-length binary codes to each character such that the total length of the encoded message is minimized.

**Greedy Strategy:** 
1. Repeatedly combine the two nodes with the smallest frequencies into a new parent node
2. Continue until only one node (the root) remains
3. The new node's frequency is the sum of its children's frequencies

**Why it works:** This greedy choice ensures that characters with higher frequencies get shorter codes, and less frequent characters get longer codes, leading to optimal data compression.

### 6.4 Minimum Spanning Tree (MST) Algorithms

An MST is a subset of the edges of a connected, edge-weighted undirected graph that connects all the vertices with the minimum possible total edge weight, without forming any cycles.

#### Prim's Algorithm

**Greedy Strategy:** 
- Starts with an arbitrary vertex and grows the MST by iteratively adding the cheapest edge that connects a vertex in the current tree to a vertex outside the tree.

**Why it works:** At each step, it makes a locally optimal choice by adding the minimum-weight edge. This local choice contributes to the global optimum due to the "cut property" of MSTs.

#### Kruskal's Algorithm

**Greedy Strategy:** 
1. Sort all edges in the graph by weight in non-decreasing order
2. Add edges one by one to the MST if adding the edge does not form a cycle with already selected edges

**Why it works:** By always picking the smallest available edge that doesn't create a cycle, it ensures that the total weight of the spanning tree is minimized.

### 6.5 Dijkstra's Algorithm

**Problem:** Find the shortest paths from a single source node to all other nodes in a weighted graph with non-negative edge weights.

**Greedy Strategy:** 
- At each step, select the unvisited vertex with the smallest known distance from the source and update the distances of its neighbors.

**Why it works:** Dijkstra's algorithm makes locally optimal choices by always extending the shortest path found so far, which leads to the globally shortest paths in graphs with non-negative edge weights.

### 6.6 Coin Change Problem

**Problem:** Given a set of coin denominations and an amount, find the minimum number of coins to make up that amount.

**Greedy Strategy:** Always choose the largest denomination coin that is less than or equal to the remaining amount.

**When it works:** For standard currency systems (e.g., 1, 5, 10, 25 cents), this greedy approach yields the optimal solution.

**When it fails:** For some arbitrary coin systems (e.g., {1, 7, 10} and target 15):
- Greedy approach: 10 + 1 + 1 + 1 + 1 + 1 = **6 coins**
- Optimal solution: 7 + 7 + 1 = **3 coins**

This highlights that the greedy choice property doesn't hold for all problems.

---

## 7. Advanced Topics

### 7.1 Proof of Correctness for Greedy Algorithms

Proving the correctness of a greedy algorithm is often the most challenging part. It involves demonstrating that the sequence of locally optimal choices indeed leads to a globally optimal solution.

Two common techniques for proving correctness are:

#### Exchange Argument (Exchange Lemma)

1. Assume there exists an optimal solution O that is different from the greedy solution G.
2. Identify the first point where O and G differ.
3. Show that by "exchanging" the choice made by O at that point with the greedy choice, you can transform O into a new optimal solution O' that is "closer" to G without degrading its quality.
4. By induction, conclude that there must exist an optimal solution identical to the greedy solution.

#### Greedy Stays Ahead

1. Define a measure of "progress" or "quality" for partial solutions.
2. Inductively prove that at each step, the partial solution generated by the greedy algorithm is "ahead" of (or at least as good as) the partial solution generated by any other optimal algorithm, according to this measure.
3. Conclude that the final greedy solution must also be optimal.

#### Key Aspects to Prove

Regardless of the method used, you must prove two main aspects:

- **Feasibility:** The algorithm produces a valid solution that satisfies all constraints.
- **Optimality:** The algorithm produces the best possible solution (maximum or minimum).

### 7.2 Greedy Algorithms vs. Dynamic Programming

Both greedy algorithms and Dynamic Programming (DP) are optimization techniques that rely on optimal substructure. However, they differ significantly:

| Aspect | Greedy Algorithm | Dynamic Programming |
|--------|------------------|---------------------|
| **Approach** | Makes locally optimal choices at each step | Considers all possible choices and stores results |
| **Backtracking** | No backtracking; decisions are final | Can reconsider previous decisions |
| **Time Complexity** | Generally faster (O(n) or O(n log n)) | Slower due to overlapping subproblems (O(n²) or more) |
| **Space Complexity** | Lower (only stores current state) | Higher (stores results of all subproblems) |
| **Guarantees Optimality** | Not always; fails on some problems | Yes, if optimal substructure exists |
| **When to Use** | When greedy choice property holds | When problem requires considering all options |
| **Examples** | Activity Selection, Huffman Coding, Dijkstra | Knapsack (0/1), Longest Common Subsequence, Edit Distance |

### 7.3 When to Choose Greedy

- The problem exhibits the **Greedy Choice Property**
- The problem has **Optimal Substructure**
- A proof or strong evidence exists that the greedy approach yields the optimal solution
- Efficiency is critical and DP is too slow

---

## 8. Conclusion

Greedy algorithms, while simple and efficient, are a nuanced topic in algorithm design. They offer quick solutions and are easy to implement, making them a go-to choice for many problems. However, their "short-sighted" nature means they don't always guarantee the globally optimal solution.

**Key Takeaways:**

- Understanding the **Greedy Choice Property** and **Optimal Substructure** is crucial for identifying problems where a greedy approach might succeed.
- For problems where optimality is not guaranteed, or when complex dependencies exist, other paradigms like **Dynamic Programming** might be more appropriate.
- The theoretical foundation of **Matroids** provides a beautiful insight into the conditions under which greedy algorithms are provably optimal.
- Always prove correctness before assuming a greedy solution is optimal for your problem.
