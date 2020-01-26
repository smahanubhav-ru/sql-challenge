-- 1. Details of each employee
SELECT
	e.emp_no as "Employee Number",
	e.last_name as "Last Name",
	e.first_name as "First Name",
	e.gender as "Gender",
	s.salary as "Salary"
FROM employees as e
	JOIN salaries as s
		ON e.emp_no=s.emp_no
ORDER BY e.emp_no;

-- 2. Employees who were hired in 1986
SELECT
	first_name as "First Name",
	last_name as "Last Name"
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- 3. Manager of each department
SELECT
	dm.dept_no as "Department Number",
	d.dept_name as "Department Name",
	dm.emp_no as "Employee Number",
	e.last_name as "Last Name",
	e.first_name as "First Name",
	dm.from_date as "From Date",
	dm.to_date as "To Date"
FROM dept_manager AS dm
	INNER JOIN departments AS d
		ON (dm.dept_no = d.dept_no)
	INNER JOIN employees AS e
		ON (dm.emp_no = e.emp_no)
ORDER BY dm.dept_no, dm.from_date;

-- 4. Department of each employee
SELECT
	e.emp_no as "Employee Number",
	e.last_name as "Last Name",
	e.first_name as "First Name",
	d.dept_name as "Department Name"
FROM employees AS e
	INNER JOIN dept_emp AS de
		ON (e.emp_no = de.emp_no)
	INNER JOIN departments AS d
		ON (de.dept_no = d.dept_no)
ORDER BY e.emp_no;

-- 5. Employees whose first name is "Hercules" and last names begin with "B"
SELECT *
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6. All employees in the Sales department
SELECT
	e.emp_no as "Employee Number",
	e.last_name as "Last Name",
	e.first_name as "First Name",
	d.dept_name as "Department Name"
FROM employees AS e
	INNER JOIN dept_emp AS de
		ON (e.emp_no = de.emp_no)
	INNER JOIN departments AS d
		ON (de.dept_no = d.dept_no)
WHERE d.dept_name = 'Sales'
ORDER BY e.emp_no;

-- 7. All employees in the Sales and Development departments
SELECT
	e.emp_no as "Employee Number",
	e.last_name as "Last Name",
	e.first_name as "First Name",
	d.dept_name as "Department Name"
FROM employees AS e
	INNER JOIN dept_emp AS de
		ON (e.emp_no = de.emp_no)
	INNER JOIN departments AS d
		ON (de.dept_no = d.dept_no)
WHERE d.dept_name IN ('Sales', 'Development')
ORDER BY e.emp_no;

-- 8. Frequency count of employee last names in descending order
SELECT
	last_name as "Last Name",
	COUNT(last_name) as "Frequency Counts"
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;