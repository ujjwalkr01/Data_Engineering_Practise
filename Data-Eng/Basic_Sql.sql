create table Employees(
EmployeeId int Primary key,
FirstName varchar(20),
LastName varchar(20),
Department varchar(30),
Salary decimal(10,2),
HireDate date
);

select * from Employees;

Insert into Employees(EmployeeId, Firstname,lastname,department,salary,hiredate)
values(101,'Ujjwal','Kumar','Engineering',50000,'2024-06-26'),
      (102,'Ankita','Choudhary','Teaching',60000,'2025-07-10'),
	  (103,'Shruti','Kumari','Finance',45000,'2025-02-22'),
	  (104,'Aditya','Kumar','Finance',40000,'2023-04-20'),
	  (105,'Manoj','Kumar','Defence',90000,'1998-02-12');
Insert into Employees(EmployeeId, Firstname,lastname,department,salary,hiredate)
values
      (106, 'Vikas', 'Singh', 'Engineering', 55000, '2024-03-05'),
      (107, 'Meera', 'Iyer', 'IT Support', 43000, '2024-04-18'),
      (108, 'Arjun', 'Patel', 'Operations', 51000, '2023-11-10'),
      (109, 'Sneha', 'Gupta', 'Sales', 47000, '2024-02-08'),
      (110, 'Karan', 'Malhotra', 'Engineering', 58000, '2023-10-25');
	  
update employees
set firstname='Ujjwal',
lastname='Kumar',
salary=95000
where employeeid=106;

update employees
set firstname='Vikas',
lastname='Kumar'
where employeeid=101;	

delete from employees where employeeId is null;
select * from employees;

create table Department(
DepartmentId int primary key,
EmpId int,
DepartmentName Varchar(50) unique,
constraint fk_empid foreign key (EmpId) references Employees(EmployeeId)
);

select * from department;
select * from employees;
drop table department;

Insert into department (departmentid,Empid,departmentname)
values  (1,102,'Teaching'),
		(2,103,'Finance'),
		 (3,105,'Defence'),
		 (4,106,'IT Support'),
		 (5,108,'Operations'),
		 (6,109,'Engineering'),
		 (7,110,'HR'),
		 (8,104,'Accounts'),
		 (9,107,'Trader'),
		 (10,101,'sales');

create table Projects(
"ProjectId" int Primary key,
"ProjectName" varchar(100) not null,
"Budget" Decimal(12,2),
"StartDate" Date,
"EndDate" Date
);

select * from projects;

INSERT INTO Projects ("ProjectId", "ProjectName", "Budget", "StartDate", "EndDate")
VALUES
     (1, 'Product Engineering Upgrade', 300000.00, '2024-01-10', '2024-09-30'),
     (2, 'Microservices Architecture Migration', 450000.00, '2024-03-01', '2025-01-15'),
     (3, 'Employee Engagement Program', 80000.00, '2024-02-15', '2024-08-20'),
     (4, 'Financial Compliance Automation', 200000.00, '2024-04-01', '2024-12-31'),
     (5, 'Digital Marketing Expansion', 120000.00, '2024-03-20', '2024-10-05'),
     (6, 'Enterprise Helpdesk Revamp', 95000.00, '2024-05-05', '2024-11-25'),
     (7, 'Operations Workflow Modernization', 160000.00, '2024-01-18', '2024-09-10'),
     (8, 'Sales CRM Enhancement', 140000.00, '2024-02-01', '2024-07-30'),
     (9, 'Cloud Infrastructure Optimization', 380000.00, '2024-03-10', '2025-02-28'),
     (10, 'Defence Surveillance Modernization', 750000.00, '2024-02-10', '2025-03-20'),
     (11, 'Military Communication Encryption System', 680000.00, '2024-04-01', '2025-06-30');

INSERT INTO Projects ("ProjectId", "ProjectName", "Budget", "StartDate", "EndDate")
VALUES
(12, 'Digital Classroom Implementation', 90000.00, '2024-06-01', '2024-12-15'),
(13, 'Curriculum Modernization Initiative', 110000.00, '2024-07-10', '2025-01-30');

---UPDATE------

Update Employees
set salary=70000
where employeeid=101;

select * from employees;

Delete from employees
where employeeid=102;

Truncate table employees;
Drop table employees;

Alter table employees
Add column Email varchar(100);

Alter table employees
Alter column email type varchar(50); 

Alter table employees 
add column phone int;

Alter table employees
rename column phone to PhoneNumber;

Alter table employees
Drop column phonenumber;

Alter table employees
Rename to "Employee";

select * from "Employee";

Alter table "Employee"
rename to employees;

select * from employees;

update employees
set email='ujjwalkr5643@gmail.com'
where employeeid=101;

Alter table employees
add constraint email unique(email);

select * from projects;
select * from department;

Alter table department
add constraint departmentid unique(departmentid);

Alter table projects
add constraint fk_pid Foreign key("ProjectId") references department(departmentid);

Alter table projects
drop constraint fk_pid;

select employeeid, firstname || ' ' || lastname as fullname, hiredate as joiningdate,
current_date - hiredate as days
from employees;

select count(*) as "TotalCount" from employees;

select sum(salary) as "TotalSalary" from employees;

select round(avg(salary),2) as "AvgSalary" from employees;

select count(*) as "TotalCount", sum(salary) as "TotalSal"
from employees;

select department,count(EmployeeId), sum(salary) as "totalSal" from employees
group by department;

select department, min(salary) from employees
group by department
having department='Engineering';

select department, sum(salary) as "TotalSalary"
from employees
group by department
having sum(salary) >=45000
order by sum(salary);

select * from employees;
select * from department;
select * from projects;

select e.employeeid,e.firstname,lastname,d.departmentname,departmentid,e.salary,"ProjectName",p."Budget" from 
employees e
inner join department d
on e.department=d.departmentname
inner join projects p
on d.departmentid=p."ProjectId";

select e.employeeid,e.firstname,lastname,departmentid,departmentName,department,"ProjectName" from 
employees e
left join department d
on e.department=d.departmentname
left join projects p
on d.departmentid=p."ProjectId";

select e.employeeid,e.firstname,lastname,departmentid,departmentname,department from 
employees e
right join department d
on e.department=d.departmentname

select e.employeeid,e.firstname,lastname,departmentid,"ProjectName" from 
employees e
right join department d
on e.department=d.departmentname
right join projects p
on d.departmentid=p."ProjectId";

select employeeId,firstname,lastname,departmentname
from employees e
full outer join department d
on e.department=d.departmentname;

select * from employees;
select * from department;

Alter table employees
add column managerId int null;

update employees
set managerid=108
where employeeid=105;

select e.employeeid,e.firstname,e.lastname,e.salary,e1.firstname,e1.employeeid
from employees e
join employees e1
on e1.employeeid=e.managerid
and e.salary>e1.salary;

select employeeid,firstname,lastname,department,departmentname
from employees
cross join department;

create table Employee_uk(
Empid int,
Empname varchar(100)
);

create table Employee_Us(
EmployeeId int,
Employeename varchar(100));

Insert into Employee_uk(Empid,Empname)
values (1,'Ujjwal'),(2,'Ankita'),(3,'Shruti');

Insert into Employee_us(Employeeid,Employeename)
values (4,'Aditya'),(2,'Ankita'),(5,'Manoj');

select * from EMployee_uk
union 
select * from EMployee_us order by empid;

select * from EMployee_uk
union all 
select * from EMployee_us order by empid;

select * from EMployee_uk
intersect 
select * from EMployee_us order by empid;

select * from EMployee_uk
Except
select * from EMployee_us; --order by empid;

select * from employees;
select * from department;

select concat(firstname,' ',lastname) as fullname,salary,
round((salary*100.0)/(select max(salary) from employees),2) as percntSal
from employees;

select concat(firstname,' ',lastname) from employees
where department=(select departmentname
from department where departmentname = 'Finance');

select departmentname from department d where exists( select 1 from employees e
 where e.employeeid=d.empid);

select concat(firstname,' ',lastname) as fullname from employees
where salary>(select avg(salary) from employees 
where employeeid in (select employeeid from employees where salary>50000));

update employees
set salary=salary*1.20
where employeeid in (select employeeid from employees 
where salary<(select avg(salary) from employees));

select * from employees 
where salary< (select avg(salary) from employees);

select * from Projects;

select concat(firstname,' ',lastname) as fullname,p."ProjectName" from employees e
join department d 
on d.empid=e.employeeid
join (select "ProjectId","ProjectName" from Projects) p
on d.departmentid=p."ProjectId";

select firstname,lastname,salary from employees
where salary in (select distinct salary from employees order by salary desc limit 3);


