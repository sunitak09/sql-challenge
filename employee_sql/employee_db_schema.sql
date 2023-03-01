--DROP TABLE IF EXISTS departments;
--DROP TABLE IF EXISTS dept_emp;
--DROP TABLE IF EXISTS dept_manager;
--DROP TABLE IF EXISTS employees;
--DROP TABLE IF EXISTS salaries;
--DROP TABLE IF EXISTS titles;

--Creating table, importing .CSV and assigning primary and foriegn keys

CREATE TABLE departments(
	PRIMARY KEY (dept_no),
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR(30) NOT NULL 
);
--SELECT * from dept_emp;

CREATE TABLE employees(
	PRIMARY KEY (emp_no),
	emp_no INT NOT NULL,
	emp_title_id VARCHAR NOT NULL,
	birth_date VARCHAR (30) NOT NULL,
	first_name VARCHAR (40) NOT NULL,
	last_name VARCHAR (40) NOT NULL,
	sex VARCHAR,
	hire_date DATE NOT NULL
);

CREATE TABLE salaries(
	PRIMARY KEY (emp_no),
	emp_no INT NOT NULL,
	salary INT NOT NULL
);

CREATE TABLE titles(
	PRIMARY KEY (title_id),
	title_id VARCHAR(30) NOT NULL,
	title VARCHAR (30) NOT NULL
);

CREATE TABLE dept_emp(
	PRIMARY KEY (dept_no),
	emp_no INT NOT NULL,
	dept_no VARCHAR(30)
);

--ALTER TABLE dept_emp
--DROP CONSTRAINT  dept_emp_pkey ;

--ALTER TABLE dept_emp
--ADD CONSTRAINT dept_emp_pkey PRIMARY KEY (dept_no) ;

CREATE TABLE dept_manager(
	PRIMARY KEY (dept_no),
	dept_no VARCHAR(30) NOT NULL,
	emp_no INT NOT NULL
);

ALTER TABLE dept_manager
DROP CONSTRAINT  dept_manager_pkey ;

ALTER TABLE dept_emp
ADD CONSTRAINT dept_emp_pkey PRIMARY KEY (dept_no) ;

--------

ALTER TABLE dept_emp
ADD CONSTRAINT FK_deptno
FOREIGN KEY (dept_no) REFERENCES departments(dept_no);

ALTER TABLE dept_emp
ADD CONSTRAINT FK_empno
FOREIGN KEY (emp_no) REFERENCES employees(emp_no);


ALTER TABLE dept_manager
ADD CONSTRAINT FK_deptno
FOREIGN KEY (dept_no) REFERENCES departments(dept_no);

ALTER TABLE employees
ADD CONSTRAINT FK_emp_title
FOREIGN KEY (emp_title_id) REFERENCES titles(title_id);


ALTER TABLE salaries
ADD CONSTRAINT FK_emp_no
FOREIGN KEY (emp_no) REFERENCES employees(emp_no);

---including their employee number, last name, first name, and department name.

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
