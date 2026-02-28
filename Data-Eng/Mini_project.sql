create table Employee(
EmpId int Primary key,
empname varchar(50),
DepartmentId int,
Hiredate Date,
Salary decimal(10,2)
);

Create table Department(
departmentid int primary key,
deptname varchar(50)
);

create table Performance(
Empid int,
ReviewDate date,
score int check(score between 1 and 10),
Foreign key(empid) references employee(empid)
);

Insert into department
values (1,'HR'),(2,'IT'),(3,'Finance');

Insert into employee 
values (101,'Ujjwal',1,'2020-01-15',60000),
       (102,'Ankita',1,'2019-05-10',58000),
	   (103,'Shruti',2,'2021-03-01',75000),
	   (104,'Aditya',2,'2022-07-12',72000),
	   (105,'Manoj',3,'2018-11-03',82000);

select * from employee;
select * from department;

Insert into performance 
values (101,'2023-01-01',9),
       (101,'2024-01-01',9),
	   (102,'2023-01-01',7),
	   (103,'2023-01-01',6),
	   (104,'2024-01-01',9),
	   (105,'2024-01-01',10);
select * from performance;

select Empid,deptname from employee e
inner join department d
on e.departmentid=d.departmentid;

select Empid,(select deptname from department d where e.departmentid=d.departmentid) as deptname
from employee e;

select * from employee;

select e.departmentid,d.deptname,avg(salary) from employee e
join department d
on e.departmentid=d.departmentid
group by e.departmentid,d.deptname
order by e.departmentid;

SELECT empname,
EXTRACT(YEAR FROM AGE(CURRENT_DATE, hiredate)) AS exp_years
FROM employee;


	   