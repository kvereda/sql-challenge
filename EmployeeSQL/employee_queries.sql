--Queries 1-8
--Employee information (employee number,last name, first name, gender, salary)

Select employees.emp_no, 
		employees.last_name,
		employees.first_name,
		employees.sex,
		salaries.salary
from employees
inner join salaries on 
employees.emp_no = salaries.emp_no
;

--Employees who were hired after 1986 by first name, last name and hired date

Select employees.emp_no, 
		employees.last_name,
		employees.first_name,
		employees.hire_date 
from employees 
where hire_date between '1985-12-31' and '1987-01-01';

--Manager information (department number, department name, employee number, last name, first name )
Select dept_manager.dept_no,
		departments.dept_name,
		dept_manager.emp_no,
		employees.last_name,
		employees.first_name
from dept_manager
inner join departments on
dept_manager.dept_no = departments.dept_no
inner join employees on 
dept_manager.emp_no = employees.emp_no
;

--Employee work site information (employee number, last name, first name, and department name).

Select employees.emp_no,
		employees.last_name,
		employees.first_name,
		dept_emp.dept_no,
		departments.dept_name
from employees
inner join dept_emp on
employees.emp_no = dept_emp.emp_no
inner join departments on
departments.dept_no = dept_emp.dept_no
;

--Employees name Hercules B (employee number, last name, first name, sex)

select employees.emp_no,
	employees.last_name,
	employees.first_name,
	employees.sex
from employees
where first_name = 'Hercules'
and last_name like 'B%'
;

--Employees from Sales (employee number, last name, first name, and department name).
Select employees.emp_no,
		employees.last_name,
		employees.first_name,
		dept_emp.dept_no,
		departments.dept_name
from employees
inner join dept_emp on
employees.emp_no = dept_emp.emp_no
inner join departments on
departments.dept_no = dept_emp.dept_no
where dept_name = 'Sales'
;

--Employees from Sales and Development(employee number, last name, first name, and department name).
Select employees.emp_no,
		employees.last_name,
		employees.first_name,
		dept_emp.dept_no,
		departments.dept_name
from employees
inner join dept_emp on
employees.emp_no = dept_emp.emp_no
inner join departments on
departments.dept_no = dept_emp.dept_no
where dept_name = 'Sales'
or dept_name = 'Development'
;
--Employees sharing last name in descending order.

select last_name, count(last_name)
from employees
group by last_name
order by count(last_name) desc
;