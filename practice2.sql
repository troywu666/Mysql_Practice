SELECT
	* 
FROM
	employees AS e
	JOIN employees AS d ON e.department_id = d.department_id where e.last_name like "%Taylor%";	
SELECT DISTINCT
	concat(first_name, " ", last_name) AS "full_name",
	job_title,
	department_name
FROM
	job_history
	JOIN departments USING (department_id)
	JOIN jobs USING (job_id)
	join employees using (employee_id)
WHERE
	start_date >= '1993-01-01' 
	AND end_date <= '1997-08-31';
	
FROM
	employees AS e
	JOIN departments AS d USING department_id
	JOIN jobs AS j USING job_id
	JOIN job_history AS h USING employee_id 
WHERE
	h.start_date >= '1993-01-01' 
	AND h.end_date <= '1997-08-31';
SELECT DISTINCT
    job_title,
    department_name,
    first_name,
    last_name,
    start_date
FROM
    job_history
        JOIN
    jobs USING (job_id)
        JOIN
    departments USING (department_id)
        JOIN
    employees USING (employee_id)
WHERE
    start_date >= '1993-01-01'
        AND start_date <= '1997-08-31'; 
select job_title, concat(first_name, " ", last_name) as full_name, salary-max_salary from employees join jobs using (job_id);
select department_name, AVG(salary), count(employee_id) 
from departments join employees using (department_id) where commission_pct != 0 group by department_name;
select job_title, concat(first_name, " ", last_name) as full_name from employees join jobs using(job_id) 
where commission_pct >0 and department_id = 80;
select country_name, city, department_name from countries join locations using(country_id) join departments using(location_id);
select department_name, concat(first_name, " ", last_name) as full_name 
from departments as d join employees as e on d.manager_id = e.employee_id;
select job_title, avg(salary) from employees join jobs using(job_id)  group by job_title;
select jh.* from job_history as jh join employees as e using(job_id) where e.salary >=12000;
select country_name, city, count(department_id) from countries join locations using(country_id) join departments using(location_id) 
where department_id in (select department_id from employees group by department_id having count(employee_id)>=2);
select concat(e.first_name," ", e.last_name) as full_name, l.city from departments as d join locations as l using(location_id) 
join employees as e on d.manager_id = e.employee_id;
select employee_id, job_title, end_date-start_date as working_days from job_history join jobs using(job_id) where department_id = 80;
select concat(first_name, " ",last_name) as full_name, salary 
from employees join departments using (department_id) join locations using(location_id)where city = "London";
select concat(first_name," ",last_name) as full_name, job_title start_date, end_date from employees join jobs using(job_id) 
left join job_history using(employee_id) where commission_pct = 0;
select department_name, count(employee_id) as employee_counts from departments join employees using(department_id) group by department_name;
select concat(first_name, " ", last_name) as full_name, country_id, country_name from employees join departments using(department_id)
join locations using(location_id) join countries using(country_id);