-- Select the employee number, last name, first name, sex, and salary of all employees, ordered by employee number
SELECT employees.emp_no,
		employees.last_name,
		employees.first_name,
		employees.gender,
		salaries.salary
FROM employees
INNER JOIN salaries ON employees.emp_no = salaries.emp_no
;
-- Select the first name, last name, and hiring date for all employees hired in 1986 
SELECT first_name,
		last_name,
		hire_date
FROM employees
WHERE hire_date >= '1986-01-01' and hire_date <= '1986-12-31'
;
-- Select the department number, department name, employee number, last name, and first name of all managers of each department
SELECT dept_manager.dept_no,
		departments.dept_name,
		dept_manager.emp_no,
		employees.last_name,
		employees.first_name
FROM dept_manager
INNER JOIN departments on dept_manager.dept_no = departments.dept_no
INNER JOIN employees on employees.emp_no = dept_manager.emp_no
;
-- Select the employee number, last name, first name, and department of each employee, ordered by employee number
SELECT employees.emp_no,
		employees.last_name,
		employees.first_name,
		departments.dept_name
FROM employees
INNER JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no
;
-- Select first name, last name, birth date, and sex of all employees whose first name is "Hercules" and last name begins with a "B"
SELECT first_name,
		last_name,
		gender
FROM employees
WHERE first_name = 'Hercules' and last_name LIKE 'B%'
;
-- Select employee number, last name, first name, and department name of all employees in the Sales department, ordered by employee number
SELECT employees.emp_no,
		employees.last_name,
		employees.first_name,
		departments.dept_name
FROM employees
INNER JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales'
ORDER BY emp_no
;
-- Select employee number, last name, first name, and department name of all employees in the 'Sales' OR the 'Development' department, ordered by employee number
SELECT employees.emp_no,
		employees.last_name,
		employees.first_name,
		departments.dept_name
FROM employees
INNER JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development'
ORDER BY emp_no
;
-- Count the number of employees, grouped by last name
SELECT employees.last_name, COUNT(employees.emp_no)
FROM employees 
GROUP BY employees.last_name
;
