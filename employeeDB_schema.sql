Departments
-
dept_no varchar pk
dept_name varchar

Dept_Emp
-
emp_no pk FK >- Employees.emp_no
dept_no varchar pk FK >- Departments.dept_no
from_date
to_date

Dept_Managers
-
dept_no varchar pk fk - Departments.dept_no
emp_no pk fk - Employees.emp_no
from_date date
to_date date

Employees
-
emp_no pk
birth_date date
first_name varchar
last_name varchar
gender varchar
hire_date date

Titles
-
emp_no varchar pk FK >- Employees.emp_no
title pk
from_date date pk
to_date date

Salaries
-
emp_no pk FK - Employees.emp_no
salary
from_date date
to_date date