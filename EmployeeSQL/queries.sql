-- List the employee number, first&last name, sex, and salary of each employee
SELECT employees.emp_no, employees.first_name, employees.last_name, employees.sex,
  salaries.salary
  FROM employees
  INNER JOIN salaries
  ON employees.emp_no = salaries.emp_no;

-- first name, last name, hire date for employees hired in 1986
SELECT first_name, last_name, hire_date FROM employees
  WHERE hire_date >= '1986-01-01' AND hire_date < '1987-01-01';

-- list managers of each department, along with dept number, dept name, emp number,
-- last name, and first name
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, 
  employees.last_name, employees.first_name
  FROM dept_manager
  INNER JOIN departments
  ON dept_manager.dept_no = departments.dept_no
  INNER JOIN employees
  ON dept_manager.emp_no = employees.emp_no;

-- list dept number for each employee, along with employee number, first & last name,
-- and department name
SELECT dept_emp.dept_no, dept_emp.emp_no, employees.first_name, employees.last_name,
  departments.dept_name
  FROM dept_emp
  INNER JOIN employees
  ON dept_emp.emp_no = employees.emp_no
  INNER JOIN departments
  ON dept_emp.dept_no = departments.dept_no;

-- list first name, last name, sex of each employee with first name Hercules
-- and last name starting with a B
SELECT first_name, last_name, sex FROM employees
  WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- list each employee in the Sales department, including first & last name and
-- employee number
SELECT employees.first_name, employees.last_name, employees.emp_no, 
  dept_emp.dept_no 
  FROM employees
  JOIN dept_emp
  ON employees.emp_no = dept_emp.emp_no
  WHERE dept_emp.dept_no IN 
  (
    SELECT dept_no
	FROM departments
	WHERE dept_name = 'Sales'
  );

-- list each employee in Sales and Development departments, including their
-- employee number, first name, last name, department name
SELECT employees.first_name, employees.last_name, employees.emp_no, 
  dept_emp.dept_no, departments.dept_name
  FROM dept_emp
  JOIN employees
  ON dept_emp.emp_no = employees.emp_no
  JOIN departments
  ON dept_emp.dept_no = departments.dept_no
  WHERE dept_emp.dept_no IN 
  (
    SELECT dept_no 
	FROM departments
	WHERE dept_name = 'Sales' OR dept_name = 'Development'
  );

-- list frequency counts of each employee last name (how many employees share
-- each last name)
SELECT last_name, COUNT(last_name) as name_count
  FROM employees
  GROUP BY last_name
  ORDER BY COUNT(last_name) DESC;
