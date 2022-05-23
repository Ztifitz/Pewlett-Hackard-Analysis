-- Deliverable 1
--Creating the retirement titles table
select e.emp_no, e.first_name, e.last_name, tit.title, tit.from_date, tit.to_date
	into retirement_titles
	from employees as e
	join titles as tit
	on e.emp_no = tit.emp_no
	where (e.birth_date between '1952-01-01' and '1955-12-31')
	order by emp_no;


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title

INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

-- Count retiring titles
select count(emp_no), title
	into retiring_titles
	from unique_titles
	group by title 
	order by count(emp_no) desc;
	
-- Deliverable 2
-- Mentorship elegibility
select distinct on (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, tit.title
	into mentorship_elegibility
	from employees as e
	left join dept_emp as de
	on e.emp_no = de.emp_no
	left join titles as tit
	on e.emp_no = tit.emp_no
	where de.to_date = '9999-01-01'
	and (e.birth_date between '1965-01-01' and '1965-12-31')
	order by e.emp_no;
	
-- Summary extra query
select count(emp_no) from unique_titles;

select count(emp_no) from mentorship_elegibility;
