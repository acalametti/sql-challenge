# Employee SQL Challenge 

## Contributor: Alex Calametti

# Overview

The goal of this project was to utilized Postgres SQL to conduct queries pertaining to employee data. The main objectives include:composing an Entity Relationship Diagram, creating SQL tables, importing CSV files into tables, and answering questions using differnet queries. 

## Programs and Files 

- Postgres SQL
- CSV files (Resources Folder)
- Quick DBD: https://www.quickdatabasediagrams.com/

# Steps 

## Data Modeling 

To help with the creation of the tables in SQL, an Entity Relationship Diagram on the Quick DBD website was used to map out the relationships between columns in each CSV file that would be imported. An image of this diagram is included below. This was also useful for identifying primary and foreign keys.

![Screen Shot 2023-12-12 at 6 46 00 PM](https://github.com/acalametti/sql-challenge/assets/136642574/369dedd8-bcce-4e19-8335-dc541e1e61aa)

## Data Engineering 

Here were the steps taken to set up the SQL Database: 
- Create table shcema corresponding to each CSV file (import primary key tables first), including data type, primary, and foreign keys.
- CSV files were imported to their respective tables in the order they were created.

## Data Analysis 

Queries were conducted using joins and aggregate functions to answer the following questions: 

- List the employee number, last name, first name, sex, and salary of each employee.
- List the first name, last name, and hire date for the employees who were hired in 1986.
- List the manager of each department along with their department number, department name, employee number, last name, and first name.
- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
- List each employee in the Sales department, including their employee number, last name, and first name.
- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)

## Acknowledgements

Shoutout to my BCS learning assistant Will for helping me troublshoot issues with importing my CSV files. 
