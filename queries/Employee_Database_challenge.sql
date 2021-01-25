-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (______) _____,
______,
______,
______

INTO nameyourtable
FROM _______
ORDER BY _____, _____ DESC;



-- check tables: Employees, titles
SELECT * FROM employees
SELECT * FROM titles

-- Delieverable 1:The Number of Retiring Employees by Title
-- Querry: Retiring Employees By Title
-- Create table for retirement titles by employees
SELECT e.emp_no, e.first_name, e.last_name,
t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees as e
LEFT JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- check table
SELECT * FROM retirement_titles;

-- Query: Create "Unique" titles tables, filter through duplicates 	
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name, 
last_name, 
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC;

-- check table
SELECT * FROM unique_titles;

--Query: Retireve number of Employees by most recent job title, create table
SELECT COUNT (title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT (title) DESC;

-- check table
SELECT * FROM retiring_titles;

-- Deliverable 2:The Employees Eligible for the Mentorship Program
-- Query: Create Mentorship Eligibilty Table
SELECT  DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name, e.last_name, 
	e.birth_date, de.from_date,
	de.to_date, t.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no=de.emp_no)
INNER JOIN  titles as t
ON (e.emp_no=t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (de.to_date ='9999-01-01')
ORDER BY e.emp_no;

-- Deliverable 3: Filter Per Department, by Title, By Count
-- Additional Script
    SELECT COUNT(ut.emp_no), ut.title, d.dept_name 
    INTO retiring_dept
    FROM unique_titles as ut
    INNER JOIN dept_emp as de
    ON (ut.emp_no=de.emp_no)
    INNER JOIN departments as d
    ON (de.dept_no = d.dept_no)
    GROUP BY (d.dept_name, ut.title);