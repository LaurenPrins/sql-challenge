---- DATA ENGINEERING
---- Drop tables if existing
DROP TABLE titles
DROP TABLE departments
DROP TABLE employees
DROP TABLE salaries
DROP TABLE dept_emp
DROP TABLE dept_manager

----CREATE TABLES AND IMPORT CSVS
CREATE TABLE titles (
    title_id VARCHAR   NOT NULL,
    title VARCHAR   NOT NULL,
    CONSTRAINT pk_titles PRIMARY KEY (title_id));

CREATE TABLE employees (
    emp_no INT NOT NULL,
    emp_title_id VARCHAR NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    sex VARCHAR(2) NOT NULL,
    hire_date DATE NOT NULL,
    CONSTRAINT pk_employees PRIMARY KEY (emp_no),
	CONSTRAINT fk_employees_emp_title_id FOREIGN KEY (emp_title_id) REFERENCES titles(title_id));

CREATE TABLE departments (
    dept_no VARCHAR NOT NULL,
    dept_name VARCHAR NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (dept_no));

CREATE TABLE dept_emp (
    emp_no 	INT NOT NULL,
    dept_no VARCHAR NOT NULL,
    CONSTRAINT pk_dept_emp PRIMARY KEY (emp_no, dept_no),
	CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY(emp_no) REFERENCES employees (emp_no),
	CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY(dept_no) REFERENCES departments (dept_no));

CREATE TABLE dept_manager (
    dept_no VARCHAR NOT NULL,
    emp_no INT NOT NULL,
    CONSTRAINT pk_dept_manager PRIMARY KEY (dept_no, emp_no),
	CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY(emp_no) REFERENCES employees (emp_no),
	CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY(dept_no) REFERENCES departments (dept_no));

CREATE TABLE salaries (
    emp_no INT NOT NULL,
    salary INT NOT NULL,
    CONSTRAINT pk_salaries PRIMARY KEY (emp_no, salary),
	CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no) REFERENCES employees (emp_no));

---- Queries to confirm/see data
SELECT * FROM departments
SELECT * FROM dept_emp
SELECT * FROM dept_manager
SELECT * FROM employees
SELECT * FROM salaries
SELECT * FROM titles