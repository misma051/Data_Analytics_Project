create table employees(
	emp_id int PRIMARY KEY,
	name varchar(50),
	age int,
	department varchar(50),
	salary decimal(10,2),
	hire_date DATE
);

insert into employees (emp_id,name,age,department,salary,hire_date) values 
	(1,'Alice',30,'HR',10500.00,'2022-05-10'),
	(2,'Syeve',20,'Finance',80500.00,'2022-05-10'),
	(3,'Bob',35,'IT',30500.00,'2022-05-10'),
	(4,'Charlie',28,'Marketing',60500.00,'2022-05-10'),
	(5,'David',40,'Marketing',50500.00,'2022-05-10'),
	(6,'Eva',25,'Finance',70500.00,'2022-05-10'),
	(7,'Frank',32,'IT',60500.00,'2022-05-10'),
	(8,'Grace',22,'Marketing',50500.00,'2022-05-10'),
	(9,'Hank',45,'Sales',44500.00,'2022-05-10'),
	(10,'Ivy',30,'Sales',12500.00,'2022-05-10'),
	(11,'Abhi',35,'Games',55000.00,'2022-05-10');


select * from employees;

-- Querying the data

-- To select and see a particular fields or data we use "WHERE" clause as showin in below

select * from employees where department = 'Marketing';				--only wants to see marketing dept

select * from employees where department <> 'Marketing';			--wants to check other than markiting team 





--Using Alias name

Select emp_id, name as emp_name from employees ;					-- Storing the name in a temporary name i.e., emp_name





--Arithmetic Expressions in query

select emp_id,
	name as emp_name,
	salary as Monthly_Sal,											-- In this querry we are just going to do arithmetic operation like (+,-,*,/)
	salary * 12 as Annual_Sal From employees ;					




--Question: Retrieve employees name, their monthly salary and 10% bonous for the salary

select emp_id,
	name as emp_name,
	salary as Monthly_Sal,
	salary *0.1 as Bonous from employees ;



-- Filtering the date with where cluase or different condtions.
-- Retrieve employes in the IT dept with a salary greater than 20000.

select * from employees where department = 'IT' and salary > 20000 ;				-- Here we are using "AND" as an condition to check the both conditions are met

-- Retrieve employes in the IT dept with a salary greater than 20000.

select * from employees where department = 'IT' or salary > 20000 ;				-- Here we are using "OR" as an condition to check either any one conditions are met


-- Q: Salary Between 30000 and 60000.
																				-- Here we are using "BETWEEN" as an condition to check the 
select * from employees where salary between 30000 and 60000 ;

-- Using 'IN' in where condition.

select * from employees where department in('IT','Marketing');					-- Here we are using "IN" in WHere clause to get the output from the particular condition 

-- Using 'Not IN' in where condition
select * from employees where department not in ('Finanace','IT');				-- Here we are using "NOT IN" in WHere clause to get the output from the particular condition

-- Using LIKE condition

	--%<letter> ending letter of the word
	--<letter>% Starting letter of the word
	--%<letter>% letter can be in any where of the word

Select name, department, salary from employees									-- LIKE condition is used to check the querry with a particullar letter is availble or not
	where name like '%e';


Select name, department, salary from employees									-- LIKE condition is used to check the querry with a particullar letter is availble or not
	where name not like '%e';




--29/06/2025
---------------- Q and A ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Q.1 Retrieve employee names and their monthly salary with a column alias.
Select 
	name as Emp_Name,
	salary as Monthly_Sal
From employees;


--Q.2 Retrieve employee names and their annual salary with alias name.
Select 
	name as Emp_Name,
	salary * 12 as Annual_Sal
From employees;

--Q.3 Retrieve employee names, salaries and 20 % bonus.
Select
	name as Emp_name,
	salary as Monthly_sal,
	salary *0.20 as Bonus
From employees;

select * from employees;

--Q.4 employees in Hr dept or salary > 50000
select	
	department,
	salary as Monthly_sal
From employees
where 
	department = 'HR' or salary > 50000;


--Q.5 not in HR dept
select	
	name as empl_name,
	department,
	salary as Monthly_sal
From employees
where 
	department <>'HR';

--Q.6 employee name send with e
select 
	name as empl_name
From employees
where
 	name like '%e';

	 
--Q.7 salary between 20000 and 50000
select	
	name as Emp_name,
	department,
	salary as Monthly_sal
From employees
where 
	salary between 20000 and 50000;



----------------------------------------------------------------------
select * from employees;
-- Using In

-- Retrieve employees who work in both IT and sales

select name as emp_name,
	department 
From employees
where department IN ('IT','Marketing');


--- sorting of data 

select * from employees										-- using ascending order (ASC)
order by name asc;


select * from employees
order by emp_id desc;										-- using descending order (DESC)




------Sorting with multiple columns

select * from employees										-- if we want to check for multiple columns
order by department asc, salary desc;



select * from employees										-- if we want to check for multiple columns
order by department desc, salary asc;


-------- Creating a new department table 

create table departments
	( dept_id int Primary Key,
	dept_name varchar(50)
	)

insert into departments(dept_id,dept_name) values 
	(1,'HR'),
	(2,'Finanace'),
	(3,'IT'),
	(4,'Marketing'),
	(5,'Sales'),
	(6,'Operations'),
	(7,'Legal'),
	(8,'Support'),
	(9,'Engineering'),
	(10,'Ressearch');


select * from departments;
Select * from employees;
	
---------------------------------------- joins ----------------------------

-- 1.Inner Joins : It will gives only the matched item from both the tables.
/* Syntax:
			select * from table_1
			INNER JOIN table_2 ON table_2.Column = table_1.Coulmn; */

select * from employees
inner join departments on departments.dept_name = employees.department
order by emp_id;

select * from employees AS A
inner join departments AS B on B.dept_name = A.department							---- Using alias names to tables.
order by emp_id;



select A.emp_id,
		A.name,
		A.department,
		B.dept_id 
from employees AS A
inner join departments AS B on B.dept_name = A.department							---- Using only selected cloumn names using alias names to column too.
order by emp_id;


select 
		employees.emp_id,
		employees.name,
		employees.department,
		departments.dept_id 
from employees
inner join departments on departments.dept_name = employees.department	---- Using only selected cloumn names without using alias names to column too.
where employees.department = 'IT'
order by emp_id;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 2. Left Join : It get all the data from left table and takes the common from the right.
					--will be getting null value if there is no matching from the right to left.

/* Syntax:
			select * from table_1
			LEFT JOIN table_2 ON table_2.Column = table_1.Coulmn; */


select A.emp_id,
		A.name,
		A.department,
		B.dept_id,
		B.dept_name
from employees AS A
left join departments AS B on B.dept_name = A.department							---- Using only selected cloumn names using alias names to column too.
order by emp_id;


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 3. Right Join : It get all the data from right table and takes the common from the right.
					--will be getting null value if there is no matching from the left to right.

/* Syntax:
			select * from table_1
			RIGHT JOIN table_2 ON table_2.Column = table_1.Coulmn; */


select A.emp_id,
		A.name,
		A.department,
		B.dept_id,
		B.dept_name
from employees AS A
right join departments AS B on B.dept_name = A.department							---- Using only selected cloumn names using alias names to column too.
order by emp_id;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--4.FULL OUTER JOIN : It get all the data from bot right table and left table.

/* Syntax:
			select * from table_1
			FULL OUTER JOIN table_2 ON table_2.Column = table_1.Coulmn; */


select A.emp_id,
		A.name,
		A.department,
		B.dept_id,
		B.dept_name
from employees AS A
full outer join departments AS B on B.dept_name = A.department							---- Using only selected cloumn names using alias names to column too.
order by emp_id;
 

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Select * from employees;
Select * from departments;

--Q.1 Write  a query to retrieve the name of employees along with their department names. Include only employees who blongs to a department.

select A.emp_id,
+		A.name,
		A.department
from employees A
inner join departments B on A.department = B.dept_name;

--Q.2 Write a query to retrieve all employees and their department names, Include employees even if they do not belong to any department.
select A.emp_id,
		A.name,
		A.department,
		B.dept_id
from employees A
left join departments B on A.department = B.dept_name;

--Q.3 Write a query to retrieve all departments and the names of employees who work in those departments. Include departments even if they have no employees.
select A.emp_id,
		A.name,
		A.department,
		B.dept_id
from employees A
right join departments B on A.department = B.dept_name;

--Q.4 Write a query to retrieve all employees and all departments, includeing employees without departments and departments without employees.
select A.emp_id,
		A.name,
		A.department,
		B.dept_id
from employees A
full outer join departments B on A.department = B.dept_name;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select * from employees;
select * from departments;


--05/07/2025

--Aggregating and grouping.

--1.Aggregation
-- COUNT, SUM , AVG, MAX, MIN.

select count(emp_id) from employees; 								--------- give the how many count in department

select count(*) from employees;										--------- give the overall count of the table how many records present in it

select count(distinct department) from employees;					--------- gives the unique(removes the duplicate values) count of the column or it shows the count of grouped values 

select distinct department from employees;							--------- give the name of the unique values like in this example it will show what are the departments present in the table.


select 
	sum(salary) Total_sal											--------- Give the toatl salary by adding all the values
from employees;

select 
	avg(salary) Avg_sal												---------- Give the average salary 
from employees;

select 
	round(avg(salary),2) Avg_sal									----------- Give the avaerage salary and round it of to 2 decimal points.
from employees;


select 
	min(salary) min_sal												------------ Give the minimum salary from the salary table.
from employees;

select 
	max(salary) max_sal												------------ Give the maximum salary from the salary table.
from employees;

select 
	min(age) as minimum_age
from employees;

select
	max(age) as max_age
from employees;


------2. Group BY

select
	department
from employees													--------- It is used to group the column with their column name. it is used while we are using aggregation function like sum,count.....
group by department;


select 
	department,
	count(*) as no_agents										--------- It is getting the total number employees working under each department.
from employees
group by department;


select 
	department,
	sum(salary) as total_sal
from employees
group by department;

select
	department,
	round(avg(salary),2) as Avg_Sal
from employees
group by department;

select 
	department,
	min(salary) as min_sal
from employees
group by department;


select 
	department,
	max(salary) as max_sal
from employees
group by department;

select 
	department,
	min(age) as min_age
from employees
group by department;


select 
	department,
	max(age) as max_age
from employees
group by department;


select 
	department,
	count(*) as no_agent,
	sum(salary) as Total_sal,
	round(avg(salary),2) as avg_sal,
	min(salary) as min_sal,
	max(salary) as max_sal,
	min(age) as min_age,
	max(age) as max_avg
from employees
group by department;

------------------------------------------------------------------------------------------------------------------------------------------------
--06/07/2025 Q & A

-- Q.1 write a query to count the number of employees in each department.

Select 
	department,
	count(*) as no_agent
	
From employees
group by department;

-- Q.2 Write a query to find the minimum and max salary in the sales department.4

select 
	department,
	min(salary) as Min_sal,
	max(salary) as Max_sal
from employees
where department = 'Sales'
group by department;

select * from employees;

--Q.3 write a querry to find the average salary spent per department for employee who are 25 years old or older.

select
	age,
	department,
	count(*) as no_agent,
	round(avg(salary),2) as Avg_sal
from employees
where age >= 25
group by department,age;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
--06/07/2025

-- HAVING CLAUSE

select 
	department,
	round(avg(salary),2) as avg_sal
from employees																-- having cluase will be used instaed of where condition when ever we use "GROUP BY". In this scenario we wanted
group by department															--	we wanted retrive avg salary for the department and that avg salary should be greater the 20000
having avg(salary) > 20000;


--Find the departments with more than 2 employees.

select 
	department,
	count(*) as no_agent
from employees
group by department
having count(*) > 2;

-- Find the departments where the total salary expenditure is greater than 50000

select
	department,
	sum(salary) as toatl_sal
from employees
group by department
having sum(salary) > 50000;

-- Find the departments :  where the average salary > 30000 and count of employee > 1

select 
	department,
	round(avg(salary),2) as avg_sal,
	count(*) as no_agent
from employees
group by department
having avg(salary) > 30000 and count(*) > 1


-- Find the departments :  where the average salary > 30000 and count of employee > 1 and age >= 25

select 
	department,
	round(avg(salary),2) as avg_sal,
	count(*) as no_agent
from employees
where age >=25
group by department
having avg(salary) > 30000 and count(*) > 1

select * from employees;
------------------------------------------------------------ SUBQUERIES -----------------------------------------------------------------
/* Subqueries : It is nothing but writing a query inside a query. It is nothing but first getting a data from table and we can use another query to retrive to over condition
				We can write the subquerie where ever we want like we write it after SELECT , WHERE, as table_name */

-- Example : 

Select * from employees
where salary > (
select 
	round(avg(salary)) as avg_sal
from employees);


--Q.1 Retrieve the employee name, salary and the difference between their salary and the average salary.

Select 
	name,
	salary as monthly_sal,
	salary - (select round(avg(salary)) as avg_sal from employees ) as difference
from employees ;


Select * from employees;
Select * from departments
--------------------------------------------------------------------------------------------------------------------------------

--Q.1 Write a querry to retrieve departments that have no employees.

Select
	d.dept_id as Department_ID,
	d.dept_name as Department_name,
	e.name as employee_name
from departments d
left join employees e on e.department = d.dept_name
where e.name is null


--Q.2 Write a query to retrieve employees whose salary is greater than the highest salary in the "Finance" department 

select 
name as employee_name,
salary as monthly_sal
from employees
where salary >=(Select max(salary) as salary from employees group by department having department = 'Finance')

--Q.3 Write a querry to retrieve dept_id that have more than 2 employees
select * from employees;
select * from departments

select 
	d.dept_id as Department_id,
	d.dept_name as Department
from departments d
inner join employees e on e.department = d.dept_name
where department =(select 
						department,count(name)
					from employees
					group by department
					having count(name) > 2)

--USing only group by and having clause

select 
	e.department,count(e.name),d.dept_id
from employees as e
inner join departments d on d.dept_name = e.department
group by department,dept_id
having count(name) > 2;


Select * from employees order by emp_id;
Select * from departments;
----------------------------------------------------------------------------
--Updating a specific record.

/* Syntax ;
update <table_name>
set <col_name> = value
where condition*/

update employees 
set salary = 10500
where emp_id = 2;

update employees
set department = 'Marketing'
where emp_id = 1;
----------------------------------------------------
--Updating a table name.

/* Syntax;

Alter table <table_name>
Rename to <new_table_name>; 
*/

-------------------------------------------------
--Updatin a column name from the table.

/* Syntax;
alter table <table_name>
rename <column_name> to <new_col_name>
*/

alter table employees
rename name to emp_name;

select * from employees

-------------------------------------------------------
--Updating a column data type
/* Syntax;
alter table <table_name>
alter <column_name> type <new_data_type>
*/

alter table employees
alter emp_name type varchar(50)

select *from employees

----------------------------------------------------------
/*Transaction : Is nothing but if you are not sure whethere the data is to updated or not for
				for completly you can use this function

				Syntax :

				Begin 

				updating syntax like update <table_name> set <column_name)

				Commit;         -- It is used to subit once the data is sure it should be updated. Because once you are updated teh value u cant change using transaction


Rollback;		-- It is used to go back if the changes to be undo before using commit.
*/

Begin

update employees
set department = 'Marketing'
where emp_id = 7 ;

Commit

Rollback

------------------------------------------------------------------------------



/* 

DML : Data manipulation langauge

	1. INSERT : Adds new data into a table

		Syntax :

	2. UPDATE : Modifies existing data

		Syntax : 	update <table_name>
					set <col_name> = value
					where condition

		Example :	update employees 
					set salary = 10500
					where emp_id = 2;
	
	3.DELETE : Removes a particular data from column

		Syntax :
				DELETE FROM <table_name> where condition;

		Example :
				Delete from employees where department = 'Games'


--------------------------------------------------------------------------------

DQL : Data Query Language.

	Select : used to retrieves the data
---------------------------------------------------------------------------------

TCL : Transaction control language.

	1.BEGIN : It used to start the transaction.

	2.Commit - Saves changes.

	3.ROLLBACK : Reverts the changes.

	4.Savepoint : Sets a point to roll back to .

Example:

Begin

update employees
set department = 'Sales'
where emp_id = 7

Savepoint step1;

update employees
set department = 'IT'
where emp_id = 1

rollback step1;

commit;
*/
-------------------------------------------------------------------------
select * from employees
select * from departments

-- subquery in from

select emp_id, emp_name from

(
	select
		d.dept_id,
		d.dept_name,
		e.emp_id,
		e.emp_name,
		e.age
	from departments d
	right join employees e on e.department = d.dept_name
)
where dept_id is null and dept_name is null


-- Q : Retrieve employees name, salary, average salary and the difference between salary and average salary.

select 
	emp_id,
	emp_name,
	salary as monthly_sal,
	(select round(avg(salary),2) from employees) as avg_sal,
	salary - round((select avg(salary) from employees),2) as salary_diff
from employees
order by 1

---------------------------------------------------------------

-- having clause 

--Q: Retrieve departmenst where the total salary is greater than 50000

Select
	department,
	sum(salary) as sal
from employees
group by department
having sum(salary) > 50000;

--write a query to retrieve departments where the total salary is greate than the salary of  sinanace department
--Using Group by with subquerry
Select
	department,
	sum(salary) as total_sal
from employees
group by department
having sum(salary) > (Select
							sum(salary)
						from employees
						group by department
						having department = 'Finance')


-- Using group by , subqerry & where
Select
	department,
	sum(salary) as total_sal
from employees
group by department
having sum(salary) > (Select
							sum(salary)
						from employees
						where department = 'Finance')


--- TCL : Transaction Control Language

Begin;

update employees
set department = 'IT'
where emp_id = 7;

update employees
set department = 'Finance'
where emp_id = 1;

Savepoint  day_1 ;

update employees
set department = 'Finance'
where emp_id = 10;

update employees
set department = 'IT'
where emp_id = 8;

Savepoint  day_2 ;

update employees
set department = 'Marketing'
where emp_id = 2;

update employees
set department = 'IT'
where emp_id = 11;

Savepoint  day_3 ;

rollback to day_1;

commit;

-------------------------------------------------------------------------------------------------------

--- Window Function : 

-- RANKING Function:
	--ROW_NUMBER() : 
		Select *,
			row_number() over (partition by department order by salary desc) as row_number
		From employees;


	--RANK :
		Select *,
			rank() over (partition by department order by salary desc) as row_number
		From employees;

	--DENSE_RANK :
		Select *,
			dense_rank() over (partition by department order by salary desc) as row_number
		From employees;

	-- NTILE(n): Divides rows into N groups as evenly as possible.
	
		Select *,
			ntile(2) over (order by salary) as split_group
		From employees;

--Aggregation Window Functions : 

	--SUM();
		select *,
			sum(salary) over (partition by department) as dept_total_salary
		From employees;

	--AVG()
		select *,
			avg(salary) over (partition by department) as dept_avg_salary
		From employees;

	--COUNT()
		select *,
			count(*) over (partition by department) as dept_total_count
		From employees;

select *,
		sum(salary) over (partition by department) as dept_total_salary,
		round((avg(salary) over (partition by department)),2) as dept_avg_salary,
		count(*) over (partition by department) as dept_total_count
From employees;

-- VALUE WINDOW FUNCTION:

	--LAG():
		Select *,
			lag(salary) over (order by hire_date) as prev_salary
		from employees;

	--LEAD():
		Select *,
			lead(salary) over (order by hire_date) as next_salary
		from employees;
--------------------------------------------------------------------------
--How to calculate a running total:

Select emp_name,
department,
hire_date,
salary,
sum(salary) over (order by department rows between unbounded preceding and current row)as row_total
from employees;