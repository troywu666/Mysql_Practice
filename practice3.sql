select concat(first_name," ", last_name) as full_name, salary from employees
where salary > (select distinct salary from employees where last_name like '%Bull%');
select salary from employees where last_name like '%Bull%';
select concat(first_name, " ", last_name) as full_name from employees join departments using(department_id) where department_name = 'IT';
select concat(first_name, " ", last_name) as full_name from employees 
where department_id in (select distinct department_id from departments where department_name = 'IT');
select concat(first_name," ", last_name) as full_name from employees where manager_id in
(select employee_id from employees where department_id in
(select department_id from departments where location_id in
(select location_id from locations where country_id ='US')));
select concat(first_name," ", last_name) as full_name from employees where employee_id in 
(select manager_id from employees);
select first_name, last_name from employees where salary>(select AVG(salary) from employees);
select first_name, last_name from employees as e where salary=
(select min_salary from jobs as j where j.job_id = e.job_id);
select first_name, last_name from employees where salary >
(select avg(salary) from employees) and department_id = 
(select department_id from departments where department_name = 'IT');
select distinct salary, first_name, last_name from employees where salary>
(select salary from employees where first_name like "%Bell%" or last_name like "%Bell%");
select first_name, last_name from employees where salary = 
(select min(salary) from employees);
select first_name, last_name,e.salary, avgs.avg_salary from 
 (select department_id, avg(salary) as avg_salary from employees GROUP BY department_id) as avgs 
 right join employees as e using(department_id) where e.salary > avgs.avg_salary;
select first_name, last_name from employees where salary > all
(select salary from employees where job_id = 'SH_CLERK') order by salary;
select e.first_name, e.last_name from employees as e where not exists
(select e.first_name, e.last_name from employees as m where e.employee_id = m.manager_id);
select employee_id, first_name, last_name from employees as e join
(select department_id, avg(salary) as avg_salary from employees group by department_id) as avgs
using (department_id) where avgs.avg_salary < e.salary;
select department_id, first_name, last_name from employees as e where salary>
(select avg(salary) from employees as m where m.department_id = e.department_id GROUP BY department_id);
select distinct salary from employees ORDER BY salary desc limit 5;
select distinct t1.salary from employees as t1 where 5 = 
(select count(distinct t2.salary) from employees as t2 where t1.salary <= t2.salary);
select distinct t1.salary from employees as t1 where 4=
(select count(distinct t2.salary) from employees as t2 where t2.salary <= t1.salary);
select * from employees ORDER BY employee_id desc limit 10;
select department_name from departments where department_id not in 
(select department_id from employees);
select distinct salary from employees order by salary desc limit 3;
select distinct t1.salary from employees as t1 where 5 = 
(select count(distinct t2.salary) from employees as t2 where t1.salary <= t2.salary);