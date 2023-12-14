-- DROP ANY TABLES THAT MAY ALREADY EXIST

DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_managers;
DROP TABLE IF EXISTS salaries; 
DROP TABLE IF EXISTS dept_emp; 
DROP TABLE IF EXISTS titles; 

--CREATE TABLES AND IMPORT DATA --

--Create the departments table 
CREATE TABLE departments (
	dept_no VARCHAR PRIMARY KEY NOT NULL,
	dept_name VARCHAR NOT NULL
); 
--Check if table was created 
SELECT * FROM departments; 


--Create  the employees table 
CREATE TABLE employees (
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date DATE NOT NULL 
	);
--Check if table was created 
SELECT * FROM employees;


--create the titles table 
CREATE TABLE titles (
	title_id VARCHAR PRIMARY KEY NOT NULL,
	title VARCHAR NOT NULL
);
--Check if table was created
SELECT * FROM titles;


--create the dept_emp table 
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
--Check if table was created 
SELECT * FROM dept_emp


--Create salaries table 
CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
); 
--Check if table was created
SELECT * FROM salaries


--Create dept_manager table 
CREATE TABLE dept_manager(
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
--check if table was created
SELECT * FROM dept_manager; 



---BEGIN QUERIES---



--List employee number, last name, first name, sex, and salary of each employee 
SELECT empl.emp_no, empl.last_name, empl.first_name, empl.sex, sal.salary
FROM employees AS empl 
INNER JOIN salaries AS sal
ON sal.emp_no = empl.emp_no
ORDER BY 1; 


--List the first name, last name, and hire data for the employees who were hired in 1986
SELECT first_name, last_name, hire_date 
FROM employees 
WHERE hire_date BETWEEN '01-01-1986' AND '12-31-1986';


--List the manager of each department along with their department number, department name,
	--employee number, last name, and first name
SELECT empl.first_name, empl.last_name, dept_man.emp_no, dept_man.dept_no, dept.dept_name
FROM dept_manager AS dept_man
INNER JOIN departments AS dept
ON dept_man.dept_no = dept.dept_no
INNER JOIN employees as empl
ON dept_man.emp_no = empl.emp_no
ORDER BY 1; 


--List the department number for each employee along with that employee’s employee number,
	--last name, first name, and department name
SELECT dept_emp.dept_no, empl.emp_no, empl.last_name, empl.first_name, dept.dept_name
FROM employees AS empl
LEFT JOIN dept_emp AS dept_emp
ON empl.emp_no = dept_emp.emp_no
INNER JOIN departments AS dept
ON dept_emp.dept_no = dept.dept_no
ORDER BY 1; 
	
	
--List first name, last name, and sex of each employee whose first name is Hercules 
	--and whose last name begins with the letter B
SELECT first_name, last_name, sex
FROM employees 
WHERE (first_name = 'Hercules') AND ((last_name) LIKE 'B%')
ORDER BY first_name; 
	
	
--List each employee in the Sales department, including their employee number, last name, and first name
SELECT dept.dept_name, empl.first_name, empl.last_name, dept_e.emp_no 
FROM employees AS empl
INNER JOIN dept_emp AS dept_e
ON empl.emp_no = dept_e.emp_no
INNER JOIN departments AS dept 
ON dept_e.dept_no = dept.dept_no
WHERE (dept.dept_name) = 'Sales'
ORDER BY dept_e.emp_no;


--List each employee in the Sales and Development departments, including their employee number, last name,
	--first name, and department name.
SELECT dept.dept_name, dept_e.emp_no, empl.last_name, empl.first_name
FROM employees AS empl
INNER JOIN dept_emp AS dept_e 
ON empl.emp_no = dept_e.emp_no
INNER JOIN departments AS dept
ON dept_e.dept_no = dept.dept_no
WHERE ((dept.dept_name) = 'Sales') OR ((dept.dept_name) = 'Development')
ORDER BY dept_e.emp_no;


--List the frequency counts, in descending order, of all the employee last names
	--(that is, how many employees share each last name)
SELECT last_name, 
COUNT(*) AS frequency_count 
FROM employees
GROUP BY last_name
ORDER BY frequency_count DESC; 