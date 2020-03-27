--1. number of employees that make at least 90k
-- average salary of those employees

Select
    count(*), AVG(e.salary)
    from employee e
    where salary >= 90000
    group by eid;
    
--2. dept number, largest salary in that dept
-- order by department number
Select
    d.Dnumber, MAX(e.salary)
    from department d, employee e
    where d.dnumber= e.dno
    group by d.dnumber
    order by d.dnumber;
    
--3. Names and salaries of all male employees in development dept
-- order by salary 
Select
    e.salary,CONCAT( e.first,  e.last) as full_name
    from employee e, department d
    where e.dno= d.dnumber and e.Gender= 'M' and d.dname='Development'
    order by e.salary ASC;

--4. Smallest salary to an employee in the automation project
Select
    MIN(e.salary)
    from employee e, project p, Assignment a
    where e.eid= a.employeeid and p.pnumber= a.projectno
    and p.pname='Automation';
--5. List in alphabetical order
-- names of all projs 'ahmed salman' works on, number of hours worked on each proj
Select
    SUM(a.hours), p.pname
    from project p, assignment a, employee e
    where p.pnumber=a.projectno and e.eid= a.employeeid
    and e.first='Ahmed' and e.last='Salman'
    group by p.pname
    order by p.pname;
--6. IDs of all employees assigned to 3 or more projects
--, num of projs each is assigned

Select
    e.eid, count(a.projectno)
    from assignment a, employee e
    where e.eid= a.employeeid
    having count(a.projectno) > 2
    group by e.eid;
    
--7. Id and full name of employee who has a son with son's first and age
-- order by age

Select
    e.eid, Concat(e.first, e.last) as employee_full_name, d.first, d.age
    from employee e, dependent d
    where e.eid= d.employeeid and d.relationship='Son';

--8. For each proj in pitsburgh 
-- Give: projectno, projname,total hours == order by hours
Select
    p.pnumber, sum(a.hours), p.pname
    from assignment a, project p
    where p.pnumber=a.projectno and p.plocation= 'Pittsburgh'
    group by p.pname, p.pnumber;
    
    
    