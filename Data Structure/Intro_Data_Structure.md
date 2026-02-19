# Study Notes: Introduction to Data Structure

## Data Type
A **data type** refers to the kind of data that variables may hold in a programming language.
- Example: `int x;` — here, `x` can hold integer data.

## Abstract Data Types (ADT)
- Abstraction for primitive data types is provided by the compiler.
- For example, you can use the integer data type and the `+` operator without knowing their internal representation or how operations are performed. The meaning of `+` is defined by the compiler and hidden from the user — this is **abstraction**.
- For data types, the implementation details are hidden from the programmer.

## Data Structures
A **data structure** is an instance of an ADT (Abstract Data Type).
- Formally, an ADT or data structure is defined as a triplet $(D, F, A)$:
  - $D$ = Domain (the set of values)
  - $F$ = Set of operations
  - $A$ = Axioms (rules defining the functions)

### Types of Data Structures

#### 1. Primitive Data Structures
- Examples: Integers, reals, logical (boolean) data, character data, pointers, and references.
- Data objects of primitive data types can be operated upon by machine-level instructions.

#### 2. Non-Primitive Data Structures
- Derived from primitive data structures.
- A set of homogeneous or heterogeneous data elements stored together.
- Examples: Array, Structure, Union, etc.

#### 3. Linear Data Structures
- Elements are arranged in a linear (one-dimensional) fashion.
- All one-to-one relationships can be handled through linear data structures.
- Examples: Array, Stack, Queue, Linked List, etc.

#### 4. Non-Linear Data Structures
- Used to handle one-to-many, many-to-one, or many-to-many relationships.
- Every data element can have multiple predecessors and successors.
- Examples: Tree, Graph, etc.

---

## Static vs Dynamic Data Structures

### Static Data Structure
- Memory for the object is allocated at the time of loading the program.
- The amount of memory required is determined by the compiler during compilation.
- Example: `int a[50];` — memory for the array `a` is set for 50 elements.
- **Drawbacks:**
  - Can cause underutilization of memory if over-allocated.
  - Can cause overflow if under-allocated.
  - No reusability of allocated memory.

### Dynamic Data Structure
- Memory space is calculated and allocated during execution (runtime).
- Dynamic memory in C is managed by a set of library functions.
- Example of allocating a block of memory:
  ```c
  Ptr = (cast-type) malloc(byte-size);
  ```

---
