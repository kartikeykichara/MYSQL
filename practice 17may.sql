use ajay;
select * from employees;


-- Let me know your preferred location.Rank employees by salary.

-- Rank employees within each department by salary.
select *,
rank()over(partition by department order by salary)
from employees;

-- Use ROW_NUMBER() to assign a unique row ID to each employee.
select *,
row_number() over(order by emp_id)
from employees;


-- Use DENSE_RANK() to handle ties in salary ranking.
select *,
dense_rank() over(order by salary)
from employees;


-- Calculate running total of salary by department.
select *,
sum(salary) over(partition by department order by salary)
from employees;

-- Get cumulative salary of each employee by month.
SELECT *,
       SUM(salary_paid) OVER (PARTITION BY emp_id ORDER BY month) AS emp_running_total
FROM salaries;

select * from salaries;

-- Find percent rank of employees by salary.
SELECT *,
       PERCENT_RANK() OVER (ORDER BY salary DESC) AS percent_ran
FROM employees;


-- Get previous month's salary using LAG().
select *,
lag(salary_paid) over(partition by emp_id order by month)
from salaries;

-- Get next month's salary using LEAD().
select *,
lead(salary_paid) over(partition by emp_id order by month)
from salaries;

-- Calculate difference in salary between months.
SELECT *,
       salary_paid - LAG(salary_paid) OVER (PARTITION BY emp_id ORDER BY month) AS salary_diff
FROM salaries;




-- Rank employees by total hours worked.
select *,
rank() over(partition by emp_id order by hours_worked)
from projects;

select * from projects;

-- Find top 2 earners per department.
SELECT *
FROM (
    SELECT *,
           RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rank_in_dept
    FROM employees
) AS ranked
WHERE rank_in_dept <= 2;

-- Compute moving average salary over 2 months.
SELECT *,
       AVG(salary_paid) OVER (
           PARTITION BY emp_id
           ORDER BY month
           ROWS BETWEEN 1 PRECEDING AND CURRENT ROW
       ) AS moving_avg_salary
FROM salaries;




-- Compare each employee's salary with department average.

SELECT *,
       AVG(salary) OVER (PARTITION BY department) AS dept_avg_salary,
       salary - AVG(salary) OVER (PARTITION BY department) AS salary_vs_dept_avg
FROM employees;
