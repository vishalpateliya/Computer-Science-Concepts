# Matrix: Concepts, Operations, and Applications

## Matrix Storage Order
Most programming languages (like C++, Java, Python) use **row-major order** by default for 2D arrays. Fortran uses **column-major order**.

---

## 3. Basic Matrix Operations
Let's review some fundamental operations and their complexities. Assume matrices are $m \times n$ and $p \times q$.

### 3.1. Matrix Addition and Subtraction
- **Condition:** Both matrices must have the same dimensions ($m \times n$).
- **Operation:** Add/subtract corresponding elements.
  - Addition: $C_{ij} = A_{ij} + B_{ij}$
  - Subtraction: $C_{ij} = A_{ij} - B_{ij}$
- **Time Complexity:** $O(m \times n)$ (visit each element once)
- **Space Complexity:** $O(m \times n)$ for the result matrix.

### 3.2. Scalar Multiplication
- **Operation:** Multiply every element of the matrix by a single scalar value.
  - $B_{ij} = c \cdot A_{ij}$
- **Time Complexity:** $O(m \times n)$
- **Space Complexity:** $O(m \times n)$ for the result matrix (or $O(1)$ if modifying in-place).

### 3.3. Matrix Transpose
- **Operation:** Swap rows and columns. The element $A_{ij}$ becomes $A_{ji}$ in the transposed matrix $A^T$. If $A$ is $m \times n$, then $A^T$ is $n \times m$.
- **Time Complexity:** $O(m \times n)$
- **Space Complexity:** $O(n \times m)$ for the result matrix. If transposing a square matrix in-place, $O(1)$ auxiliary space.

### 3.4. Matrix Multiplication (Standard)
- **Condition:** The number of columns in the first matrix ($A_{m \times n}$) must equal the number of rows in the second matrix ($B_{n \times p}$). The result $C$ will be an $m \times p$ matrix.
- **Operation:** Each element $C_{ij}$ is the dot product of the $i$-th row of $A$ and the $j$-th column of $B$:
  $$C_{ij} = \sum_{k=1}^{n} A_{ik} \cdot B_{kj}$$
- **Time Complexity:** $O(m \times n \times p)$. For square matrices of size $N \times N$, it's $O(N^3)$.
- **Space Complexity:** $O(m \times p)$ for the result matrix.

---

## 4. Special Matrix Types and Efficient Representations
For certain types of matrices, we can optimize storage and operations by exploiting their structure.

### 4.1. Sparse Matrix
- **Definition:** A matrix where most elements are zero. Storing all zeros explicitly is inefficient.
- **Efficient Representations:**
  1. **Triplet Representation (Array of Tuples):** Store only non-zero elements as (row, column, value) tuples.
     - Example: $[(0, 0, 5), (1, 2, 8), (2, 1, 3)]$ for a $3 \times 3$ matrix.
     - Space: $O($number of non-zero elements$)$
  2. **Compressed Sparse Row (CSR):**
     - Three arrays: values (non-zero elements), col_indices (column index for each value), row_pointers (index in values where each row starts).
     - Space: $O($number of non-zero elements$ + $number of rows$)$
  3. **Compressed Sparse Column (CSC):** Similar to CSR, but optimized for column-wise access.
     - Three arrays: values, row_indices, col_pointers.
     - Space: $O($number of non-zero elements$ + $number of columns$)$
- **Advantages:** Significant space savings for very sparse matrices.
- **Disadvantages:** Operations (addition, multiplication) become more complex and potentially slower than dense matrix operations if not carefully implemented.

### 4.2. Symmetric Matrix
- **Definition:** A square matrix where $A_{ij} = A_{ji}$ for all $i, j$. The matrix is equal to its transpose ($A = A^T$).
- **Efficient Storage:** Only store the upper (or lower) triangular part (including diagonal).
  - For an $N \times N$ matrix, this requires $N(N+1)/2$ elements instead of $N^2$.
  - Mapping: For $A[i][j]$ (assuming $i \leq j$ for upper triangular), a 1D array index can be calculated.
- **Advantages:** Halves storage space (approximately).

### 4.3. Diagonal Matrix
- **Definition:** A square matrix where all non-diagonal elements are zero ($A_{ij} = 0$ if $i \neq j$).
- **Efficient Storage:** Only store the $N$ diagonal elements in a 1D array.
- **Advantages:** Huge space savings (from $N^2$ to $N$). Operations like multiplication are also simplified.

### 4.4. Triangular Matrix (Upper and Lower)
- **Definition:**
  - **Upper Triangular:** All elements below the main diagonal are zero ($A_{ij} = 0$ if $i > j$).
  - **Lower Triangular:** All elements above the main diagonal are zero ($A_{ij} = 0$ if $i < j$).
- **Efficient Storage:** Store only the non-zero triangular part (including diagonal).
  - Requires $N(N+1)/2$ elements, similar to symmetric matrices.
- **Advantages:** Reduces storage by half.

### 4.5. Identity Matrix
- **Definition:** A square matrix where all diagonal elements are 1, and all other elements are 0.
- **Efficient Storage:** No storage needed, as its properties are known. Can be represented by its dimension $N$.
- **Advantages:** $O(1)$ space.

### 4.6. Band Matrix
- **Definition:** A sparse matrix whose non-zero elements are confined to a diagonal band, comprising the main diagonal and a number of diagonals above and below it.
- **Efficient Storage:** Store only the elements within the band.
- **Advantages:** Space savings proportional to the bandwidth.

---

## 5. Advanced Matrix Algorithms and Applications

### 5.1. Strassen's Matrix Multiplication
- **Problem:** Standard matrix multiplication is $O(N^3)$. Can we do better?
- **Concept:** A divide-and-conquer algorithm that recursively breaks down matrices into sub-matrices and performs 7 multiplications (instead of 8) and 18 additions (instead of 4) of sub-matrices.
- **Time Complexity:** $O(N^{\log_2 7}) \approx O(N^{2.807})$
- **Advantages:** Asymptotically faster than standard multiplication for large matrices.
- **Disadvantages:** Higher constant factors, more complex to implement, and not always faster for smaller matrices due to overhead.

### 5.2. Matrix Chain Multiplication (Dynamic Programming)
- **Problem:** Given a sequence of matrices $A_1, A_2, ..., A_n$, find the most efficient way to multiply them (i.e., minimize the total number of scalar multiplications). Matrix multiplication is associative, but not commutative.
- **Concept:** This is an optimization problem solved using dynamic programming. It determines the optimal parenthesization.
- **Time Complexity:** $O(N^3)$ where $N$ is the number of matrices.
- **Space Complexity:** $O(N^2)$ for storing intermediate results.

### 5.3. Matrix Exponentiation
- **Problem:** Calculate $A^k$ (matrix $A$ multiplied by itself $k$ times).
- **Concept:** Can be done efficiently using binary exponentiation (exponentiation by squaring).
  - If $k$ is even: $A^k = (A^{k/2})^2$
  - If $k$ is odd: $A^k = A \cdot (A^{(k-1)/2})^2$
- **Applications:**
  - Finding $N$-th Fibonacci number: Represent the recurrence relation as a matrix multiplication.
  - Counting paths in a graph: If $A$ is the adjacency matrix of a graph, $A_{ij}^k$ gives the number of paths of length $k$ from vertex $i$ to vertex $j$.
- **Time Complexity:** $O(N^3 \log k)$ for an $N \times N$ matrix.

### 5.4. Adjacency Matrix for Graph Representation
- **Concept:** For a graph with $V$ vertices, an adjacency matrix is a $V \times V$ matrix where $A_{ij} = 1$ if there's an edge from vertex $i$ to vertex $j$, and $0$ otherwise. For weighted graphs, $A_{ij}$ can store the weight.
- **Advantages:**
  - $O(1)$ time to check if an edge exists between two vertices.
  - Easy to implement.
  - Good for dense graphs (many edges).
- **Disadvantages:**
  - $O(V^2)$ space, even for sparse graphs (many zeros).
  - $O(V^2)$ to add/remove a vertex.
- **Alternative:** Adjacency List (better for sparse graphs).

### 5.5. Matrices in Image Processing
- **Concept:** Images are often represented as 2D or 3D matrices (height $\times$ width $\times$ color channels).
- **Operations:**
  - **Filtering/Convolution:** Applying a kernel (small matrix) to each pixel to achieve effects like blurring, sharpening, edge detection.
  - **Transformations:** Rotation, scaling, translation using transformation matrices.
- **Example:** A grayscale image can be a $H \times W$ matrix where each element is pixel intensity.

### 5.6. Matrices in Game Development (Transformations)
- **Concept:** 3D graphics heavily rely on matrices for transformations of objects in a scene.
- **Operations:**
  - **Translation:** Moving an object.
  - **Rotation:** Rotating an object around an axis.
  - **Scaling:** Resizing an object.
  - **Projection:** Projecting 3D objects onto a 2D screen.
- These transformations are typically represented by $4 \times 4$ matrices (using homogeneous coordinates) that are multiplied together to form a composite transformation.

### 5.7. Matrices in Machine Learning and Linear Algebra
- **Concept:** Matrices are the fundamental data structure for representing datasets, weights in neural networks, and performing linear transformations.
- **Operations:**
  - **Dot Products:** Core of neural network computations.
  - **Eigenvalue Decomposition, Singular Value Decomposition (SVD):** Used in dimensionality reduction (PCA), recommender systems.
  - **Matrix Inversion/Determinant:** Solving linear systems, least squares.
- **Libraries:** NumPy (Python), Eigen (C++), TensorFlow, PyTorch provide highly optimized matrix operations.

---

## 6. Determinant and Inverse
- **Determinant:** A scalar value that can be computed from the elements of a square matrix. It provides information about the matrix's properties (e.g., if it's invertible).
  - Computational complexity: $O(N^3)$ using Gaussian elimination, or $O(N!)$ using cofactor expansion (inefficient).
- **Inverse:** For a square matrix $A$, its inverse $A^{-1}$ is a matrix such that $A \cdot A^{-1} = A^{-1} \cdot A = I$ (identity matrix). An inverse exists only if the determinant is non-zero.
  - Computational complexity: $O(N^3)$ using Gaussian elimination.
- **Importance:** Crucial for solving systems of linear equations, finding unique solutions, and various transformations.

---
