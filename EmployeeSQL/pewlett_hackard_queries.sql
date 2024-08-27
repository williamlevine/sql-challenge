--List the employee number, last name, first name, sex, and salary of each employee.

SELECT
	e.emp_no AS "Employee Number",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	e.sex AS "Sex",
	s.salary AS "Salary"
FROM employees AS e
JOIN salaries AS s ON e.emp_no=s.emp_no
;

--List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT
	first_name AS "First Name",
	last_name AS "Last Name",
	hire_date AS "Hire Date"
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986
;

--List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT
	m.dept_no AS "Department Numer",
	d.dept_name AS "Department Name",
	m.emp_no AS "Employee Number",
	e.last_name AS "Last Name",
	e.first_name AS "First Name"
FROM dept_manager AS m
JOIN departments AS d ON m.dept_no=d.dept_no
JOIN employees AS e ON m.emp_no=e.emp_no
;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT
	de.dept_no AS "Department Number",
	de.emp_no AS "Employee Number",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	d.dept_name AS "Department Name"
FROM dept_emp AS de
JOIN employees AS e ON de.emp_no=e.emp_no
JOIN departments AS d ON de.dept_no=d.dept_no
;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT
	first_name AS "First Name",
	last_name AS "Last Name",
	sex AS "Sex"
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
;

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT
	emp_no AS "Employee Number",
	last_name AS "Last Name",
	first_name AS "First Name"
FROM employees
WHERE emp_no IN
(
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN
	(
		SELECT dept_no
		FROM departments
		WHERE dept_name = 'Sales'
	)
);

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT
	e.emp_no AS "Employee Number",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	d.dept_name AS "Department Name"
FROM employees AS e
JOIN dept_emp AS de ON e.emp_no = de.emp_no
JOIN departments AS d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
;

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT
	last_name AS "Last Name",
	COUNT (emp_no)
FROM employees
GROUP BY last_name
ORDER BY COUNT(emp_no) DESC
;
