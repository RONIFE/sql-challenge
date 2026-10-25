--1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT
      em.emp_no AS employee_number,
    em.last_name,
    em.first_name,
    em.sex,
    s.salary
FROM employees AS em
INNER JOIN salaries AS s
    ON em.emp_no = s.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT
    first_name,
    last_name,
    hire_date
FROM employees
WHERE hire_date >= '1986-01-01'
  AND hire_date < '1987-01-01';

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT
    d.dept_no AS department_number,
    d.dept_name AS department_name,
    em.emp_no AS manager_employee_number,
    em.last_name,
    em.first_name
FROM departments AS d
INNER JOIN dept_manager AS dm
    ON d.dept_no = dm.dept_no
INNER JOIN employees AS em
    ON dm.emp_no = em.emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT
    em.emp_no AS employee_number,
    em.last_name,
    em.first_name,
    d.dept_name AS department_name
FROM employees AS em
INNER JOIN dept_emp AS de
    ON em.emp_no = de.emp_no
INNER JOIN departments AS d
    ON de.dept_no = d.dept_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT
    first_name,
    last_name,
    sex
FROM employees
WHERE first_name = 'Hercules'
  AND last_name LIKE 'B%';


--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT
    em.emp_no AS employee_number,
    em.last_name,
    em.first_name,
    d.dept_name AS department_name
FROM employees AS em
INNER JOIN dept_emp AS de
    ON em.emp_no = de.emp_no
INNER JOIN departments AS d
    ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';


--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT
    em.emp_no AS employee_number,
    em.last_name,
    em.first_name,
    d.dept_name AS department_name
FROM employees AS em
INNER JOIN dept_emp AS de
    ON em.emp_no = de.emp_no
INNER JOIN departments AS d
    ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

--8. List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.

SELECT
    last_name,
    COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;
