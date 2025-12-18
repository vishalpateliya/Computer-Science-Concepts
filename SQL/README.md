# SQL (MySQL) Reference

A concise, clickable reference for common SQL concepts and MySQL examples. Use the index below to jump to a topic. 💡

---

## Index

- [SQL Basics](#sql-basics) ✅
- [Types of SQL Commands](#types-of-sql-commands) 🔧
- [CREATE — Databases & Tables](#create--databases--tables)
- [SELECT](#select) 🔎
  - [WHERE (Filtering)](#where-filtering)
  - [ORDER BY](#order-by)
  - [LIMIT](#limit)
- [UPDATE](#update) ✏️
- [DELETE](#delete) 🗑️
- [TRUNCATE](#truncate) 💥
- [ALTER](#alter) 🛠️
- [VIEW](#view) 👁️
- [JOINS](#joins) 🔗
  - [INNER JOIN](#inner-join)
  - [LEFT JOIN](#left-join)
  - [RIGHT JOIN](#right-join)
  - [FULL JOIN (workaround)](#full-join-mysql-workaround)
  - [SELF JOIN](#self-join)
- [Aggregate Functions](#aggregate-functions) Σ
- [GROUP BY & HAVING](#group-by--having) 🧩
- [UNION & UNION ALL](#union--union-all) ➕
- [INTERSECT (workaround)](#intersect-mysql-workaround)
- [EXCEPT / MINUS (workaround)](#except--minus-mysql-workaround)
- [IN vs EXISTS](#in-vs-exists) ❓
- [Nested Queries (Subqueries)](#nested-queries-subqueries)
- [Important Notes](#important-notes) ⚠️

---

## SQL Basics

**SQL (Structured Query Language)** is used to:

- **Store** data
- **Retrieve** data
- **Modify** data
- **Control access** to data

---

## Types of SQL Commands

| Type | Description | Common Commands |
|------|-------------|-----------------|
| **DDL** | Defines structure / schema | CREATE, ALTER, DROP, TRUNCATE |
| **DML** | Manipulates data | SELECT, INSERT, UPDATE, DELETE |
| **DCL** | Access control | GRANT, REVOKE |
| **TCL** | Transaction control | COMMIT, ROLLBACK, SAVEPOINT |

---

## CREATE — Databases & Tables

### CREATE DATABASE / CREATE SCHEMA

- Create a new database/schema.

```sql
CREATE DATABASE mydb;
CREATE DATABASE IF NOT EXISTS mydb;
-- `CREATE SCHEMA` is a synonym in many engines
```

### CREATE TABLE (common patterns)

- Basic syntax with common column types and constraints:

```sql
CREATE TABLE employees (
  emp_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  dept_id INT,
  salary DECIMAL(10,2) DEFAULT 0.00,
  hired_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  is_active BOOLEAN DEFAULT TRUE,
  manager_id INT,
  INDEX idx_dept (dept_id),
  CONSTRAINT fk_dept FOREIGN KEY (dept_id) REFERENCES departments(dept_id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```

- Useful variants:
  - `CREATE TABLE IF NOT EXISTS ...` to avoid errors
  - `CREATE TEMPORARY TABLE ...` for session-scoped tables
  - `CREATE TABLE ... AS SELECT ...` to create a table from query results

```sql
CREATE TABLE high_earners AS
SELECT * FROM employees WHERE salary > 100000;

CREATE TEMPORARY TABLE tmp_emps (
  emp_id INT PRIMARY KEY,
  name VARCHAR(100)
);
```

### CREATE INDEX

- Create an index after table creation:

```sql
CREATE INDEX idx_name ON employees (name);
```

### Notes & Best Practices

- Use **InnoDB** for foreign key support and transactions.
- Choose appropriate data types (e.g., INT, BIGINT, VARCHAR(n), TEXT, DATE, DATETIME/TIMESTAMP, DECIMAL).
- Define `NOT NULL`, `DEFAULT`, `UNIQUE`, and `CHECK` constraints where applicable.
- Prefer `IF NOT EXISTS` when provisioning to avoid failures in idempotent scripts.
- `AUTO_INCREMENT` columns are typically used for surrogate primary keys.

---

## SELECT

Used to retrieve data from tables.

Examples:

```sql
SELECT * FROM employees;
SELECT name, salary FROM employees;
```

### WHERE (Filtering)

```sql
SELECT * FROM employees
WHERE salary > 50000;
```

### ORDER BY

```sql
SELECT * FROM employees
ORDER BY salary DESC;
```

### LIMIT

```sql
SELECT * FROM employees
LIMIT 5;
```

---

## UPDATE ✏️

- **DML** command — updates existing rows.
- Can use **WHERE** to target specific rows.
- Can be **rolled back** before COMMIT.

```sql
UPDATE employees
SET salary = 60000
WHERE emp_id = 101;
```

> ⚠️ **Caution:** Without a WHERE clause, all rows will be updated.

---

## DELETE 🗑️

- **DML** command — deletes rows.
- Can be rolled back before COMMIT; table structure remains.

```sql
DELETE FROM employees
WHERE emp_id = 101;

-- Remove all rows
DELETE FROM employees; -- deletes all rows
```

---

## TRUNCATE 💥

- **DDL** command — removes all rows at once and **resets AUTO_INCREMENT**.
- **Faster** than DELETE but **cannot** use WHERE and **cannot** be rolled back.
- Fails if table is referenced by a foreign key.

```sql
TRUNCATE TABLE employees;
```

**DELETE vs TRUNCATE**

| Feature | DELETE | TRUNCATE |
|---------|--------|----------|
| WHERE allowed | Yes | No |
| Rollback | Yes | No |
| Speed | Slower | Faster |
| Type | DML | DDL |

---

## ALTER 🛠️

- **DDL** command — changes table structure. Cannot be rolled back.

Common operations:

```sql
-- Add column
ALTER TABLE employees ADD email VARCHAR(100);

-- Modify column
ALTER TABLE employees MODIFY salary DECIMAL(10,2);

-- Rename column (MySQL 8+)
ALTER TABLE employees RENAME COLUMN name TO full_name;

-- Drop column
ALTER TABLE employees DROP COLUMN email;
```

---

## VIEW 👁️

- A **virtual table** that stores a query, not the data.
- Useful for data abstraction and security; always shows updated data.
- Views with GROUP BY or aggregates are **not updatable**.

```sql
CREATE VIEW high_salary_employees AS
SELECT name, salary
FROM employees
WHERE salary > 50000;

SELECT * FROM high_salary_employees;

DROP VIEW high_salary_employees;
```

---

## JOINS 🔗

Used to combine data from multiple tables.

Assume tables:

- `employees(emp_id, name, dept_id)`
- `departments(dept_id, dept_name)`

### INNER JOIN

- Returns matching rows only (intersection).

```sql
SELECT e.name, d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;
```

### LEFT JOIN (LEFT OUTER JOIN)

- All rows from **LEFT**; matching rows from **RIGHT**; non-matches return NULL.

```sql
SELECT e.name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;
```

> ⚠️ Using a WHERE filter on columns of the right table can convert this into an INNER JOIN.

### RIGHT JOIN (RIGHT OUTER JOIN)

- All rows from **RIGHT**; matching rows from **LEFT**.

```sql
SELECT e.name, d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;
```

### FULL JOIN (MySQL workaround)

- MySQL does not support FULL JOIN directly. Use a UNION of LEFT and RIGHT joins to emulate it.

```sql
SELECT e.name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
UNION
SELECT e.name, d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;
```

### SELF JOIN

- Join a table with itself using aliases (useful for hierarchical data).

```sql
SELECT e1.name AS employee, e2.name AS manager
FROM employees e1
JOIN employees e2
ON e1.manager_id = e2.emp_id;
```

---

## Aggregate Functions Σ

- **COUNT**
  - `COUNT(*)` counts all rows (includes NULL rows)
  - `COUNT(column)` counts non-NULL values only
  - Example: `SELECT COUNT(*) FROM employees;`

- **AVG** (ignores NULLs)
  - `SELECT AVG(salary) FROM employees;`

- Others: `SUM(salary)`, `MIN(salary)`, `MAX(salary)`

---

## GROUP BY & HAVING 🧩

- `GROUP BY` groups rows that share values for aggregate calculations.

```sql
SELECT dept_id, AVG(salary)
FROM employees
GROUP BY dept_id;
```

- `HAVING` filters groups (use with aggregates).

```sql
SELECT dept_id, AVG(salary)
FROM employees
GROUP BY dept_id
HAVING AVG(salary) > 50000;
```

---

## UNION & UNION ALL ➕

- `UNION` combines results of multiple `SELECT` queries **vertically** and removes duplicates.
- Rules: same number of columns, compatible data types, same order.

```sql
SELECT name FROM employees
UNION
SELECT name FROM contractors;
```

- `UNION ALL` keeps duplicates and is **faster**.

```sql
SELECT name FROM employees
UNION ALL
SELECT name FROM contractors;
```

---

## INTERSECT (MySQL workaround)

- To get common rows (set intersection) in MySQL, use `IN` or a join with distinct results.

```sql
SELECT name FROM employees
WHERE name IN (SELECT name FROM contractors);
```

---

## EXCEPT / MINUS (MySQL workaround)

- To get rows present in the first query but not the second (A - B):

```sql
SELECT name FROM employees
WHERE name NOT IN (SELECT name FROM contractors);
```

---

## IN vs EXISTS ❓

- **IN**: simple and readable, but **may fail** with `NULL` values returned by the subquery.

```sql
SELECT * FROM employees
WHERE dept_id IN (SELECT dept_id FROM departments);
```

- **EXISTS**: checks for existence, works correctly with `NULL` and is often faster for large datasets.

```sql
SELECT * FROM employees e
WHERE EXISTS (
  SELECT 1 FROM departments d
  WHERE e.dept_id = d.dept_id
);
```

---

## Nested Queries (Subqueries)

- Single-row subquery example:

```sql
SELECT * FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);
```

- Multi-row subquery example:

```sql
SELECT * FROM employees
WHERE dept_id IN (
  SELECT dept_id FROM departments WHERE location = 'NY'
);
```

---

## Important Notes ⚠️

- **JOIN** = horizontal (combines columns)
- **UNION** = vertical (combines rows)
- **WHERE** filters **rows**; **HAVING** filters **groups**
- **TRUNCATE** is faster but irreversible
- Prefer **EXISTS** over **IN** for NULL safety and large data sets
- **Views** improve security and abstraction but not performance

---

If you'd like, I can add sample schema DDL, more examples ⌨️, or short exercises to practice these concepts.