-- create tables
CREATE TABLE departments (
  dept_no VARCHAR(4) PRIMARY KEY,
  dept_name VARCHAR
);

CREATE TABLE titles (
  title_id VARCHAR(5) PRIMARY KEY,
  title VARCHAR
);

CREATE TABLE employees (
  emp_no int PRIMARY KEY,
  emp_title_id VARCHAR(5), 
  FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
  birth_date DATE,
  first_name VARCHAR,
  last_name VARCHAR,
  sex VARCHAR(1),
  hire_date DATE
);

CREATE TABLE salaries (
  emp_no int PRIMARY KEY,
  salary int
);

CREATE TABLE dept_emp (
  emp_no int, 
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  dept_no VARCHAR(4), 
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE dept_manager (
  dept_no VARCHAR(4),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  emp_no int PRIMARY KEY 
);

