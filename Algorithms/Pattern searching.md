# Pattern Searching in Algorithms

## 1. Introduction to Pattern Searching

### What is Pattern Searching?

The core problem is straightforward: Given a **text** (a long string) and a **pattern** (a shorter string), find all occurrences of the pattern within the text. We need to determine where the pattern starts in the text and identify if it exists.

#### Example
- **Text (T):** `"ABABDABACDABABCABAB"` (length N = 19)
- **Pattern (P):** `"ABABCABAB"` (length M = 9)
- **Result:** The pattern occurs starting at index 10 in the text

### Key Terminology

| Term | Definition |
|------|-----------|
| **Text (T)** | The larger string being searched; length = N |
| **Pattern (P)** | The smaller string being searched for; length = M |
| **Match** | An occurrence of the pattern in the text |
| **Shift** | The starting position of a potential match in the text |

---

## 2. Naive (Brute Force) Algorithm

The naive approach is the most straightforward but can be inefficient for certain inputs.

### 2.1 Algorithm Description

The naive algorithm slides the pattern across the text one position at a time and compares characters:

1. Align the pattern at the beginning of the text (shift = 0)
2. Compare characters of the pattern with corresponding characters of the text
3. If all characters match, record the match
4. Shift the pattern one position to the right in the text
5. Repeat until the pattern cannot fit in the remaining text

### 2.2 Example Walkthrough

**Text:** `"ABABDABACDABABCABAB"` (N = 19)  
**Pattern:** `"ABABCABAB"` (M = 9)

```
Shift 0:
T: A B A B D A B A C D A B A B C A B A B
P: A B A B C A B A B
   ^ ^ ^ ^ X
   Match, Match, Match, Match, Mismatch (D vs C) → Shift by 1

Shift 1:
T: A B A B D A B A C D A B A B C A B A B
     P: A B A B C A B A B
       X
   Mismatch (B vs A) → Shift by 1

... (intermediate shifts) ...

Shift 10:
T: A B A B D A B A C D A B A B C A B A B
                     P: A B A B C A B A B
                        ^ ^ ^ ^ ^ ^ ^ ^ ^
   All characters match! → Match found at index 10 → Shift by 1

... (continue until pattern cannot fit) ...
```

### 2.3 Time Complexity Analysis

| Case | Complexity | Explanation |
|------|-----------|-------------|
| **Worst Case** | O(N × M) | Occurs with many partial matches (e.g., T = `"AAAAAAAAB"`, P = `"AAAB"`) |
| **Best Case** | O(N) | Pattern found on first or early shift |
| **Average Case** | O(N + M) | Pattern and text have few partial matches |
| **Space Complexity** | O(1) | Constant extra space required |

### 2.4 Advantages and Disadvantages

**Advantages:**
- Simple to understand and implement
- No preprocessing required
- Works well with small texts or patterns

**Disadvantages:**
- Very inefficient for large texts and patterns with repeating characters
- Many redundant comparisons made at each shift
- Poor performance with patterns having many partial matches

---

## 3. Advanced Pattern Searching Algorithms (Exact Matching)

To overcome the limitations of the naive approach, advanced algorithms use preprocessing to optimize searches.

### 3.1 Rabin-Karp Algorithm

The Rabin-Karp algorithm uses **hashing** to find pattern occurrences. It's particularly effective for **multiple pattern searches**.

#### 3.1.1 How It Works

The algorithm involves three main steps:

1. **Hash Computation:** Calculate a hash value for the pattern P
2. **Rolling Hash:** Compute hash values for all substrings of T with length M using a rolling hash technique
3. **Comparison:**
   - If hash values match, it's a potential match
   - Verify with character-by-character comparison to avoid spurious hits (hash collisions)
   - If characters also match, a true match is found
   - Otherwise, slide the window by one character and repeat

#### 3.1.2 Rolling Hash Concept

The rolling hash technique is efficient because it computes the hash of the next substring in O(1) time, rather than recalculating from scratch:

```
Hash(i) removes the leftmost character and adds the rightmost character
Hash(i+1) = (Hash(i) - T[i] × base^(M-1)) × base + T[i+M]
```

This reduces the time to compute each window's hash from O(M) to O(1).

#### 3.1.3 Time Complexity Analysis

| Case | Complexity | Explanation |
|------|-----------|-------------|
| **Average Case** | O(N + M) | Hash computations are O(1), verifications only on hash matches |
| **Worst Case** | O(N × M) | Many spurious hits require character-by-character verification |
| **Space Complexity** | O(1) | Only hash values and variables stored |

#### 3.1.4 Advantages and Disadvantages

**Advantages:**
- Efficient for multiple pattern searches
- Average case is linear
- Rolling hash is elegant and efficient

**Disadvantages:**
- Spurious hits can occur (hash collisions)
- Worst-case performance is poor
- More complex to implement than naive algorithm

---

### 3.2 KMP (Knuth-Morris-Pratt) Algorithm

The KMP algorithm uses a **failure function** to avoid unnecessary comparisons by utilizing information about previously matched characters.

#### 3.2.1 How It Works

1. **Preprocessing:** Build a failure function (LPS array - Longest Proper Prefix which is also Suffix) for the pattern
2. **Searching:** Use the failure function to skip comparisons without sliding the pattern back completely

#### 3.2.2 Failure Function (LPS Array)

The LPS array stores the length of the longest proper prefix of each substring that is also a suffix.

**Example:** For pattern `"ABABDABAAB"`
```
Pattern:  A B A B D A B A A B
LPS:      0 0 1 2 0 1 2 3 3 4
```

#### 3.2.3 Time Complexity Analysis

| Metric | Complexity |
|--------|-----------|
| **Preprocessing** | O(M) |
| **Searching** | O(N) |
| **Total Time** | O(N + M) |
| **Space Complexity** | O(M) for LPS array |

#### 3.2.4 Advantages and Disadvantages

**Advantages:**
- Guaranteed linear time complexity
- No spurious hits
- Optimal for single pattern matching

**Disadvantages:**
- More complex preprocessing
- Harder to understand and implement
- Less suitable for multiple pattern searches

---

### 3.3 Boyer-Moore Algorithm

The Boyer-Moore algorithm scans the pattern from right to left and uses two heuristics to skip characters efficiently.

#### 3.3.1 How It Works

1. **Right-to-Left Scanning:** Compare pattern characters from right to left
2. **Two Heuristics:**
   - **Bad Character Rule:** If a mismatch occurs, shift the pattern by the distance of the mismatched character in the pattern
   - **Good Suffix Rule:** If a suffix matches, shift based on the next occurrence of that suffix

#### 3.3.2 Time Complexity Analysis

| Case | Complexity |
|------|-----------|
| **Average Case** | O(N / M) - Sublinear! |
| **Best Case** | O(N / M) |
| **Worst Case** | O(N × M) |
| **Preprocessing** | O(M + Σ) where Σ is alphabet size |

#### 3.3.3 Advantages and Disadvantages

**Advantages:**
- Often fastest in practice
- Sublinear average performance
- Excellent for large alphabets and long patterns

**Disadvantages:**
- Complex to implement
- Worst-case performance is poor
- Preprocessing takes more space

---

## 4. Comparison of Algorithms

| Algorithm | Best Case | Average Case | Worst Case | Space | Use Case |
|-----------|-----------|--------------|-----------|-------|----------|
| **Naive** | O(N) | O(N + M) | O(N × M) | O(1) | Small inputs, simple implementation |
| **Rabin-Karp** | O(N + M) | O(N + M) | O(N × M) | O(1) | Multiple patterns, 2D patterns |
| **KMP** | O(N + M) | O(N + M) | O(N + M) | O(M) | Single pattern, guaranteed linear time |
| **Boyer-Moore** | O(N / M) | O(N / M) | O(N × M) | O(M + Σ) | Large texts, large alphabets |

---

## 5. Key Takeaways

1. **Pattern searching** is fundamental to string processing and text search operations
2. **Naive algorithm** is simple but inefficient; use only for educational purposes or small inputs
3. **Rabin-Karp** excels at multiple pattern matching and special cases like 2D patterns
4. **KMP algorithm** provides guaranteed linear time with moderate complexity
5. **Boyer-Moore** is often the fastest in practice for real-world scenarios
6. Choose the algorithm based on your specific requirements: pattern count, text size, alphabet size, and implementation complexity tolerance

---

## 6. Practice Tips

- Start by implementing the Naive algorithm to understand the core concept
- Progress to Rabin-Karp for multiple patterns
- Master KMP for guaranteed O(N + M) performance
- Use Boyer-Moore for production systems dealing with large texts
- Consider hybrid approaches combining multiple algorithms for optimal performance
