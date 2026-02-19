# Study Notes: Graphs

## What is a Graph?
A graph consists of a set of nodes or **vertices** ($V$) together with a set of **edges** ($E$) where each edge joins two vertices. The set $V$ is a finite and non-empty set of vertices. Set $E$ is a set of pairs of vertices representing edges.

- $G = (V, E)$
- $V(G)$ = vertices of the graph $G$
- $E(G)$ = edges of the graph $G$

---

## Types of Graphs

### 1. Undirected Graph
A graph containing unordered pairs of vertices is called an **undirected graph**. Here, the pair of vertices $(A, B)$ and $(B, A)$ means the same edge.

- Example:
  - $V = \{0, 1, 2, 3, 4\}$
  - $E = \{(0,1), (1,2), (0,2), (0,3), (3,4)\}$

### 2. Directed Graph
A graph containing ordered pairs of vertices is called a **directed graph**. An edge $(V_1, V_2)$ is read as an edge from $V_1$ to $V_2$. $(V_1, V_2)$ and $(V_2, V_1)$ are different.

- Example:
  - $V = \{0, 1, 2, 3, 4, 5\}$
  - $E = \{(1,0), (1,4), (0,2), (5,1), (4,5), (2,4), (3,4), (0,3)\}$

### 3. Complete Graph
An undirected graph in which every vertex has an edge to all other vertices is called a **complete graph**. A complete graph with $N$ vertices has $N(N-1)/2$ edges.

### 4. Weighted Graph
In these types of graphs, edges are assigned values (weights or costs). It denotes the distance or cost between two vertices and is used in real scenarios like maps.

### 5. Connected Graph
A graph is **connected** if there exists a path between every pair of vertices $V_i$ and $V_j$.

### 6. Subgraph
A **subgraph** of $G$ is a graph $G_1$ such that $V(G_1)$ is a subset of $V(G)$ and $E(G_1)$ is a subset of $E(G)$.

### 7. Multigraph
A graph with multiple occurrences of the same edge is called a **multigraph**.

---

## Graph Terminology

- **Path:** A path from vertex $V_0$ to $V_n$ is a sequence of vertices $V_0, V_1, V_2, ..., V_n$. The length of the path is the number of edges on the path. A path with $n$ vertices has length $n-1$.
- **Cycle:** A simple path that begins and ends with the same vertex is called a **cycle**.
- **Degree of a Vertex:** The total number of edges linked to a vertex is its **degree**.
  - **Indegree:** Number of edges coming to a node.
  - **Outdegree:** Number of edges going out from a node.
- **Source:** A vertex with only outgoing edges and no incoming edges.
- **Sink:** A vertex with only incoming edges and no outgoing edges.
- **Pendant:** A vertex with indegree $= 1$ and outdegree $= 0$.
- **Isolated Vertex:** A vertex with degree $= 0$.
- **Self Edge / Self Loop:** An edge of the form $(V, V)$.
- **Spanning Tree:** A subgraph of $G$ having all vertices of $G$ and no cycle. If $G$ is not connected, there is no spanning tree. A graph may have multiple spanning trees.
- **Minimal Spanning Tree:** Among all spanning trees, the one with the minimum sum of edge weights is called the **minimal spanning tree**.

---

## Representation of Graphs

### 1. Adjacency Matrix
For a graph with $|V|$ vertices, an **adjacency matrix** is a $|V| \times |V|$ matrix of 0s and 1s, where the entry in row $i$ and column $j$ is 1 if and only if the edge $(i, j)$ is in the graph. For weighted graphs, the entry can be the weight, and a special value (e.g., null) can indicate an absent edge.

### 2. Adjacency List
Representing a graph with **adjacency lists** combines adjacency matrices with edge lists. For each vertex $i$, store an array of the vertices adjacent to it. Typically, we have an array of $|V|$ adjacency lists, one per vertex.

---

## Traversal of Graphs
Traversal means visiting each node, and each node should be visited only once.

There are two main techniques for graph traversal:

### 1. Depth First Search (DFS)
DFS is a recursive algorithm that uses backtracking. It involves exhaustive searches of all nodes by going ahead if possible, else by backtracking. When moving forward and there are no more nodes along the current path, you move backwards to find nodes to traverse. All nodes will be visited on the current path until all unvisited nodes have been traversed, after which the next path is selected.

### 2. Breadth First Search (BFS)
BFS visits nodes level by level, starting from a source node and visiting all its neighbors before moving to the next level.

---
