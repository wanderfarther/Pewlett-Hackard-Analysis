-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.first_name, e.last_name, e.sex, s.salary
FROM employees e, salaries s
WHERE s.emp_no = e.emp_no

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1985-12-31' AND '1986-12-31';

-- List the manager of each department along with their department number, department name, employee number, last name, 
-- and first name.
SELECT d.dept_no, d.dept_name, man.emp_no, e.last_name, e.first_name 
FROM departments d, dept_manager man, employees e
WHERE man.emp_no = e.emp_no AND man.dept_no = d.dept_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name,
-- and department name.
SELECT de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de, employees e, departments d
WHERE d.dept_no = de.dept_no AND de.emp_no = e.emp_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT emp_no, last_name, first_name
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

-- List each employee in the Sales and Development departments, including their employee number, last name, first name,
-- and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
	INNER JOIN employees
	ON dept_emp.emp_no=employees.emp_no
	INNER JOIN departments
	ON dept_emp.dept_no=departments.dept_no;
	
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development'

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each
-- last name).
SELECT COUNT (first_name), last_name
FROM employees
GROUP BY last_name
ORDER BY (COUNT(first_name)) DESC;

