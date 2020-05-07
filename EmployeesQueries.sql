--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no AS Employee_Number, 
employees.last_name, 
employees.first_name,
employees.sex,
salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

Select *
from employees

--3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
SELECT departments.dept_no AS Dept_Number,
departments.dept_name,
dept_manager.emp_no AS Emp_Number,
employees.last_name,
employees.first_name
FROM departments
INNER JOIN dept_manager ON
departments.dept_no = dept_manager.dept_no
INNER JOIN employees ON
dept_manager.emp_no = employees.emp_no;

--4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT employees.emp_no AS Emp_Number,
employees.last_name,
employees.first_name,
dept_emp.dept_no AS Dept_Number
FROM employees
INNER JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
departments.dept_no = dept_emp.dept_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name,
last_name,
sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
Select employees.emp_no as Emp_Number,
employees.last_name,
employees.first_name,
departments.dept_name
FROM employees
INNER JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
Select employees.emp_no as Emp_Number,
employees.last_name,
employees.first_name,
departments.dept_name
FROM employees
INNER JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
dept_emp.dept_no = departments.dept_no
WHERE dept_name IN ('Sales','Development');

--8. In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "Last_Name_Count"
FROM employees
Group by last_name
ORDER BY "Last_Name_Count" DESC;
