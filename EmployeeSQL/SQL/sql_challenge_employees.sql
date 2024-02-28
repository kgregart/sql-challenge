---Drop tables
DROP TABLE IF EXISTS "Departments", "Dept_Emp", "Dept_Manager", "Employees", "Salaries", "Titles";

-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- SQL Challenge

CREATE TABLE "Departments" (
    "dept_no" VARCHAR(5)   NOT NULL,
    "dept_name" VARCHAR(25)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Dept_Emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(5)   NOT NULL
);

CREATE TABLE "Dept_Manager" (
    "dept_no" VARCHAR(5)   NOT NULL,
    "emp_no" INT   NOT NULL
);

CREATE TABLE "Employees" (
    "emp_no" INT   NOT NULL,
    "emp_title_id" VARCHAR(10)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(25)   NOT NULL,
    "last_name" VARCHAR(25)   NOT NULL,
    "sex" VARCHAR(1)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL
);

CREATE TABLE "Titles" (
    "title_id" VARCHAR(10)   NOT NULL,
    "title" VARCHAR(25)   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_Emp_No" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_Dept_No" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_Dept_No" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_Emp_No" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_Emp_Title_ID" FOREIGN KEY("emp_title_id")
REFERENCES "Titles" ("title_id");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_Emp_No" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

---Load tables

SELECT * FROM "Departments";
SELECT * FROM "Dept_Emp";
SELECT * FROM "Dept_Manager";
SELECT * FROM "Employees";
SELECT * FROM "Salaries";
SELECT * FROM "Titles";

---List the employee number, last name, first name, sex, and salary of each employee 

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM "Employees" as e
JOIN "Salaries" as s
ON e.emp_no = s.emp_no;

---List the first name, last name, and hire date for the employees who were hired in 1986 
SELECT first_name, last_name, hire_date 
FROM "Employees" as e
WHERE hire_date BETWEEN '1/1/1986' AND '12/31/1986'
ORDER BY hire_date;

---List the manager of each department along with their department number, department name, employee number, last name, and first name 
SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM "Departments" as d
JOIN "Dept_Manager" as dm
ON d.dept_no = d.dept_no
JOIN "Employees" as e
ON dm.emp_no = e.emp_no;


---List the department number for each employee along with that employee’s employee number, last name, first name, and department name 
SELECT de.emp_no, e.last_name, e.first_name, e.last_name, d.dept_name
FROM "Dept_Emp" as de
JOIN "Employees" as e
ON de.emp_no = e.emp_no
JOIN "Departments" as d
ON de.dept_no = d.dept_no;

---List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B 
SELECT e.first_name, e.last_name, e.sex
FROM "Employees" as e
WHERE first_name = 'Hercules'
AND last_name Like 'B%'

---List each employee in the Sales department, including their employee number, last name, and first name 
SELECT d.dept_name, de.emp_no, e.last_name, e.first_name
FROM "Dept_Emp" as de
JOIN "Employees" as e
ON de.emp_no = e.emp_no
JOIN "Departments" as d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

---List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT d.dept_name, de.emp_no, e.last_name, e.first_name
FROM "Dept_Emp" as de
JOIN "Employees" as e
ON de.emp_no = e.emp_no
JOIN "Departments" as d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' 
OR d.dept_name = 'Development';

---List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) 
SELECT last_name,
COUNT(last_name) AS "frequency"
FROM "Employees"
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;