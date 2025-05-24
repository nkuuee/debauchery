CREATE DATABASE many_to_one;

CREATE TABLE author (
id SERIAL PIRMARY KEY,
name VARCHAR(255)
);

CREATE TABLE books (
id SERIAL PIRMARY KEY,
book VARCHAR(255),
author_id INT PEREFERNCES author(id)
);