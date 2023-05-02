USE
	hr;
SELECT
	salary
FROM employees
	WHERE first_name = 'Lex'
    AND last_name = 'De Haan';
    
SELECT
	*
FROM employees
	WHERE job_id = 'FI_ACCOUNT'
    AND salary <= 8000;
    
SELECT
	*
FROM employees
	WHERE last_name LIKE '%kk%'
    OR last_name LIKE '%ll%';
    
SELECT
	*
FROM employees
	WHERE commission_pct IS NULL;
    
SELECT
	*
FROM employees
    WHERE department_id = 90
    OR department_id = 110;
    -- WHERE department_id = 80 --!!! there is mistake, couse in employees Table is no such a value as departament_id 80
    
SELECT
	*
FROM employees
	WHERE salary BETWEEN 5000 AND 7000;

