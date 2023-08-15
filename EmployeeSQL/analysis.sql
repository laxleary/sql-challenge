--List the employee number, last name, first name, sex, and salary of each employee
SELECT emp_no, last_name, first_name, sex,
    (SELECT salary 
    FROM salaries
    WHERE employees.emp_no = salaries.emp_no)  
FROM employees;

--List the first name, last name, and hire date for the employees who were hired 
--in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE (hire_date BETWEEN '1986-01-01' AND '1986-12-31');

--List the manager of each department along with department number, department name, 
--employee number, last name, and first name
SELECT dept_no, emp_no, 
    (SELECT last_name
    FROM employees
    WHERE employees.emp_no = dept_manager.emp_no),
    (SELECT first_name
    FROM employees
    WHERE employees.emp_no = dept_manager.emp_no),
    (SELECT dept_name
    FROM departments
    WHERE departments.dept_no = dept_manager.dept_no)
FROM dept_manager;
--Could also be done with joins, which I will demonstrate on the next question

--List the department number for each employee along with that employee's employee
--number, last name, and first name
SELECT dept_emp.dept_no, dept_emp.emp_no, employees.last_name, employees.first_name
FROM dept_emp
INNER JOIN employees
ON employees.emp_no = dept_emp.emp_no;

--List first name, last name, and sex of each employee whose first name is Hercules
--and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number last
--name, and first name
SELECT emp_no, last_name, first_name
FROM employees
WHERE emp_no IN
    (SELECT emp_no
    From dept_emp
    WHERE dept_no = 
        (SELECT dept_no
        FROM departments
        WHERE dept_name = 'Sales'));

--List each employee in the Sales and Development departments, including their 
--employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments as d
INNER JOIN dept_emp as de
ON de.dept_no = d.dept_no
INNER JOIN employees as e
ON e.emp_no = de.emp_no
WHERE d.dept_name IN ('Development','Sales');

--List the frequency counts, in descending order, of all the employee last names
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;