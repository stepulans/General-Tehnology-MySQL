-- IN explayned by teacher of Summary
-- MAX and MIN by CHATGPT
-- The IN operator allows you to specify multiple values in a compact and concise way, instead of using multiple OR conditions. It can be used with a list of values or a subquery that returns a list of values.
-- MAX and MIN are aggregate functions that allow you to find the maximum and minimum values in a column, respectively. These functions are commonly used in conjunction with the GROUP BY clause to find the maximum or minimum values for each group.


SELECT
	department_id,
	MAX(
CASE
    WHEN salary > 10000 
		THEN 1 
    ELSE 0 
END
) AS has_high_earners
FROM employees
GROUP BY department_id;


SELECT
	department_id,
	MIN(
CASE
    WHEN salary <= 10000 
		THEN 0 
    ELSE 1 
END
) AS has_high_earners
FROM employees
GROUP BY department_id;


SELECT
	*
FROM employees
ORDER BY last_name;


SELECT
	*
FROM employees
ORDER BY salary DESC;


SELECT
	*
FROM employees
WHERE department_id IN (60, 90, 110)
ORDER BY last_name;


SELECT
	*
FROM employees
WHERE job_id LIKE 'ST_CLERK'
ORDER BY salary DESC;


SELECT
	*
FROM employees
WHERE first_name LIKE 'D%'
ORDER BY last_name;