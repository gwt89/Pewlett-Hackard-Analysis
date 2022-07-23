-- Deliverable 1
SELECT e.emp_no,
       e.first_name,
       e.last_name,
       t.title,
       t.from_date,
       t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titles
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31') AND de.to_date = '9999-01-01'
ORDER BY emp_no, title DESC;

--retrieve the number of employees by their most recent title who are about to retire
SELECT COUNT(title) count, title
INTO retiring_titles
FROM unique_titles
GROUP BY (title) 
ORDER BY count DESC

-- Deliverable 2
-- write a query to create a Mentorship Eligibility table that holds the employees who are eligible to participate in a mentorship program
SELECT DISTINCT ON(e.emp_no) e.emp_no, 
    e.first_name, 
    e.last_name, 
    e.birth_date,
    de.from_date,
    de.to_date,
    t.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

-- Additional Queries
SELECT COUNT(title) count, title
INTO mentor_count_title
FROM mentorship_eligibilty
GROUP BY (title) 
ORDER BY count DESC;

SELECT DISTINCT ON (emp_no)
        ce.emp_no, 
        ce.first_name,
        ce.last_name,
        ti.title,
        ti.from_date,
        ti.to_date
INTO current_retirement_titles
FROM current_emp as ce
INNER JOIN titles as ti
ON ce.emp_no = ti.emp_no
ORDER BY emp_no, from_date DESC;

-- create a table of current eligible retiring employees
SELECT COUNT(title) count, title
INTO current_count_title
FROM current_retirement_titles
GROUP BY (title) 
ORDER BY count DESC;