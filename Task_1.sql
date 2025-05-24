CREATE DATABASE books_store;
CREATE TABLE books (
id SERIAL PRIMARY KEY,
name_book VARCHAR(255),
author_book TEXT,
year INT CHECK (year >= 0 AND year <= EXTRACT (YEAR FROM CURRENT_DATE))
);

INSERT INTO books VALUES ('Идиот', 'Федор Достаевский', 1869);
INSERT INTO books VALUES ('Капитанская дочка', 'Александр Пушкин', 1836);
SELECT * FROM books;

UPDATE books SET author_book = 'Вася Пупкин';
DELETE FROM books;