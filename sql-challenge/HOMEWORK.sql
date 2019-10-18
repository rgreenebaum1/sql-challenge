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


--Data Analysis

-- 1.) List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;


-- 2.)List employees who were hired in 1986.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';


-- 3.) List the manager of each department with the following information: 
--department number
--department name
--the manager's employee number
--last name 
--first name
--start and
--employment dates
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, empoyees.last_name, employees.first_name, dept_manager.from_date, dept_manager.to_date
FROM departments
JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
JOIN employees
ON employees.emp_no = dept_manager.emp_no;
--**Right now i am unable to get this to run... 
--the error is stating that i am trying to run/compare an integer to a varchar. 
--I thought I changed everything.. I still cannot figure it out!!!

-- 4.)List the department of each employee with the following information: 
--employee number
--last name
--first name
--department name
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no;


-- 5.) List all employees whose first name is "Hercules" and last names begin with "B."
SELECT last_name, first_name
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';


--6.) List all employees in the Sales department, including their 
--employee number
--last name
--first name
--department name
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

--7.) List all employees in the Sales and Development departments, including their 
--employee number
--last name
--first name
--department name
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales'
OR departments.dept_name = 'Development';


--8.) In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
SELECT last_name AS "Last name", COUNT(*)
FROM employees
GROUP BY last_name
ORDER BY COUNT(*) DESC;

--Sanity check to confirm the above query (Sudbeck = 222)
--SELECT COUNT(*) FROM employees
--WHERE last_name = 'Sudbeck';


--Thanks to github's bigbluey for some query references in the data analysis section
