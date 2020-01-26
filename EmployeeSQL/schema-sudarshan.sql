-- Drop Tables if they exist in the database
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

-- Create base tables
CREATE TABLE departments (
	dept_no VARCHAR(10) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(100) NOT NULL
);

CREATE TABLE employees (
	emp_no INT PRIMARY KEY NOT NULL,
	birth_date Date NOT NULL,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	gender VARCHAR(10) NOT NULL,
	hire_date Date NOT NULL
);

-- Create dependent tables
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
		FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR(10) NOT NULL,
		FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	from_date Date NOT NULL,
	to_date Date NOT NULL
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(10) NOT NULL,
		FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INT NOT NULL,
		FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	from_date Date NOT NULL,
	to_date Date NOT NULL
);

CREATE TABLE salaries (
	emp_no INT NOT NULL,
		FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary INT NOT NULL,
	from_date Date NOT NULL,
	to_date Date NOT NULL
);

CREATE TABLE titles (
	emp_no INT NOT NULL,
		FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	title VARCHAR(100) NOT NULL,
	from_date Date NOT NULL,
	to_date Date NOT NULL
);