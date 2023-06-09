-- Найти количество сотрудников в каждом департаменте. Вывести departmentid и employeescnt

SELECT 
	department_id, 
	COUNT(employee_id) AS employeescnt
FROM employees
WHERE department_id IS NOT NULL
GROUP BY department_id;

-- Найти количество сотрудников в каждом департаменте. Вывести departmentname и employeescnt

SELECT
	t1.department_name,
    count(t2.employee_id) AS employeescnt
FROM departments t1
INNER JOIN employees t2
ON t1.department_id = t2.department_id
GROUP BY t1.department_name;

-- Найти количество сотрудников у каждого менеджера. Вывести managerid и employeescnt

SELECT
	manager_id,
    count(employee_id) AS employeescnt
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id;

-- Найти количество сотрудников у каждого менеджера. Вывести firstname,  lastname и employees_cnt

SELECT 
  t2.first_name, 
  t2.last_name, 
  COUNT(t1.employee_id) AS employees_cnt
FROM 
  employees t1
LEFT JOIN 
  employees t2 ON t1.manager_id = t2.employee_id
  WHERE t2.manager_id IS NOT NULL
GROUP BY 
  t2.first_name, 
  t2.last_name;
  
-- Найти максимальную зарплату в каждом департаменте. Вывести departmentid и maxsalary

SELECT
	department_id,
	max(salary)
FROM employees
WHERE department_id IS NOT NULL
GROUP BY department_id;

-- Найти сотрудников, у которых наибольшая зарплата в их департаменте
SELECT * FROM employees;
SELECT 
t1.employee_id, 
t1.first_name, 
t1.last_name, 
t1.department_id, 
t1.salary
FROM employees t1
WHERE t1.salary = (
  SELECT MAX(salary)
  FROM employees t2
  WHERE department_id = t1.department_id
);
