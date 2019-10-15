CREATE TABLE employee_copy as SELECT * FROM employees WHERE job_id = 'SA_REP'; 

MERGE INTO employees_copy c using (select * from employees) e ON (c.employee_id = e.employee_id)
WHEN MATCHED THEN 
UPDATE SET 
c.first_name = e.first_name, 
c.last_name = e.last_name
DELETE WHERE department_id IS NULL
WHEN NOT MATCHED THEN 
INSERT VALUES(e.employee_id, e.first_name, e.last_name, e.email, e.phone_number, e,hire_date, e,job_id, e.salary, e.commission_pct,
e.manager_id, e.department_id); 
