-- Employee Database SQL Challenge
-- Create the six tables for the Employee Database.

CREATE TABLE departments (
dept_no VARCHAR(4) PRIMARY KEY,
dept_name VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE titles (
title_id VARCHAR(5) PRIMARY KEY,
title VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE employees (
emp_no INTEGER PRIMARY KEY,
emp_title_id VARCHAR(5) NOT NULL,
birth_date DATE NOT NULL,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
sex CHAR(1),
hire_date DATE NOT NULL,
FOREIGN KEY (emp_title_id)
REFERENCES titles(title_id)
);

CREATE TABLE salaries (
emp_no INTEGER PRIMARY KEY,
salary INTEGER NOT NULL,
FOREIGN KEY (emp_no)
REFERENCES employees(emp_no)
);

CREATE TABLE dept_emp (
emp_no INTEGER,
dept_no VARCHAR(4),
PRIMARY KEY (emp_no, dept_no),
FOREIGN KEY (emp_no)
REFERENCES employees(emp_no),
FOREIGN KEY (dept_no)
REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager (
dept_no VARCHAR(4),
emp_no INTEGER,
PRIMARY KEY (dept_no, emp_no),
FOREIGN KEY (dept_no)
REFERENCES departments(dept_no),
FOREIGN KEY (emp_no)
REFERENCES employees(emp_no)
);