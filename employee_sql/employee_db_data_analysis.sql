
--- 1).List the employee number, last name, first name, sex, and salary of each employee.

SELECT employees.emp_no, employees.last_name, employees.first_name, 
employees.sex, salaries.salary FROM employees
LEFT  JOIN salaries ON employees.emp_no = salaries.emp_no;

--2). List the first name, last name, and hire date for the employees who were hired in 1986.

--SELECT * FROM employees
SELECT employees.first_name, employees.last_name, employees.hire_date 
FROM employees where hire_date > '1985-12-31' AND hire_date < '1987-01-01';

--3). List the manager of each department along with their department number, department name, 
--employee number, last name, and first name.

SELECT departments.dept_no, departments.dept_name AS dept_manager, employees.emp_no, 
employees.last_name, employees.first_name FROM dept_manager 
JOIN departments ON departments.dept_no = dept_manager.dept_no
JOIN employees ON employees.emp_no = dept_manager.emp_no;
 
 --4). List the department number for each employee along with that employee’s employee number, 
 --last name, first name, and department name.
 
 SELECT departments.dept_no, departments.dept_name, employees.emp_no, 
 employees.last_name, employees.first_name FROM dept_emp 
 JOIN departments ON dept_emp.dept_no = departments.dept_no
 JOIN employees ON dept_emp.emp_no = employees.emp_no; 
 
 --5). List first name, last name, and sex of each employee whose first name 
 --is Hercules and whose last name begins with the letter B.
 SELECT employees.first_name, employees.last_name, employees.sex 
 FROM employees WHERE employees.first_name = 'Hercules' 
 AND employees.last_name LIKE 'B%';
 
 --6). List each employee in the Sales department, including 
 --their employee number, last name, and first name.
 
SELECT departments.dept_name, employees.emp_no, employees.last_name, 
employees.first_name FROM employees JOIN dept_emp 
ON employees.emp_no = dept_emp.emp_no 
JOIN departments ON departments.dept_no = dept_emp.dept_no 
WHERE departments.dept_name = 'Sales';

---7). List each employee in the Sales and Development departments, 
---including their employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp JOIN employees ON dept_emp.emp_no = employees.emp_no 
JOIN departments ON departments.dept_no = dept_emp.dept_no 
WHERE departments.dept_name in ('Sales','Development');

---8). List the frequency counts, in descending order, of all the employee last names 
---(that is, how many employees share each last name).

Select last_name, Count (last_name)
From Employees
Group By last_name
Order by count DESC;



SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp JOIN employees ON dept_emp.emp_no = employees.emp_no 
JOIN departments ON departments.dept_no = dept_emp.dept_no 
WHERE departments.dept_name in ('Sales','Development');


---7. List the frequency counts, in descending order, of all the employee last names 
---(that is, how many employees share each last name).

Select last_name, Count (last_name)
From Employees
Group By last_name
Order by count DESC;
