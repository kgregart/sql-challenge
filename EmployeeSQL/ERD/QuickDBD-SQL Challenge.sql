-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- SQL Challenge

CREATE TABLE "Departments" (
    "Dept_No" VARCHAR(5)   NOT NULL,
    "Dept_Name" VARCHAR(25)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "Dept_No"
     )
);

CREATE TABLE "Dept_Emp" (
    "Emp_No" INT   NOT NULL,
    "Dept_No" VARCHAR(5)   NOT NULL
);

CREATE TABLE "Dept_Manager" (
    "Dept_No" VARCHAR(5)   NOT NULL,
    "Emp_No" INT   NOT NULL
);

CREATE TABLE "Employees" (
    "Emp_No" INT   NOT NULL,
    "Emp_Title_ID" VARCHAR(10)   NOT NULL,
    "Birth_Date" DATE   NOT NULL,
    "First_Name" VARCHAR(25)   NOT NULL,
    "Last_Name" VARCHAR(25)   NOT NULL,
    "Sex" VARCHAR(1)   NOT NULL,
    "Hire_Date" DATE   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "Emp_No"
     )
);

CREATE TABLE "Salaries" (
    "Emp_No" INT   NOT NULL,
    "Salary" INT   NOT NULL
);

CREATE TABLE "Titles" (
    "Title_ID" VARCHAR(10)   NOT NULL,
    "Title" VARCHAR(25)   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "Title_ID"
     )
);

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_Emp_No" FOREIGN KEY("Emp_No")
REFERENCES "Employees" ("Emp_No");

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_Dept_No" FOREIGN KEY("Dept_No")
REFERENCES "Departments" ("Dept_No");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_Dept_No" FOREIGN KEY("Dept_No")
REFERENCES "Departments" ("Dept_No");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_Emp_No" FOREIGN KEY("Emp_No")
REFERENCES "Employees" ("Emp_No");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_Emp_Title_ID" FOREIGN KEY("Emp_Title_ID")
REFERENCES "Titles" ("Title_ID");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_Emp_No" FOREIGN KEY("Emp_No")
REFERENCES "Employees" ("Emp_No");

