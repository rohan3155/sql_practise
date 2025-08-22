-- Create a new database named 'mydb'
create database mydb;

-- Switch context to 'mydb' so all subsequent commands run inside it
use mydb;

-- Delete the database 'mydb' (be careful: this removes everything inside it)
drop database mydb;

-- Set database to READ ONLY mode (no writes allowed)
alter database mydb READ ONLY = 1;

-- Set database back to READ-WRITE mode
alter database mydb READ ONLY = 0;


-- Create a new table 'employees'
create table employees (
        employee_id int,                 -- Unique ID for each employee
        first_name varchar(50),          -- Employee's first name
        last_name varchar(50),           -- Employee's last name
        hourly_pay decimal(5,2),         -- Pay per hour (up to 999.99)
        hire_date date                   -- Hiring date
);

-- Fetch all data from employees
select * from employees;

-- Rename table 'employees' to 'workers'
rename table employees to workers;

-- Delete the 'employees' table (permanently removes it)
drop table employees;

-- Add a new column 'phone_number'
alter table employees 
add phone_number varchar(15);

-- Rename 'phone_number' column to 'email'
alter table employees 
rename column phone_number to email;

-- Change column type of 'email' to varchar(100)
alter table employees 
modify column email varchar(100);

-- Move 'email' column right after 'last_name'
alter table employees
modify email varchar(100) after last_name;

-- Drop 'email' column
alter table employees
drop column email;


-- Insert a single row into employees
insert into employees 
values 
(
        1,
        "rohan",
        "bhatia",
        999.12,
        "2025-02-12"
);

-- Insert multiple rows in one query
insert into employees
values
(5, 'John', 'Bhatia', 999.12, '2025-02-12'),
(2, 'Anita', 'Sharma', 120.50, '2024-11-05'),
(3, 'Vikram', 'Singh', 150.00, '2023-07-21'),
(4, 'Priya', 'Gupta', 110.75, '2025-01-18');

-- Insert with only specific columns
insert into employees (employee_id, first_name,last_name)
values(
        9,
        "rohan",
        "bhatia"
);

-- Select only first_name
select first_name from employees;

-- Select rows with employee_id = 1
select * from employees where employee_id = 1;

-- Select rows where employee_id > 1
select * from employees where employee_id > 1;

-- Select rows where hourly_pay is missing
select * from employees where hourly_pay is null;

-- Select rows where hourly_pay is present
select * from employees where hourly_pay is not null;


-- Disable auto-commit (transactions won’t be auto saved)
set autocommit = off;

-- Commit the transaction (save changes permanently)
commit;

-- Delete all rows from employees (table remains)
delete from employees;

-- Rollback changes (undo uncommitted operations)
rollback;

-- Insert into a test table with current date and time functions
insert into test 
values(
        current_date(),   -- Only date
        current_time(),   -- Only time
        now()             -- Date + Time
);


-- Create products table with unique constraint on product_name
create table products(
   product_id int,
   product_name varchar(25) unique,
   price decimal(4,2)
);

-- Add unique constraint on product_name (if not already defined)
alter table products 
add constraint
unique(product_name);

-- Create products table with NOT NULL on price
create table products(
   product_id int,
   product_name varchar(25) unique,
   price decimal(4,2) not null
);


-- Create employees table with CHECK constraint
create table employees (
        employee_id int,
        first_name varchar(50),
        last_name varchar(50),
        hourly_pay decimal(5,2),
        hire_date date,
        constraint chk_hourly_pay check(hourly_pay >= 10.00) -- Min wage = 10
);

-- Add a CHECK constraint
alter table employees
add constraint chk_hourly_pay check(hourly_pay >= 10.00);

-- Drop the CHECK constraint
alter table employees
drop check chk_hourly_pay;


-- Create employees table with DEFAULT hourly_pay
create table employees (
        employee_id int,
        first_name varchar(50),
        last_name varchar(50),
        hourly_pay decimal(5,2) default 10.00,  -- Default pay if not provided
        hire_date date,
        constraint chk_hourly_pay check(hourly_pay >= 10.00)
);

-- Change the default value of hourly_pay
alter table employees 
alter hourly_pay set default 10.00;


-- Create transactions table with syntax error (extra comma)
-- Fixed version below
create table transactions (
        transaction_id int primary key,
        transaction_date date,
        amount decimal(5, 2)
);

-- Add primary key constraint explicitly
alter table transactions
add constraint primary key(transaction_id);

-- Create transactions with AUTO_INCREMENT primary key
create table transactions (
        transaction_id int primary key auto_increment,
        transaction_date date,
        amount decimal(5, 2)
);
