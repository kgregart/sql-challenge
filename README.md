# sql-challenge

# Background

As a new data engineer at Pewlett Hackard (a fictional company) the first major task is to do a research project about people whom the company employed during the 1980s and 1990s. All that remains of the employee database from that period are six CSV files.

Design the tables to hold the data from the CSV files, import the CSV files into a SQL database, and then answer questions about the data. 

# Instructions

Perform data modeling, data engineering, and data analysis.

## Data Modeling

Inspect the CSV files, and then sketch an Entity Relationship Diagram of the tables. 

![ERP](https://github.com/kgregart/sql-challenge/blob/main/EmployeeSQL/ERD/QuickDBD-SQL%20Challenge.png)

## Data Engineering

1. Use the provided information to create a table schema for each of the six CSV files. Be sure to do the following:

    - Remember to specify the data types, primary keys, foreign keys, and other constraints.

    - For the primary keys, verify that the column is unique. Otherwise, create a composite keyLinks to an external site, which takes two primary keys to uniquely identify a row.

  - Be sure to create the tables in the correct order to handle the foreign keys.

2. Import each CSV file into its corresponding SQL table.

## Data Analysis

1. List the employee number, last name, first name, sex, and salary of each employee.

![Q1](https://github.com/kgregart/sql-challenge/blob/main/Images/Q1.png)

2. List the first name, last name, and hire date for the employees who were hired in 1986.

![Q2](https://github.com/kgregart/sql-challenge/blob/main/Images/Q2.png)

3. List the manager of each department along with their department number, department name, employee number, last name, and first name.

![Q3](https://github.com/kgregart/sql-challenge/blob/main/Images/Q3.png)

4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

![Q4](https://github.com/kgregart/sql-challenge/blob/main/Images/Q4.png)

5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

![Q5](https://github.com/kgregart/sql-challenge/blob/main/Images/Q5.png)

6. List each employee in the Sales department, including their employee number, last name, and first name.

![Q6](https://github.com/kgregart/sql-challenge/blob/main/Images/Q6.png)

7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

![Q7](https://github.com/kgregart/sql-challenge/blob/main/Images/Q7.png)

8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

![Q8](https://github.com/kgregart/sql-challenge/blob/main/Images/Q8.png)
