CREATE DATABASE NOGGANO;
\c

CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE passports (
    employee_id INT PRIMARY KEY REFERENCES employees(id),
    passport_number VARCHAR(20) UNIQUE NOT NULL,
    issue_date DATE,
    expiry_date DATE
);

SELECT e.name, p.passport_number
FROM employees e
INNER JOIN passports p ON e.id = p.employee_id;

SELECT u.username, r.name AS role_name
FROM users u
INNER JOIN roles r ON u.role_id = r.id;

SELECT i.title, c.name AS category
FROM items i
INNER JOIN categories c ON i.category_id = c.id;

