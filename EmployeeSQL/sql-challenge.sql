CREATE TABLE departments(
	dept_no varchar	(30) not null,
	dept_name varchar (30) not null,
	primary key (dept_no)
);

select * from departments

CREATE TABLE dept_emp (
	emp_no varchar (10) not null,
	dept_no varchar (10) not null,
	Foreign key (emp_no) References employees(emp_no),
	Foreign key (dept_no) References departments (dept_no)
 );
 
select * from dept_emp

CREATE TABLE dept_manager (
	dept_no varchar (10) not null,
	emp_no varchar (10) not null,
	Foreign key (emp_no) References employees(emp_no),
	Foreign key (dept_no) References departments (dept_no)
);

select * from dept_manager 

CREATE TABLE employees (
	emp_no varchar (10) not null,
	emp_title varchar (10) not null,
	birth_date varchar (10) not null,
	first_name varchar (40) not null,
	last_name varchar (40) not null,
	sex varchar (3) not null,
	hire_date date not null,
	primary key (emp_no)
);

select * from employees

CREATE TABLE salaries (
	emp_no varchar (10) not null,
	salary varchar (10) not null,
	Foreign key (emp_no) References employees(emp_no)
);

select * from  salaries 

CREATE TABLE titles (
	title_id varchar (10) not null,
	title varchar (30) not null
);

select * from titles

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
where hire_date between '1/1/1986' and '12/31/1986'
order by hire_date asc
;

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

