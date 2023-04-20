drop database hr;
create database hr;
use hr;
SELECT * FROM hr.employees where salary >= 5000;
SELECT * FROM employees WHERE last_name LIKE 'L%';
SELECT * FROM hr.departments where location_id = 1700;
SELECT * FROM hr.employees where department_id = 90;
SELECT city FROM hr.locations where country_id = 'US';