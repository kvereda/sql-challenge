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