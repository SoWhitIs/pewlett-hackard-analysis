# _Time For An Upgrade: Retirement Is *Nigh*!_ || Pewlett Hackard Employee Database Analysis

## Overview of Project

Pewlett Hackard, a large and long-standing company is taking an active approach as it will soon experience an imminent event—dubbed the _"silver tsunami”_ essentially, a mass retirement of its older employees. 

With this mass exodus, Pewlett Hackard will lose a significant amount of its workforce. 

In preparation, to keep track of the former it was decided that an overhaul in record-keeping, transitioning from VBA and Excel to SQL databases would be most efficient and effective for the company’s Human Resource Department needs. 

Analysis of present employee records (data) to build an employee database via SQL, including script based of of specific  criteria, were done from six existing CSV files to address the following questions:

    (1) How many employees, specifically, born between January 1, 1962 and December 31, 1965 will retire?  
        a. Subsequently, _who_ will _need_ retirement packages?

    (2) What roles will need to be filled in the future? 
        a. From which departments? 

    (3) Will a mentorship program _help_ with these transitional roles?

## Resources

• Data Source(s): .CSV files can be accessed under the [Data](https://github.com/SoWhitIs/pewlett-hackard-analysis/tree/main/data) folder

• Scripts: [Queries](https://github.com/SoWhitIs/pewlett-hackard-analysis/tree/main/queries) folder

• Software: PostgreSQL, 11 | pgAdmin, 4.29 | [Quick DBD](quickdatabasediagrams.com) | Visual Studio Code, 1.52. 1

## Results

### What we can _tell?_
* Notably, the majority or approximately **64%** of workforce retiring hold senior-level positions, i.e., Senior Engineer, Senior Staff.

<p align="center">
  <i><b> Retirement By Title, Count</b></i> 
 </p>
<p align="center">
  <img src="additionalresources/retirement_titles.png"/>
</p>

* With a difference of **4,900** employees or **11%**, respectively, there are nearly the same amount Engineering positions as there are Staff positions becoming vacant. 

* Creating a new table ([unquie_titles](data/unique_titles.csv)) to accurately  account for each individual employee, illustrated employees changed positions during their tenure. In fact out of **133, 776** "dups" or duplicate entries ntires on record, over **43,000** employees transitioned to new roles within the company. 

<p align="center">
  <i><b> Multiple Roles</b></i> 
 </p>
<p align="center">
  <img src="additionalresources/retirement_duplicates_multi_roles_.png"/>
</p>

 
## Summary 

There are close to 94,400 roles slated to re-open. To examine this further, scripts were created (to construct additional tables table) to gain additional insights as to which titles, per department by (pending) retiree count. Full breakdown of the former found, [here.](data/dept_title_5255.csv) _(Data may contain duplicate counts.)_

  
    -- Retirement Per Department, by Title, by Count, (Based on employees born between January 1, 1952 and December 31, 1955)

    SELECT DISTINCT ON (e.emp_no) dept_name, e.emp_no 
    INTO dept_title_A
    FROM Employees as e
    JOIN dept_emp as de
    ON (e.emp_no=de.emp_no)
    join Departments as d on
    de.dept_no = d.dept_no
    WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
    AND (de.to_date ='9999-01-01');
				   
    SELECT dt.dept_name , title,  COUNT(dt.emp_no)
    INTO dept_title_5255
    FROM dept_title_A as dt
    JOIN Titles t on
    dt.emp_no = t.emp_no
    GROUP BY dept_name , t.title;

   
<p align="center">
  <i><b> Retiree Count by Department and Title, Snapshot</b></i> 
 </p>
<p align="center">
  <img src="additionalresources/retiree_by_title_dept.png"/>

While there is a pool of over 1500  varied and experieced qualified candidates for a potential mentorship program, unfortunately there is, simply,  _not_ enough to service the influx of Pewlett Hackard's expectant tally of new-hires(further details, [here](data/dept_title_retire.csv)). 
 
A recommendation would be to expand the mentorship criteria to garner like candidates, who perhaps, have been with the company for shorter amount years (i.e., 5 to 15 years), widen the birthdate range, or even reach out to those who have since, or in recent retired. 

---
#### Author

_Whitney D. Gardner_
