DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments(
    dept_no varchar(4) PRIMARY KEY,
    dept_name varchar(30) NOT NULL
);


CREATE TABLE titles(
    title_id varchar(5) PRIMARY KEY, 
    title varchar(30) NOT NULL
);

CREATE TABLE employees(
    emp_no integer PRIMARY KEY,
    emp_title_id varchar(10) NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id), 
    birth_date date NOT NULL,
    first_name varchar(30) NOT NULL,
    last_name varchar(30) NOT NULL,
    sex varchar(1) NOT NULL,
    hire_date date NOT NULL
);

CREATE TABLE dept_emp(
    emp_no integer NOT NULL, 
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    dept_no varchar(4) NOT NULL, 
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    CONSTRAINT dept_emp_id PRIMARY KEY (emp_no,dept_no)
);

CREATE TABLE salaries(
    emp_no integer NOT NULL, 
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    salary integer NOT NULL,
    CONSTRAINT salary_id PRIMARY KEY (emp_no, salary)
);

CREATE TABLE dept_manager(
    dept_no varchar(4) NOT NULL, 
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    emp_no integer NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no), 
    CONSTRAINT manager_id PRIMARY KEY (dept_no, emp_no)
);

-- Then import the data from the csv files using PgAdmin