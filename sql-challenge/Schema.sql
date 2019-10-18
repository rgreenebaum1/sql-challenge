--DATA ENGINEERING
--create tables and import csv files for each

--DEPARTMENTS
CREATE TABLE departments (
	dept_no VARCHAR,
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
	emp_no INT NOT NULL,
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

-- specify foreign keys

ALTER TABLE Dept_emp ADD CONSTRAINT fk_Dept_emp_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Dept_emp ADD CONSTRAINT fk_Dept_emp_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Dept_manager ADD CONSTRAINT fk_Dept_manager_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Dept_manager ADD CONSTRAINT fk_Dept_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Titles ADD CONSTRAINT fk_Titles_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);


-- Query * FROM Each Table Confirming Data
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;
