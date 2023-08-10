CREATE TABLE departments (
	dept_no varchar (4),
	dept_name varchar,
	PRIMARY KEY (dept_no)
);

CREATE TABLE titles (
	title_id varchar (5),
	title varchar,
	PRIMARY KEY (title_id)
);

CREATE TABLE employees (
	emp_no int,
	emp_title_id varchar (6),
	birth_date date,
	first_name varchar,
	last_name varchar,
	sex varchar (1),
	hire_date date,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
	PRIMARY KEY (emp_no)
);

CREATE TABLE dept_emp (
	emp_no int,
	dept_no varchar(4),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager (
	dept_no varchar (4),
	emp_no int,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE salaries (
	emp_no int,
	salary int,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
