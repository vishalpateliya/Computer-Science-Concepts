# 🌳 Study Notes: Tree Data Structure

---

## 1. What is a Tree?

A **tree** is a non-linear data structure consisting of a collection of elements called **nodes**. One node is distinguished as the **root** ($r$). Trees have a hierarchical structure defined by parent-child relationships. The root can have zero or more non-empty subtrees, the roots of which are connected by a directed edge from $r$.

---

## 2. Properties of Trees

1. **Acyclic:** Trees do not contain cycles. There is exactly one path between any two nodes.
2. **Connected:** All nodes are connected; there exists a path from the root to every other node.
3. **Levels:** The level of a node is the number of edges from the root to that node. The root is at **Level 0**.
4. **Height:** The height of a tree is the maximum level of any node. It represents the longest path from the root to a leaf.
5. **Leaf Node:** A node with no children is called a leaf or terminal node.
6. **Internal Node:** A node with at least one child.
7. **Edge:** An edge is a connection between two nodes. If a tree has $n$ nodes, it has exactly $n-1$ edges.

---

## 3. Basic Terminology

| Term         | Definition                                                |
|--------------|-----------------------------------------------------------|
| **Root**     | The topmost node in the tree. It has no parent.           |
| **Parent**   | The immediate predecessor of a node.                      |
| **Child**    | The immediate successor of a node.                        |
| **Siblings** | Nodes that share the same parent.                         |
| **Path**     | The sequence of consecutive edges from a source node to a destination node. |
| **Degree**   | The number of subtrees (children) a node has.             |
| **Ancestor** | Any node lying on the path from the root to a specific node. |
| **Descendant** | Any node in the subtree rooted at a specific node.      |
| **Subtree**  | A tree formed by a node and all its descendants.          |

---

## 4. Binary Tree

A **Binary Tree** is a specific type of tree where every node has **at most two children**, referred to as the **left child** and the **right child**.

### Representation in C

A node in a binary tree is typically represented by a structure containing a data part and two pointers:

```c
typedef struct node {
    int data;
    struct node *left;   // Pointer to left child
    struct node *right;  // Pointer to right child
} node;
```

#### Storage Methods

- **Array Representation:** Efficient for complete binary trees (e.g., Heaps).
  - Index mapping: Left child at $2i + 1$, Right child at $2i + 2$, Parent at $\lfloor (i-1)/2 \rfloor$
  - Space efficient for nearly complete trees
  - **Disadvantage:** Wastes space for skewed trees

- **Linked List Representation:** Most common; uses pointers to connect nodes.
  - **Advantage:** Flexible structure, no wasted space
  - **Disadvantage:** Extra memory for pointers

---

## 5. Types of Binary Trees

Binary trees are classified based on their structure and node arrangement:

### A. Full Binary Tree
A binary tree is **Full (Strict)** if every node has either 0 or 2 children. No node has exactly one child.

> **Constraint:** Number of leaf nodes = Number of internal nodes + 1.

**Example Use Cases:** Huffman Coding, Arithmetic expression trees

**Properties:**
- If $n$ internal nodes, then $n + 1$ leaf nodes
- Total nodes: $2n + 1$

### B. Complete Binary Tree
A binary tree is **Complete** if all levels are completely filled, except possibly the last level, and the last level has all nodes as far left as possible.

> **Usage:** Basis for Heap data structures (Min-Heap, Max-Heap)  
> **Storage:** Very efficient in array representation

**Properties:**
- Perfect for array representation
- Height: $\lceil \log_2(n) \rceil$
- All leaves are at level $h$ or $h-1$

### C. Perfect Binary Tree
A binary tree is **Perfect** if all internal nodes have two children and all leaves are at the same level.

- **Nodes:** $2^{h+1} - 1$
- **Leaves:** $2^h$

### D. Balanced Binary Tree
A binary tree is **Balanced** if the height of the left and right subtrees of every node differ by at most one.

> **Efficiency:** $O(\log n)$ for search, insert, delete

### E. Degenerate (Skewed) Binary Tree
A binary tree is **Degenerate** if every parent node has only one child. It behaves like a linked list.

> **Efficiency:** Worst-case operations take $O(n)$

---

## 6. Mathematical Properties of Binary Trees

For a binary tree with height $h$ (starting at 0) and $n$ nodes:

- **Max nodes at level $l$:** $2^l$
- **Max nodes in tree of height $h$:** $2^{h+1} - 1$
- **Min height for $n$ nodes:** $\lceil \log_2(n+1) - 1 \rceil$
- **Min nodes for height $h$:** $h + 1$

---

## 7. General Tree

A **General Tree** imposes no limit on the number of children a node can have.

**Linked Representation (Left-Child, Right-Sibling):**

```c
typedef struct tnode {
    int data;
    struct tnode *firstchild;   // Pointer to the first child
    struct tnode *nextsibling;  // Pointer to the next sibling
} tnode;
```

---

## 8. Tree Traversal

Traversal is the process of visiting every node in the tree exactly once.

**Time Complexity:** $O(n)$ for all traversals (visit each node once)  
**Space Complexity:** $O(h)$ where $h$ is height (recursive call stack)

### A. Depth-First Traversals (DFS)

Using the convention: Root (D), Left (L), Right (R).

**General Characteristics:**
- Uses recursion or explicit stack
- Memory usage depends on tree height
- Better for finding paths and cycles

#### Inorder Traversal (L-D-R)
Left → Root → Right

```c
inorder(root->left);
display(root->data);
inorder(root->right);
```

#### Preorder Traversal (D-L-R)
Root → Left → Right

```c
display(root->data);
preorder(root->left);
preorder(root->right);
```

#### Postorder Traversal (L-R-D)
Left → Right → Root

```c
postorder(root->left);
postorder(root->right);
display(root->data);
```

### B. Breadth-First Traversal (Level Order) - BFS

Visits nodes level by level from left to right. Requires a queue.

**Characteristics:**
- **Time Complexity:** $O(n)$
- **Space Complexity:** $O(w)$ where $w$ is max width of tree
- Better for level-wise processing
- Used in: Shortest path, level-order printing

```c
void levelOrder(node *root) {
    if (!root) return;

    queue<node*> q;
    q.push(root);

    while (!q.empty()) {
        node *curr = q.front(); 
        q.pop();

        display(curr->data);

        if (curr->left) q.push(curr->left);
        if (curr->right) q.push(curr->right);
    }
}
```

---

## 9. Special Tree Variants & Applications

### Special Trees

| Tree Type | Search | Insert/Update | Delete | Use Case |
|-----------|-----------|--------------|-----------|----------|
| **BST** | $O(\log n)$ avg, $O(n)$ worst | $O(\log n)$ avg | $O(\log n)$ avg | General purpose, simple implementation |
| **AVL Tree** | $O(\log n)$ | $O(\log n)$ | $O(\log n)$ | Guaranteed strict balancing |
| **Red-Black Tree** | $O(\log n)$ | $O(\log n)$ | $O(\log n)$ | Flexible balancing, Java/C++ maps |
| **B-Tree** | $O(\log n)$ | $O(\log n)$ | $O(\log n)$ | Databases, file systems |
| **Trie** | $O(m)$* | $O(m)$* | $O(m)$* | String retrieval, autocomplete |
| **Segment Tree** | $O(\log n)$ | $O(\log n)$ | $O(\log n)$ | Range queries, interval problems |

*$m$ = length of string (key length)*

**Tree Characteristics:**
- **Binary Search Tree (BST):** Left < Parent < Right. Simple but can become skewed.
- **AVL Tree:** Self-balancing BST with balance factor constraint ($|h_L - h_R| \leq 1$). Rotation on insert/delete.
- **Red-Black Tree:** Self-balancing using color rules. Less strict balance than AVL, faster insert/delete.
- **B-Tree:** Multi-way tree, optimized for disk I/O, maintains sorted order. [A B-tree is a self-balancing, m-way search tree data structure designed for efficient searching, insertion, and deletion of large datasets, commonly used in databases and file systems. Unlike binary trees, B-trees allow nodes to have multiple children and keys, reducing the tree's height, minimizing disk accesses, and keeping data sorted.]
- **Trie (Prefix Tree):** Each node represents a character, efficient for string operations.
- **Forest:** Collection of disjoint trees (represented by parent pointer for union-find).

### Real-world Applications

- **Hierarchical Data:** File systems, DOM, org charts, family trees
- **Searching & Sorting:** 
  - BSTs for efficient lookup and range queries
  - Heap for priority queues and heap sort
- **Databases:** B-Trees and B+ trees for indexing and efficient disk access
- **Compilers:** Abstract Syntax Trees (AST) for parsing and code generation
- **Networking:** 
  - Spanning trees for network routing
  - Trie for IP routing tables
- **AI/ML:** 
  - Decision trees for classification and regression
  - Game trees for minimax algorithms (Chess, Go)
- **Graphics:** Quadtree and Octree for spatial indexing
- **Compression:** Huffman trees for data compression
- **Autocomplete:** Trie for word prediction and search suggestions
- **Expression Evaluation:** Binary trees for arithmetic expressions

---

## 10. Important Theorems & Properties

### Key Formulas
- **Max height of a BST with $n$ nodes:** $n - 1$ (when skewed to a line)
- **Min height of a BST with $n$ nodes:** $\lfloor \log_2(n) \rfloor$
- **Total edges in a tree with $n$ nodes:** $n - 1$
- **Number of nodes at level $l$:** At most $2^l$
- **AVL Tree height for $n$ nodes:** $1.44 \log_2(n + 1)$ (approximately)

### Common Problems
- **Lowest Common Ancestor (LCA):** Finding common ancestor of two nodes
- **Diameter:** Longest path between any two nodes
- **Height:** Maximum distance from root to any leaf
- **Path Sum:** Sum of values from root to leaf
- **Serialization:** Converting tree to/from string representation
