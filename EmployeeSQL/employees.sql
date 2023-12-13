-- DROP ANY TABLES THAT MAY ALREADY EXIST
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_managers;
DROP TABLE IF EXISTS salaries; 
DROP TABLE IF EXISTS dept_emp; 
DROP TABLE IF EXISTS titles; 


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



---Begin queries 



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
SELECT 


--List the department number for each employee along with that employee’s employee number,
	--last name, first name, and department name
	
	
--List first name, last name, and sex of each employee whose first name is Hercules 
	--and whose last name begins with the letter B
	
	
--List each employee in the Sales department, including their employee number, last name, and first name


--List each employee in the Sales and Development departments, including their employee number, last name,
	--first name, and department name.


--List the frequency counts, in descending order, of all the employee last names
	--(that is, how many employees share each last name)

