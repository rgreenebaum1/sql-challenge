--create tables and import csv files for each

--DEPARTMENTS
CREATE TABLE departments (
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR NOT NULL,
	CONSTRAINT pk_deparments PRIMARY KEY (
		dept_no
		)
);

SELECT *
FROM departments;

--dept_emp

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR,
	from_date DATE,
	to_date DATE
);

SELECT *
FROM dept_emp;

--dept_manager

CREATE TABLE dept_manager (
	dept_no VARCHAR,
	emp_no VARCHAR,
	from_date DATE,
	to_date DATE
);

SELECT *
FROM dept_manager;

--EMOLOYEES

CREATE TABLE employees (
	emp_no INT NOT NULL,
	birth_date VARCHAR,
	first_name VARCHAR,
	last_name VARCHAR,
	gender VARCHAR NOT NULL,
	hire_date DATE,
	CONSTRAINT "pk_employees" PRIMARY KEY (
	emp_no
	)
);

SELECT *
FROM employees;
	
-- SALARIES

CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary money,
	from_date DATE, 
	to_date DATE
);

SELECT *
FROM salaries;

--TITLES

CREATE TABLE titles (
	emp_no INT NOT NULL,
	title VARCHAR,
	from_date DATE,
	to_date DATE
);

SELECT *
FROM titles;

--Data Analysis

