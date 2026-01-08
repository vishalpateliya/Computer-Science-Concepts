# Python Interview Preparation Guide

## 📑 Table of Contents

### [1. Python Basics](#1-python-basics)
- [Variables and Data Types](#variables-and-data-types)
- [Operators](#operators)
- [String Manipulation](#string-manipulation)
- [Input/Output](#inputoutput)
- [Comments](#comments)

### [2. Control Flow](#2-control-flow)
- [If/Else Statements](#ifelse-statements)
- [Loops (for, while)](#loops-for-while)
- [Break, Continue, Pass](#break-continue-pass)

### [3. Data Structures](#3-data-structures)
- [Lists](#lists)
- [Tuples](#tuples)
- [Dictionaries](#dictionaries)
- [Sets](#sets)
- [List Comprehension](#list-comprehension)

### [4. Functions](#4-functions)
- [Defining Functions](#defining-functions)
- [Parameters and Arguments](#parameters-and-arguments)
- [Return Values](#return-values)
- [Lambda Functions](#lambda-functions)
- [Decorators](#decorators)
- [Args and Kwargs](#args-and-kwargs)

### [5. Object-Oriented Programming](#5-object-oriented-programming)
- [Classes and Objects](#classes-and-objects)
- [Inheritance](#inheritance)
- [Polymorphism](#polymorphism)
- [Encapsulation](#encapsulation)
- [Special Methods (Dunder Methods)](#special-methods-dunder-methods)
- [Class vs Static Methods](#class-vs-static-methods)

### [6. File Handling](#6-file-handling)
- [Reading Files](#reading-files)
- [Writing Files](#writing-files)
- [File Operations](#file-operations)

### [7. Exception Handling](#7-exception-handling)
- [Try/Except/Finally](#tryexceptfinally)
- [Custom Exceptions](#custom-exceptions)
- [Common Exceptions](#common-exceptions)

### [8. Modules and Libraries](#8-modules-and-libraries)
- [Importing Modules](#importing-modules)
- [Built-in Modules](#built-in-modules)
- [Numpy Basics](#numpy-basics)
- [Pandas Basics](#pandas-basics)

### [9. Advanced Concepts](#9-advanced-concepts)
- [Iterators and Generators](#iterators-and-generators)
- [Comprehensions](#comprehensions)
- [Context Managers](#context-managers)
- [Closures](#closures)

### [10. Common Interview Questions](#10-common-interview-questions)

---

## 1. Python Basics

### Variables and Data Types

**What are data types?**
Data types define the kind of data a variable holds.

**Basic Data Types:**
```python
# Integers
age = 25
print(type(age))  # <class 'int'>

# Floats
price = 19.99
print(type(price))  # <class 'float'>

# Strings
name = "John"
print(type(name))  # <class 'str'>

# Booleans
is_student = True
print(type(is_student))  # <class 'bool'>

# None (null value)
value = None
print(type(value))  # <class 'NoneType'>
```

**Type Conversion:**
```python
# String to Integer
num = int("42")  # 42

# Integer to String
text = str(100)  # "100"

# String to Float
decimal = float("3.14")  # 3.14

# Integer to Boolean
flag = bool(1)  # True
flag = bool(0)  # False
```

---

### Operators

**Arithmetic Operators:**
```python
a = 10
b = 3

print(a + b)   # 13 (addition)
print(a - b)   # 7 (subtraction)
print(a * b)   # 30 (multiplication)
print(a / b)   # 3.333... (division)
print(a // b)  # 3 (floor division)
print(a % b)   # 1 (modulus)
print(a ** b)  # 1000 (exponentiation)
```

**Comparison Operators:**
```python
x = 5
y = 10

print(x == y)  # False (equal)
print(x != y)  # True (not equal)
print(x < y)   # True (less than)
print(x > y)   # False (greater than)
print(x <= y)  # True (less than or equal)
print(x >= y)  # False (greater than or equal)
```

**Logical Operators:**
```python
a = True
b = False

print(a and b)  # False (both must be true)
print(a or b)   # True (at least one true)
print(not a)    # False (negation)
```

**Assignment Operators:**
```python
x = 5

x += 3   # x = 8 (equivalent to x = x + 3)
x -= 2   # x = 6
x *= 2   # x = 12
x /= 4   # x = 3.0
```

---

### String Manipulation

**String Basics:**
```python
text = "Hello, Python!"

# Length
print(len(text))  # 14

# Indexing (0-based)
print(text[0])    # 'H'
print(text[-1])   # '!'

# Slicing
print(text[0:5])   # 'Hello'
print(text[7:])    # 'Python!'
print(text[::2])   # 'HloP!hn' (every 2nd character)
```

**String Methods:**
```python
text = "hello world"

print(text.upper())          # "HELLO WORLD"
print(text.capitalize())     # "Hello world"
print(text.replace("world", "Python"))  # "hello Python"
print(text.split(" "))       # ['hello', 'world']
print(" ".join(['a', 'b', 'c']))  # "a b c"
print(text.startswith("hello"))  # True
print(text.endswith("world"))    # True
print(text.find("world"))    # 6
print(text.strip())          # removes leading/trailing whitespace
```

**String Formatting:**
```python
name = "John"
age = 25
salary = 50000.50

# Old style (%)
print("Name: %s, Age: %d" % (name, age))

# .format()
print("Name: {}, Age: {}".format(name, age))
print("Name: {0}, Age: {1}".format(name, age))

# f-strings (recommended)
print(f"Name: {name}, Age: {age}")
print(f"Salary: ${salary:.2f}")
```

---

### Input/Output

**Input:**
```python
# Get user input (always returns string)
name = input("Enter your name: ")
print(f"Hello, {name}")

# Convert to integer
age = int(input("Enter your age: "))
print(f"Your age is {age}")
```

**Output:**
```python
# print() function
print("Hello")
print("Hello", "World")  # multiple values

# Separator
print("a", "b", "c", sep="-")  # a-b-c

# End parameter
print("No newline", end="")
```

---

### Comments

```python
# This is a single-line comment

"""
This is a multi-line comment
or docstring
"""

def my_function():
    """
    This is a function docstring
    Explains what the function does
    """
    pass
```

---

## 2. Control Flow

### If/Else Statements

**Basic If/Else:**
```python
age = 20

if age >= 18:
    print("You are an adult")
else:
    print("You are a minor")
```

**If/Elif/Else:**
```python
score = 75

if score >= 90:
    print("Grade: A")
elif score >= 80:
    print("Grade: B")
elif score >= 70:
    print("Grade: C")
else:
    print("Grade: F")
```

**Ternary Operator:**
```python
age = 20
status = "Adult" if age >= 18 else "Minor"
print(status)  # "Adult"
```

---

### Loops (for, while)

**For Loop:**
```python
# Iterate over a list
fruits = ["apple", "banana", "orange"]
for fruit in fruits:
    print(fruit)

# Using range
for i in range(5):  # 0, 1, 2, 3, 4
    print(i)

# With step
for i in range(0, 10, 2):  # 0, 2, 4, 6, 8
    print(i)

# Enumerate (get index and value)
for index, fruit in enumerate(fruits):
    print(f"{index}: {fruit}")
```

**While Loop:**
```python
count = 0
while count < 5:
    print(count)
    count += 1

# While with else
n = 5
while n > 0:
    print(n)
    n -= 1
else:
    print("Loop completed")
```

---

### Break, Continue, Pass

```python
# Break - exits loop
for i in range(10):
    if i == 5:
        break  # exits loop
    print(i)

# Continue - skips current iteration
for i in range(5):
    if i == 2:
        continue  # skips this iteration
    print(i)  # prints 0, 1, 3, 4

# Pass - does nothing (placeholder)
if True:
    pass  # does nothing
```

---

## 3. Data Structures

### Lists

**Creating Lists:**
```python
# Empty list
empty = []

# List with values
numbers = [1, 2, 3, 4, 5]
mixed = [1, "hello", 3.14, True]

# Using list()
new_list = list(range(5))  # [0, 1, 2, 3, 4]
```

**List Operations:**
```python
numbers = [1, 2, 3, 4, 5]

# Indexing
print(numbers[0])    # 1
print(numbers[-1])   # 5

# Slicing
print(numbers[1:4])   # [2, 3, 4]
print(numbers[::2])   # [1, 3, 5]

# Length
print(len(numbers))   # 5

# Add element
numbers.append(6)     # [1, 2, 3, 4, 5, 6]

# Insert at index
numbers.insert(0, 0)  # [0, 1, 2, 3, 4, 5, 6]

# Remove element
numbers.remove(3)     # [0, 1, 2, 4, 5, 6]

# Pop element
popped = numbers.pop()     # removes and returns last element
popped = numbers.pop(0)    # removes and returns first element

# Find index
index = numbers.index(4)   # 3

# Sort
numbers.sort()        # sorts in-place
sorted_copy = sorted(numbers)  # returns new sorted list

# Reverse
numbers.reverse()     # reverses in-place
```

**Common List Methods:**
```python
numbers = [1, 2, 3, 2, 1]

print(numbers.count(2))   # 2 (occurrences of 2)
numbers.extend([6, 7])    # [1, 2, 3, 2, 1, 6, 7]
numbers.clear()           # [] (empty list)
```

---

### Tuples

**Creating Tuples:**
```python
# Tuples are immutable (unchangeable)
empty = ()

single = (1,)  # note the comma for single element
numbers = (1, 2, 3, 4, 5)
mixed = (1, "hello", 3.14)

# Unpacking
x, y, z = (1, 2, 3)
print(x, y, z)  # 1 2 3
```

**Tuple Operations:**
```python
numbers = (1, 2, 3, 4, 5)

# Same as lists for reading
print(numbers[0])    # 1
print(numbers[1:3])  # (2, 3)
print(len(numbers))  # 5

# Cannot modify (these will raise errors)
# numbers[0] = 10      # TypeError
# numbers.append(6)    # AttributeError

# Tuple methods
print((1, 2, 2, 3).count(2))  # 2
print((1, 2, 3).index(2))     # 1
```

**When to use Tuples:**
- Immutable data (won't change)
- Use as dictionary keys
- Return multiple values from functions
- Slightly better performance than lists

---

### Dictionaries

**Creating Dictionaries:**
```python
# Empty dictionary
empty = {}

# Dictionary with values
person = {
    "name": "John",
    "age": 25,
    "city": "New York"
}

# Using dict()
info = dict(name="John", age=25)
```

**Dictionary Operations:**
```python
person = {"name": "John", "age": 25, "city": "New York"}

# Access values
print(person["name"])        # "John"
print(person.get("age"))     # 25
print(person.get("email", "N/A"))  # "N/A" (default value)

# Add/Update
person["email"] = "john@example.com"
person["age"] = 26

# Delete
del person["city"]
removed = person.pop("email")

# Check key exists
if "name" in person:
    print("Name exists")

# Iterate
for key, value in person.items():
    print(f"{key}: {value}")

# Get keys and values
keys = person.keys()      # dict_keys(['name', 'age'])
values = person.values()  # dict_values(['John', 26])
```

**Dictionary Methods:**
```python
person = {"name": "John", "age": 25}

person.clear()           # empty the dictionary
copy = person.copy()     # shallow copy
person.update({"city": "NYC"})  # add/update multiple
```

---

### Sets

**Creating Sets:**
```python
# Empty set
empty = set()  # not {} which is dict

# Set with values
numbers = {1, 2, 3, 4, 5}
mixed = {1, "hello", 3.14}

# From list
unique = set([1, 2, 2, 3, 3, 3])  # {1, 2, 3}
```

**Set Operations:**
```python
set1 = {1, 2, 3, 4}
set2 = {3, 4, 5, 6}

# Add/Remove
set1.add(5)
set1.remove(3)  # raises error if not found
set1.discard(10)  # doesn't raise error

# Set operations
print(set1.union(set2))           # {1, 2, 3, 4, 5, 6}
print(set1.intersection(set2))    # {3, 4}
print(set1.difference(set2))      # {1, 2}
print(set1.symmetric_difference(set2))  # {1, 2, 5, 6}

# Check membership
print(3 in set1)  # True

# Iterate
for item in set1:
    print(item)
```

---

### List Comprehension

**Basic List Comprehension:**
```python
# Create list of squares
squares = [x**2 for x in range(5)]
# [0, 1, 4, 9, 16]

# With condition
even = [x for x in range(10) if x % 2 == 0]
# [0, 2, 4, 6, 8]

# Nested comprehension
matrix = [[x*y for x in range(3)] for y in range(3)]
# [[0, 0, 0], [0, 1, 2], [0, 2, 4]]
```

**Dictionary Comprehension:**
```python
squares = {x: x**2 for x in range(5)}
# {0: 0, 1: 1, 2: 4, 3: 9, 4: 16}

# Conditional
even_squares = {x: x**2 for x in range(10) if x % 2 == 0}
```

**Set Comprehension:**
```python
unique = {x % 3 for x in range(10)}
# {0, 1, 2}
```

---

## 4. Functions

### Defining Functions

**Basic Function:**
```python
def greet():
    print("Hello!")

greet()  # calls the function
```

**Function with Parameters:**
```python
def greet(name):
    print(f"Hello, {name}!")

greet("John")  # Hello, John!
```

**Function with Return:**
```python
def add(a, b):
    return a + b

result = add(5, 3)  # 8
```

---

### Parameters and Arguments

**Default Parameters:**
```python
def greet(name="Guest"):
    print(f"Hello, {name}!")

greet()        # Hello, Guest!
greet("John")  # Hello, John!
```

**Multiple Return Values:**
```python
def get_coordinates():
    return 10, 20

x, y = get_coordinates()
print(x, y)  # 10 20
```

**Named Arguments:**
```python
def introduce(name, age, city):
    print(f"{name} is {age} years old and lives in {city}")

introduce(name="John", age=25, city="NYC")
introduce(age=25, name="John", city="NYC")  # order doesn't matter
```

---

### Return Values

```python
# Single return
def square(x):
    return x ** 2

# Multiple returns
def divide(a, b):
    quotient = a // b
    remainder = a % b
    return quotient, remainder

q, r = divide(10, 3)

# No explicit return (returns None)
def do_nothing():
    pass

result = do_nothing()  # None
```

---

### Lambda Functions

**What are Lambda Functions?**
Lambda functions are anonymous, one-line functions.

```python
# Regular function
def add(x, y):
    return x + y

# Lambda function
add_lambda = lambda x, y: x + y
print(add_lambda(5, 3))  # 8

# Common use with map
numbers = [1, 2, 3, 4, 5]
squared = list(map(lambda x: x**2, numbers))
# [1, 4, 9, 16, 25]

# With filter
evens = list(filter(lambda x: x % 2 == 0, numbers))
# [2, 4]

# With sorted
words = ["apple", "pie", "cherry", "date"]
sorted_words = sorted(words, key=lambda x: len(x))
# ['pie', 'date', 'apple', 'cherry']
```

---

### Decorators

**What are Decorators?**
Decorators are functions that modify other functions.

**Basic Decorator:**
```python
def my_decorator(func):
    def wrapper():
        print("Something before the function")
        func()
        print("Something after the function")
    return wrapper

@my_decorator
def say_hello():
    print("Hello!")

say_hello()
# Output:
# Something before the function
# Hello!
# Something after the function
```

**Decorator with Arguments:**
```python
def my_decorator(func):
    def wrapper(*args, **kwargs):
        print(f"Calling function: {func.__name__}")
        return func(*args, **kwargs)
    return wrapper

@my_decorator
def add(a, b):
    return a + b

result = add(5, 3)  # Prints: Calling function: add
# result = 8
```

**Common Decorators:**
```python
# Timer decorator
import time

def timer(func):
    def wrapper(*args, **kwargs):
        start = time.time()
        result = func(*args, **kwargs)
        end = time.time()
        print(f"Execution time: {end - start} seconds")
        return result
    return wrapper

@timer
def slow_function():
    time.sleep(1)
    print("Done")
```

---

### Args and Kwargs

***args - Variable number of positional arguments:**
```python
def print_args(*args):
    for arg in args:
        print(arg)

print_args(1, 2, 3, "hello")
# 1
# 2
# 3
# hello
```

****kwargs - Variable number of keyword arguments:**
```python
def print_kwargs(**kwargs):
    for key, value in kwargs.items():
        print(f"{key}: {value}")

print_kwargs(name="John", age=25, city="NYC")
# name: John
# age: 25
# city: NYC
```

**Combining *args and **kwargs:**
```python
def my_function(*args, **kwargs):
    print("Args:", args)
    print("Kwargs:", kwargs)

my_function(1, 2, 3, name="John", age=25)
# Args: (1, 2, 3)
# Kwargs: {'name': 'John', 'age': 25}
```

---

## 5. Object-Oriented Programming

### Classes and Objects

**Creating a Class:**
```python
class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age
    
    def introduce(self):
        print(f"My name is {self.name} and I am {self.age} years old")

# Creating objects
person1 = Person("John", 25)
person1.introduce()  # My name is John and I am 25 years old
```

**Class Attributes vs Instance Attributes:**
```python
class Car:
    wheels = 4  # class attribute (shared by all instances)
    
    def __init__(self, brand):
        self.brand = brand  # instance attribute (unique per object)

car1 = Car("Toyota")
car2 = Car("Honda")

print(car1.wheels)    # 4 (from class)
print(car1.brand)     # "Toyota" (from instance)
print(Car.wheels)     # 4 (from class)
```

---

### Inheritance

**Basic Inheritance:**
```python
# Parent class
class Animal:
    def __init__(self, name):
        self.name = name
    
    def speak(self):
        print(f"{self.name} makes a sound")

# Child class
class Dog(Animal):
    def speak(self):
        print(f"{self.name} barks")

dog = Dog("Rex")
dog.speak()  # Rex barks
```

**Super() Function:**
```python
class Animal:
    def __init__(self, name):
        self.name = name
    
    def speak(self):
        print(f"{self.name} speaks")

class Dog(Animal):
    def __init__(self, name, breed):
        super().__init__(name)  # call parent constructor
        self.breed = breed
    
    def speak(self):
        super().speak()  # call parent method
        print(f"{self.name} barks")

dog = Dog("Rex", "Labrador")
dog.speak()
# Rex speaks
# Rex barks
```

---

### Polymorphism

**Method Overriding:**
```python
class Shape:
    def area(self):
        pass

class Circle(Shape):
    def __init__(self, radius):
        self.radius = radius
    
    def area(self):
        return 3.14 * self.radius ** 2

class Rectangle(Shape):
    def __init__(self, width, height):
        self.width = width
        self.height = height
    
    def area(self):
        return self.width * self.height

circle = Circle(5)
rectangle = Rectangle(4, 5)

print(circle.area())      # 78.5
print(rectangle.area())   # 20
```

---

### Encapsulation

**Private Attributes:**
```python
class BankAccount:
    def __init__(self, balance):
        self.__balance = balance  # private attribute (starts with __)
    
    def deposit(self, amount):
        self.__balance += amount
    
    def withdraw(self, amount):
        if amount <= self.__balance:
            self.__balance -= amount
    
    def get_balance(self):
        return self.__balance

account = BankAccount(1000)
account.deposit(500)
# account.__balance = 2000  # This won't work (AttributeError)
print(account.get_balance())  # 1500
```

**Properties:**
```python
class Circle:
    def __init__(self, radius):
        self._radius = radius
    
    @property
    def radius(self):
        return self._radius
    
    @radius.setter
    def radius(self, value):
        if value > 0:
            self._radius = value
        else:
            raise ValueError("Radius must be positive")
    
    @property
    def area(self):
        return 3.14 * self._radius ** 2

circle = Circle(5)
print(circle.radius)  # 5
print(circle.area)    # 78.5
circle.radius = 10
print(circle.area)    # 314.0
```

---

### Special Methods (Dunder Methods)

```python
class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age
    
    # Triggered by str(person) or print(person)
    def __str__(self):
        return f"{self.name} is {self.age} years old"
    
    # Triggered by repr(person) or when viewing a list of objects
    def __repr__(self):
        return f"Person('{self.name}', {self.age})"
    
    # Triggered by person1 < person2
    def __lt__(self, other):
        return self.age < other.age
    
    # Triggered by len(person)
    def __len__(self):
        return self.age
    
    # Triggered by person[index]
    def __getitem__(self, key):
        if key == 0:
            return self.name
        elif key == 1:
            return self.age
        return "Index out of range"

# --- USAGE EXAMPLES ---

p1 = Person("Alice", 30)
p2 = Person("Bob", 25)

# 1. Using __repr__
# Useful for debugging. It shows the "official" string.
print(f"Debug view: {repr(p1)}") 
# Also shows up when printing a list of objects
print(f"List view: {[p1, p2]}")

# 2. Using __lt__ (Less Than)
# This allows direct comparison and sorting
print(f"Is Bob younger than Alice? {p2 < p1}") 
people = [p1, p2]
print(f"Sorted by age: {sorted(people)}")

# 3. Using __len__
# Even though it's a person, len() now returns their age
print(f"Length of p1: {len(p1)}")

# 4. Using __getitem__
# Allows you to access the object like a list
print(f"Name (index 0): {p1[0]}")
print(f"Age (index 1): {p1[1]}")
```

---

### Class vs Static Methods

```python
class MathOperations:
    PI = 3.14
    
    def __init__(self, a=0, b=0):
        """Constructor needed so from_string has something to call"""
        self.a = a
        self.b = b

    @staticmethod
    def add(a, b):
        """Static method: Works like a regular function, knows nothing about the class"""
        return a + b
    
    @classmethod
    def from_string(cls, string):
        """Class method: Used as an alternative constructor"""
        a, b = map(int, string.split(','))
        return cls(a, b) # Now this works!
    
    def multiply(self, x):
        """Instance method: Accesses the specific instance and class attributes"""
        return x * self.PI

# --- Usage ---

# 1. Using static method (No instance needed)
print(MathOperations.add(5, 3))  # Output: 8

# 2. Using class method (Creates a new object from a string)
ops = MathOperations.from_string("10,20")
print(f"Object created! a: {ops.a}, b: {ops.b}")

# 3. Using instance method
print(ops.multiply(10)) # Output: 31.4
```

---

## 6. File Handling

### Reading Files

```python
# Read entire file
with open("file.txt", "r") as file:
    content = file.read()
    print(content)

# Read line by line
with open("file.txt", "r") as file:
    for line in file:
        print(line.strip())  # strip removes newline

# Read all lines as list
with open("file.txt", "r") as file:
    lines = file.readlines()
```

---

### Writing Files

```python
# Write to file (overwrites)
with open("file.txt", "w") as file:
    file.write("Hello, World!")

# Append to file
with open("file.txt", "a") as file:
    file.write("\nNew line added")

# Write multiple lines
with open("file.txt", "w") as file:
    file.writelines(["Line 1\n", "Line 2\n", "Line 3\n"])
```

---

### File Operations

```python
import os

# Check if file exists
if os.path.exists("file.txt"):
    print("File exists")

# Get file size
size = os.path.getsize("file.txt")
print(f"File size: {size} bytes")

# Delete file
os.remove("file.txt")

# Rename file
os.rename("old_name.txt", "new_name.txt")

# Get current directory
current_dir = os.getcwd()
```

---

## 7. Exception Handling

### Try/Except/Finally

**Basic Try/Except:**
```python
try:
    result = 10 / 0
except ZeroDivisionError:
    print("Cannot divide by zero")
```

**Multiple Exceptions:**
```python
try:
    num = int(input("Enter a number: "))
    result = 10 / num
except ValueError:
    print("Please enter a valid number")
except ZeroDivisionError:
    print("Cannot divide by zero")
except Exception as e:
    print(f"An error occurred: {e}")
```

**Try/Except/Else:**
```python
try:
    file = open("data.txt", "r")
except FileNotFoundError:
    print("File not found")
else:   # Else block runs iff try block ran successfully
    print("File opened successfully")
    file.close()
```

**Try/Except/Finally:**
```python
try:
    file = open("data.txt", "r")
    data = file.read()
except FileNotFoundError:
    print("File not found")
finally:
    file.close()  # always executes (can have else block as well!!)
    print("Cleanup done")
```

---

### Custom Exceptions

```python
# Create custom exception
class InsufficientFundsError(Exception):
    pass

class BankAccount:
    def __init__(self, balance):
        self.balance = balance
    
    def withdraw(self, amount):
        if amount > self.balance:
            raise InsufficientFundsError("Not enough balance")
        self.balance -= amount

# Using custom exception
try:
    account = BankAccount(100)
    account.withdraw(200)
except InsufficientFundsError as e:
    print(f"Error: {e}")
```

---

### Common Exceptions

```python
# ZeroDivisionError
result = 10 / 0  # ZeroDivisionError

# ValueError
num = int("abc")  # ValueError

# IndexError
list_item = [1, 2, 3][5]  # IndexError

# KeyError
dict_item = {"a": 1}["b"]  # KeyError

# AttributeError
text = "hello"
text.unknown_method()  # AttributeError

# FileNotFoundError
file = open("nonexistent.txt")  # FileNotFoundError

# TypeError
result = "5" + 5  # TypeError
```

---

## 8. Modules and Libraries

### Importing Modules

```python
# Import entire module
import math
print(math.sqrt(16))  # 4.0

# Import specific function
from math import sqrt, pi
print(sqrt(16))  # 4.0
print(pi)        # 3.14159...

# Import with alias
import numpy as np
arr = np.array([1, 2, 3])

# Import all (not recommended)
from math import *
```

---

### Built-in Modules

**Math Module:**
```python
import math

print(math.sqrt(16))      # 4.0
print(math.pow(2, 3))     # 8.0
print(math.floor(3.7))    # 3
print(math.ceil(3.2))     # 4
print(math.pi)            # 3.14159...
```

**Random Module:**
```python
import random

print(random.randint(1, 10))      # random integer between 1-10
print(random.choice([1, 2, 3]))   # random element from list
print(random.random())             # random float between 0-1
random.shuffle([1, 2, 3])         # shuffle list in-place
```

**DateTime Module:**
```python
from datetime import datetime, timedelta

now = datetime.now()
print(now)  # current date and time

today = datetime.today()
future = today + timedelta(days=7)  # add 7 days

# Format date
print(now.strftime("%Y-%m-%d %H:%M:%S"))
```

---

### Numpy Basics

```python
import numpy as np

# Create arrays
arr = np.array([1, 2, 3, 4, 5])
zeros = np.zeros((2, 3))       # 2x3 matrix of zeros
ones = np.ones((3, 3))         # 3x3 matrix of ones
range_arr = np.arange(0, 10, 2)  # [0, 2, 4, 6, 8]

# Array operations
arr = np.array([1, 2, 3, 4, 5])
print(arr + 5)      # [6, 7, 8, 9, 10]
print(arr * 2)      # [2, 4, 6, 8, 10]
print(arr ** 2)     # [1, 4, 9, 16, 25]

# Statistics
print(np.mean(arr))    # 3.0
print(np.median(arr))  # 3.0
print(np.std(arr))     # standard deviation
print(np.sum(arr))     # 15

# Shape and reshape
arr = np.array([[1, 2, 3], [4, 5, 6]])
print(arr.shape)          # (2, 3)
reshaped = arr.reshape(3, 2)  # reshape to 3x2
```

---

### Pandas Basics

```python
import pandas as pd

# Create DataFrame
data = {
    'Name': ['John', 'Jane', 'Bob'],
    'Age': [25, 23, 30],
    'City': ['NYC', 'LA', 'Chicago']
}
df = pd.DataFrame(data)

# Read CSV
df = pd.read_csv('data.csv')

# Basic operations
print(df.head())          # first 5 rows
print(df.tail())          # last 5 rows
print(df.info())          # column info
print(df.describe())      # statistics

# Access columns
print(df['Name'])
print(df[['Name', 'Age']])

# Filter rows
adults = df[df['Age'] > 25]

# Add column
df['Salary'] = [50000, 60000, 55000]

# Group by
grouped = df.groupby('City').size()

# Sort
sorted_df = df.sort_values('Age')
```

---

## 9. Advanced Concepts

### Iterators and Generators

**Iterators:**
```python
# Create an iterator
class CountUp:
    def __init__(self, max):
        self.max = max
        self.current = 0
    
    def __iter__(self):
        return self
    
    def __next__(self):
        if self.current < self.max:
            self.current += 1
            return self.current
        else:
            raise StopIteration

counter = CountUp(3)
for num in counter:
    print(num)  # 1, 2, 3
```

**Generators:**
```python
# Generator function (uses yield)
def count_up(max):
    current = 0
    while current < max:
        current += 1
        yield current

for num in count_up(3):
    print(num)  # 1, 2, 3

# Generator expression
squares = (x**2 for x in range(5))
```

---

### Comprehensions

**List, Dict, Set Comprehensions:**
```python
# List comprehension
squares = [x**2 for x in range(5)]

# Dict comprehension
squares_dict = {x: x**2 for x in range(5)}

# Set comprehension
unique_remainders = {x % 3 for x in range(10)}

# Nested comprehension
matrix = [[x*y for x in range(3)] for y in range(3)]
```

---

### Context Managers

**Using with statement:**
```python
# File handling with context manager
with open("file.txt", "r") as file:
    data = file.read()
# file is automatically closed

# Creating custom context manager
from contextlib import contextmanager

@contextmanager
def my_context():
    print("Entering context")
    try:
        yield
    finally:
        print("Exiting context")

with my_context():
    print("Inside context")
```

---

### Closures

**What are Closures?**
A closure is a function that remembers values from the scope where it was created.

```python
def outer(x):
    def inner(y):
        return x + y  # inner remembers x from outer
    return inner

add_five = outer(5)
print(add_five(3))  # 8

# Closure with mutable state
def counter():
    count = 0
    def increment():
        nonlocal count
        count += 1
        return count
    return increment

counter_func = counter()
print(counter_func())  # 1
print(counter_func())  # 2
print(counter_func())  # 3
```

---

## 10. Common Interview Questions

### Q1: What is Python and its features?
**Answer:**
Python is a high-level, interpreted programming language known for:
- **Readability**: Simple and clean syntax
- **Versatility**: Used in web, data science, AI, automation
- **Dynamically typed**: Types assigned at runtime
- **Interpreted**: Executed line by line
- **Rich ecosystem**: Extensive libraries and frameworks

---

### Q2: What is the difference between lists and tuples?
**Answer:**

| Lists | Tuples |
|-------|--------|
| Mutable | Immutable |
| Slower | Faster |
| `[1, 2, 3]` | `(1, 2, 3)` |
| Can be modified | Cannot be modified |
| Use as dict keys: No | Use as dict keys: Yes |

---

### Q3: What are decorators and how do they work?
**Answer:**
Decorators are functions that modify other functions. They:
- Take a function as input
- Add functionality to it
- Return the modified function

```python
def my_decorator(func):
    def wrapper():
        print("Before")
        func()
        print("After")
    return wrapper

@my_decorator
def hello():
    print("Hello")
```

---

### Q4: Explain *args and **kwargs
**Answer:**
- ***args**: Allows a function to accept any number of positional arguments as a tuple
- ****kwargs**: Allows a function to accept any number of keyword arguments as a dictionary

```python
def func(*args, **kwargs):
    print(args)     # tuple of positional args
    print(kwargs)   # dict of keyword args

func(1, 2, 3, name="John", age=25)
```

---

### Q5: What is the difference between == and is?
**Answer:**
- **==**: Checks if values are equal
- **is**: Checks if objects are the same (same memory address)

```python
a = [1, 2, 3]
b = [1, 2, 3]
c = a

print(a == b)  # True (same values)
print(a is b)  # False (different objects)
print(a is c)  # True (same object)
```

---

### Q6: What is GIL (Global Interpreter Lock)?
**Answer:**
GIL is a mutex in CPython that prevents multiple native threads from executing Python code simultaneously. This means:
- Only one thread can execute Python bytecode at a time
- Multithreading is not efficient for CPU-bound tasks
- Better to use multiprocessing for parallel execution
- Doesn't affect I/O-bound tasks

---

### Q7: What are lambda functions?
**Answer:**
Lambda functions are anonymous, one-line functions created with the `lambda` keyword.

```python
square = lambda x: x**2
print(square(5))  # 25

# Common use with map/filter
numbers = [1, 2, 3, 4, 5]
doubled = list(map(lambda x: x*2, numbers))  # [2, 4, 6, 8, 10]
evens = list(filter(lambda x: x % 2 == 0, numbers))  # [2, 4]
```

---

### Q8: Explain list comprehension and its advantages
**Answer:**
List comprehension is a concise way to create lists.

```python
# Traditional approach
squares = []
for x in range(5):
    squares.append(x**2)

# List comprehension
squares = [x**2 for x in range(5)]
```

**Advantages:**
- More readable and concise
- Faster than loops
- Can include conditions

---

### Q9: What is the difference between shallow and deep copy?
**Answer:**

```python
import copy

original = [[1, 2], [3, 4]]

# Shallow copy - copies outer structure but references inner objects
shallow = copy.copy(original)
shallow[0][0] = 99
print(original)  # [[99, 2], [3, 4]] - changed!

# Deep copy - copies everything recursively
original = [[1, 2], [3, 4]]
deep = copy.deepcopy(original)
deep[0][0] = 99
print(original)  # [[1, 2], [3, 4]] - unchanged!
```

---

### Q10: What are generators?
**Answer:**
Generators are functions that return an iterator using `yield` keyword. They:
- Return values one at a time
- Save state between calls
- Use less memory than lists
- Are lazy (compute values on demand)

```python
def count_up(n):
    i = 0
    while i < n:
        yield i
        i += 1

for num in count_up(3):
    print(num)  # 0, 1, 2
```

---

### Q11: Explain exception handling in Python
**Answer:**
Exception handling uses try/except/else/finally blocks:

```python
try:
    # risky code
except SpecificError:
    # handle specific error
except Exception:
    # handle any error
else:
    # runs if no exception
finally:
    # always runs (cleanup)
```

---

### Q12: What are class methods and static methods?
**Answer:**

**Class Method:**
- Receives class as first argument
- Can modify class state
- Decorated with `@classmethod`

```python
class MyClass:
    count = 0
    
    @classmethod
    def increment(cls):
        cls.count += 1
```

**Static Method:**
- Doesn't access instance or class
- Utility function
- Decorated with `@staticmethod`

```python
class MyClass:
    @staticmethod
    def add(a, b):
        return a + b
```

---

### Q13: What is the difference between break, continue, and pass?
**Answer:**

```python
# break - exits loop
for i in range(5):
    if i == 3:
        break  # exits loop
    print(i)  # 0, 1, 2

# continue - skips iteration
for i in range(5):
    if i == 2:
        continue  # skips this iteration
    print(i)  # 0, 1, 3, 4

# pass - does nothing (placeholder)
if True:
    pass  # no error, just placeholder
```

---

### Q14: How do you reverse a string?
**Answer:**

```python
text = "Hello"

# Using slicing
reversed_text = text[::-1]  # "olleH"

# Using reversed() and join()
reversed_text = ''.join(reversed(text))  # "olleH"

# Using loop
reversed_text = ""
for char in text:
    reversed_text = char + reversed_text  # "olleH"
```

---

### Q15: What is the output of the following code?
**Answer:**

```python
x = 5

def func():
    x = 10
    return x

print(func())   # 10
print(x)        # 5 (global x unchanged)
```

The local variable `x` inside the function doesn't affect the global `x`.

---

## Tips for Interview Preparation

✅ **Do:**
- Practice coding on a IDE/online judge
- Understand concepts deeply
- Write clean, readable code
- Test edge cases
- Time your solutions
- Explain your thought process
- Practice on LeetCode, HackerRank
- Build small projects

❌ **Don't:**
- Just memorize syntax
- Copy-paste solutions
- Ignore error handling
- Skip comments in code
- Avoid explaining your approach
- Practice only easy problems

---

## Python Learning Path

1. **Basics** - Variables, data types, operators
2. **Control Flow** - If/else, loops
3. **Functions** - Parameters, returns, scope
4. **Data Structures** - Lists, dicts, tuples, sets
5. **OOP** - Classes, inheritance, polymorphism
6. **File I/O** - Reading/writing files
7. **Exception Handling** - Try/except
8. **Modules** - Imports, libraries
9. **Advanced** - Decorators, generators, context managers

---

## Quick Reference Checklist

- [ ] Master list operations and slicing
- [ ] Understand dictionary operations
- [ ] Know all major string methods
- [ ] Practice list/dict comprehensions
- [ ] Understand OOP concepts
- [ ] Know exception handling
- [ ] Practice file operations
- [ ] Understand decorators
- [ ] Know lambda functions
- [ ] Understand *args and **kwargs
- [ ] Practice at least 20 LeetCode problems
- [ ] Build 3 mini projects

---

**Good luck with your Python interview! 🐍**

