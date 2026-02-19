# Study Notes: Stack

## What is a Stack?
A **stack** is an abstract data type with a predefined capacity. It is a linear data structure that follows a particular order for operations: **Last In First Out (LIFO)** or **First In Last Out (FILO)**. Elements are inserted and removed from the top of the stack.

### Stack Structure in C
```c
typedef struct stack {
    int data[SIZE];
    int top;
} stack;
```

---

## Stack Operations
1. **Initialize:** Make a stack empty by setting `top = -1`.
2. **Empty:** Check if the stack is empty (`top == -1`).
3. **Full:** Check if the stack is full (`top == SIZE - 1`).
4. **Push:** If not full, insert a new element at the top.
5. **Pop:** If not empty, remove and return the element from the top.

### Example C Functions
```c
void initialize(stack *s) {
    s->top = -1;
}

int empty(stack *s) {
    return (s->top == -1);
}

int full(stack *s) {
    return (s->top == SIZE - 1);
}

void push(stack *s, int x) {
    if (full(s)) return;
    s->top = s->top + 1;
    s->data[s->top] = x;
}

int pop(stack *s, int *popped_value) {
    if (empty(s)) {
        return 0; // Return 0 to indicate FAILURE
    }
    
    *popped_value = s->data[s->top];
    s->top--; 
    return 1; // Return 1 to indicate SUCCESS
}
```

---

## Push and Pop Operation
- **LIFO/FILO:** The last element inserted is the first to be removed.

---

## Applications of Stack
Stack data structure is very useful. Some applications include:
1. **Expression Conversion:**
   - Infix to postfix
   - Infix to prefix
   - Postfix to infix
   - Prefix to infix
2. **Expression Evaluation**
3. **Parsing**
4. **Simulation of Recursion**
5. **Function Call Management**

---

## Expression Evaluation and Conversion
There are three popular methods for representing expressions:
- **Infix:** Operator between operands (e.g., `x + y`)
- **Prefix:** Operator before operands (e.g., `+ x y`)
- **Postfix:** Operator after operands (e.g., `x y +`)

### Postfix Evaluation Using Stack
- Scan the expression from left to right.
- If the token is an operand, push it onto the stack.
- If the token is an operator, pop the required number of operands, apply the operator, and push the result back.

### Infix to Postfix Conversion
1. Scan the expression token by token.
2. Assign priority to each operator (higher number = higher priority):
   - 3: `-` (unary negation)
   - 2: `*`, `/`
   - 1: `+`, `-` (subtraction)
3. If the token is an operand, add it to the output.
4. If the token is an operator or parenthesis:
   - Pop the stack until you find a symbol of lower priority.
   - Stack the current symbol.
   - If a right parenthesis is found, pop the stack to the first left parenthesis, writing operators to output.
5. After the last token, pop the remainder of the stack to output (except left parenthesis).

#### Example: Convert `A * (B + C) * D` to postfix
| Step | Token | Stack | Output |
|------|-------|-------|--------|
| 1    | A     |       | A      |
| 2    | *     | *     | A      |
| 3    | (     | * (   | A      |
| 4    | B     | * (   | A B    |
| 5    | +     | * ( + | A B    |
| 6    | C     | * ( + | A B C  |
| 7    | )     | *     | A B C +|
| 8    | *     | *     | A B C +|
| 9    | D     | *     | A B C + D|
| 10   |       |       | A B C + * D *|

### Infix to Prefix Conversion
1. Reverse the infix expression.
2. Replace `(` with `)` and vice versa.
3. Convert to postfix.
4. Reverse the result.

#### Example: Convert `(A+B^C)*D+E^5` to prefix
- Step 1: Reverse: `5^E+D*)C^B+A(`
- Step 2: Swap parentheses: `5^E+D*(C^B+A)`
- Step 3: Convert to postfix: `5 E ^ D + C B ^ A + *`
- Step 4: Reverse: `+ * + A ^ B C D ^ E 5`

### Postfix to Infix Conversion
- Scan the postfix expression from left to right.
- If the token is an operand, push it onto the stack.
- If the token is an operator, pop the required operands, combine them with the operator in infix form (add parentheses if needed), and push the result back.

#### Example: Convert `12*34*+5*` to infix
- Step-by-step, combine operands and operators as you pop them from the stack, following operator precedence.

---
