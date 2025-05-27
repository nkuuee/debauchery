postgres=# CREATE DATABASE oh;
CREATE DATABASE
postgres=# CREATE TABLE departments (
postgres(# id SERIAL PRIMARY KEY,
postgres(# name VARCHAR(255)
postgres(# );
CREATE TABLE
postgres=# CREATE TABLE employees (
postgres(# id SERIAL PRIMARY KEY,
postgres(# name VARCHAR(255),
postgres(# department_id INT REFERENCES departments(id)
postgres(# );
CREATE TABLE
postgres=# INSERT INTO departments (name) VALUES ('IT'),
postgres-# ('Marketing'),
postgres-# ('HR');
INSERT 0 3
postgres=# INSERT INTO employees (name, department_id) VALUES ('Nick', 1),
postgres-# ('Julia', 2),
postgres-# ('Max', 3);
INSERT 0 3
postgres=# SELECT*
postgres-# FROM departments
postgres-# LEFT JOIN employees
postgres-# ON departments.id = employees.department_id;
 id |   name    | id | name  | department_id
----+-----------+----+-------+---------------
  1 | IT        |  1 | Nick  |             1
  2 | Marketing |  2 | Julia |             2
  3 | HR        |  3 | Max   |             3
(3 ёЄЁюъш)


postgres=# SELECT *
postgres-# FROM departments
postgres-# RIGHT JOIN employees
postgres-# ON departments.id = employees.department_id;
 id |   name    | id | name  | department_id
----+-----------+----+-------+---------------
  1 | IT        |  1 | Nick  |             1
  2 | Marketing |  2 | Julia |             2
  3 | HR        |  3 | Max   |             3
(3 ёЄЁюъш)


postgres=# SELECT *
postgres-# FROM departments
postgres-# FULL JOIN employees
postgres-# ON departments.id = employees.department_id;
 id |   name    | id | name  | department_id
----+-----------+----+-------+---------------
  1 | IT        |  1 | Nick  |             1
  2 | Marketing |  2 | Julia |             2
  3 | HR        |  3 | Max   |             3
(3 ёЄЁюъш)


postgres=# SELECT *
postgres-# FROM departments
postgres-# CROSS JOIN employees;
 id |   name    | id | name  | department_id
----+-----------+----+-------+---------------
  1 | IT        |  1 | Nick  |             1
  1 | IT        |  2 | Julia |             2
  1 | IT        |  3 | Max   |             3
  2 | Marketing |  1 | Nick  |             1
  2 | Marketing |  2 | Julia |             2
  2 | Marketing |  3 | Max   |             3
  3 | HR        |  1 | Nick  |             1
  3 | HR        |  2 | Julia |             2
  3 | HR        |  3 | Max   |             3
(9 ёЄЁюъ)


postgres=# UPDATE departments
postgres-# SET name = 'graphic designer'
postgres-# WHERE id = 2;
UPDATE 1
postgres=# UPDATE employees
postgres-# SET name = 'Julia'
postgres-# WHERE id = 2;
UPDATE 1
postgres=# SELECT * FROM employees;
 id | name  | department_id
----+-------+---------------
  1 | Nick  |             1
  3 | Max   |             3
  2 | Julia |             2
(3 ёЄЁюъш)


postgres=# SELECT *
postgres-# FROM departments
postgres-# RIGHT JOIN employees
postgres-# ON departments.id = employees.department_id;
 id |       name       | id | name  | department_id
----+------------------+----+-------+---------------
  1 | IT               |  1 | Nick  |             1
  3 | HR               |  3 | Max   |             3
  2 | graphic designer |  2 | Julia |             2
(3 ёЄЁюъш)

postgres=# SELECT *
postgres-# FROM departments
postgres-# RIGHT JOIN employees
postgres-# ON departments.id = employees.department_id;
 id |       name       | id | name  | department_id
----+------------------+----+-------+---------------
  1 | IT               |  1 | Nick  |             1
  3 | HR               |  3 | Max   |             3
  2 | Graphic designer |  2 | Julia |             2
(3 ёЄЁюъш)
postgres=# SELECT *
postgres-# FROM departments
postgres-# LEFT JOIN employees ON departments.id = employees.department_id
postgres-# WHERE employees.id IS NULL;
 id | name | id | name | department_id
----+------+----+------+---------------
(0 ёЄЁюъ)


postgres=# CREATE TABLE teens (
postgres(# id SERIAL PRIMARY KEY,
postgres(# name VARCHAR(255),
postgres(# gender VARCHAR(255)
postgres(# );
CREATE TABLE

                      ^
postgres=# INSERT INTO teens (name, gender) VALUES
postgres-# ('Петро', 'Мужской'),
postgres-# ('Юлия', 'Женский'),
postgres-# ('Василий', 'Мужской'),
postgres-# ('Евгения', 'Женский'),
postgres-# ('Валентин', 'Мужской');
INSERT 0 5

                                      ^
postgres=# SELECT t1.name AS boy, t2.name AS girl
postgres-# FROM teens t1
postgres-# CROSS JOIN teens t2
postgres-# WHERE t1.gender = 'M' AND t2.gender = 'F'
postgres-#   AND t1.name < t2.name;
 boy | girl
-----+------
(0 ёЄЁюъ)