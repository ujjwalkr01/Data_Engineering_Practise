--CASE Statement

create table demo(
  did int,
  name varchar(15),
  amount int,
  commission int
);

Insert into demo (did,name,amount,commission)
values (1,'Ujjwal',1000,8),(2,'Ankita',1500,10),(3,'Shruti',2000,null),(4,'Manoj',5000,5),(5,'Golu',500,null);

select * from demo;

select *, 
case when commission Is not null
  Then commission+1
  Else 2
End as comisn
from demo;

select *,
case when commission is null
  then round((amount * 2/100),2)
  else round((amount * (commission +1)/100),2)
end as comisn_amnt
from demo;

CREATE TABLE orders (
    order_id      INT PRIMARY KEY,
    order_date    DATE NOT NULL,
    customer_id   INT NOT NULL,
    order_status  VARCHAR(20) NOT NULL
);

INSERT INTO orders (order_id, order_date, customer_id, order_status) VALUES
(1, DATE '2024-01-05', 101, 'PLACED'),
(2, DATE '2024-01-06', 102, 'SHIPPED'),
(3, DATE '2024-01-07', 103, 'DELIVERED'),
(4, DATE '2024-01-08', 101, 'CANCELLED'),
(5, DATE '2024-01-10', 104, 'PLACED'),
(6, DATE '2024-01-12', 105, 'SHIPPED'),
(7, DATE '2024-01-15', 102, 'DELIVERED'),
(8, DATE '2024-01-18', 106, 'PLACED'),
(9, DATE '2024-01-20', 107, 'CANCELLED'),
(10, DATE '2024-01-22', 103, 'DELIVERED');

select * from orders;

select *,
case 
  when order_status in ('PLACED','SHIPPED') then 'Processing'
  when order_status ='DELIVERED' then 'Completed'
  Else 'Cancelled'
End as Updated_status
from orders order by updated_status limit 5;

select * from employees;

select concat(firstname,' ',lastname) as fullname,salary,
case
 when salary < 50000 then 'low'
 when salary between 50000 and 70000 then 'medium'
 else 'high'
End as sal_levl
from employees;

select departmentname,departmentid from department
order by
case departmentid
 when 1 then 1
 when 2 then 2
 else 3
End;

Select department,
count(case when department='HR' then 1 end) as "HR_cnt",
count(case when department='Engineering' then 2 end) as "Engineering_cnt",
count(case when department='Accounts' then 3 end) as "Account_cnt",
count(case when department='Finance' then 4 end )as "Finance_cnt",
count(case when department='Teaching' then 2 end) as "Teaching_cnt"
from employees
group by department;

----------CTE--------------

with high_pay as(
select firstname,lastname,salary from employees
where salary >= 70000
)
select * from high_pay;

with dept_avg as(
select department,round(avg(salary),2) as avg_Sal from employees
group by department
)
select e.firstname,e.lastname,da.avg_sal from employees e
JOIN dept_avg da
on e.department=da.department;

select * from employees;

With Recursive emp_hierarchy as(
select employeeid,firstname,managerid,1 as level from employees
where managerid=102
union all
select e.employeeid,e.firstname,e.managerid,h.level+1
from employees e
join emp_hierarchy h 
on e.managerid=h.employeeid)
select * from emp_hierarchy;

------VIEW---------------------

create view high_sal as
select employeeid,firstname,department,salary
from employees where salary< 70000;

select * from high_sal;

create view emp_details as
select e.employeeid,e.firstname,p."ProjectName"
from employees e 
join department d 
on e.department=d.departmentname
join Projects p
on d.departmentid=p."ProjectId";

select * from emp_details where firstname like '%a%';

drop view emp_details;

create or replace view high_sal as 
select employeeid,firstname,department,salary,lastname
from employees where salary<65000;

select * from high_sal;

with low_pay as(
select employeeid from high_sal
where salary<=60000
)Update high_sal
set salary=salary+500
where employeeid in (select employeeid from low_pay);

select * from high_sal;

--------Windows function------------

select firstname,lastname,department,salary,
row_number() over(Partition by department order by salary desc) as Rownum
from employees;

select * from employees;

Insert into employees(employeeid,firstname,lastname,department,salary,hiredate,email,managerid)
values (111,'Madhu','Singh','Teaching',72000,'20-01-2025','abc@gmail.com',105),
        (112,'Ayush','kr','Engineering',63800,'20-02-2025','cde@gmail.com',106);

select firstname,lastname,department,salary,
rank() over(Partition by department order by salary desc) as Ranks
from employees;

select firstname,lastname,department,salary,
rank() over(order by salary desc) as Ranks
from employees;

select firstname,lastname,department,salary,
dense_rank() over(order by salary desc) as DRanks
from employees;

select firstname,lastname,department,salary,
row_number() over(order by salary desc) as Rownum,
rank() over(order by salary desc) as Ranks,
dense_rank() over(order by salary desc) as DRanks
from employees;

select firstname,lastname,department,salary,
ntile(4) over(order by salary asc) as salaryBkt
from employees;

select concat(firstname,' ',lastname),salary,
lead(salary) over(order by salary desc) as nextSalary,
lag(salary) over(order by salary desc) as prevSalary
from employees;

Select firstname,lastname,department,salary,
sum(salary) over(order by salary asc) as sumSal
from employees;

select * from (Select firstname,lastname,department,salary,
dense_rank() over(partition by department order by salary desc) as Rownum
from employees)
where rownum<=2;

select firstname,lastname,salary,
lead(salary) over(order by salary desc) as nextSal,
salary - lead(salary) over(order by salary desc) as salaryDiff
from employees;

---------Stored procedure--------

CREATE TABLE Emp (
    id     int,
    name   VARCHAR(50),
    dept   VARCHAR(30),
    salary int
);

INSERT INTO Emp (id, name, dept, salary) VALUES (101, 'Amit',  'IT', 60000)
,(102, 'Neha',  'HR', 55000)
, (103, 'Rahul', 'IT', 65000)
, (104, 'Priya', 'Finance', 70000);


