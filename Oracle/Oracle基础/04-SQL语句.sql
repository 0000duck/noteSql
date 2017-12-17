 select empno,ename,sal from scott.emp;
 SELECT empno,ename,sal FROM scott.emp;
 selECT empno,ename,sal frOM scott.emp;

 select empno,ename,sal from scott.emp;
 select EMPNO,ENAME,SAL from SCOTT.EMP;
 select emPNO,ename,sAL from scott.EmP;

nvl(value, 0) 为null时设置默认值
ascii()
chr()

ceil() 向上取整
florr() 向下取整



 select empno,ename,job
from scott.emp
where job='SALESMAN'
order by empno;

connect scott/tiger
select table_name from user_tables;

connect scott/1qaz2wsx
select empno as "员工编号",ename as "员工名称",job as "职务"  from emp;

connect hr/hr;
select street_address from locations where  state_province is null;

connect scott/1qaz2wsx
 select empno,ename,sal from emp where sal < 2000 or sal > 3000;

select e.empno as 员工编号, e.ename as 员工名称, d.dname as 部门
from emp e,dept d
where e.deptno=d.deptno
and e.job='MANAGER';

insert into emp(empno,ename,job) values(9527,'EAST','SALESMAN');
select e.empno,e.ename,e.job,d.deptno,d.dname
from emp e left join dept d
on e.deptno=d.deptno;

  select e.empno,e.ename,e.job,d.deptno,d.dname
from emp e full join dept d
on e.deptno=d.deptno;

select employee_id,lower(first_name),upper(last_name) from employees where
lower(first_name) like 'a%';

select sysdate as 默认格式日期, to_char(sysdate,'YYYY-MM-DD') as 转换后日期
from dual;

select empno,ename,job from emp
where deptno=(select deptno from dept
where dname='RESEARCH');

select empno,ename,sal
from emp f
where sal > (select avg(sal) from emp where job = f.job)
order by job;



create table jobs_temp(
job_id varchar2(10) primary key,
job_title varchar2(35) not null,
min_salary number(6),
max_salary number(6));





insert into jobs_temp
select * from jobs
where jobs.max_salary > 10000;


truncate table jobs_temp;


insert into jobs_temp values('OFFICE','办公文员',3000,5000);


savepoint sp;


insert into jobs_temp values('FINANCE','财务人员',4000,8000);


select * from jobs_temp;


rollback to savepoint sp;


commit;


select * from jobs_temp;


 select max(salary),min(salary) from employees where department_id = 30;

create table employees_copy as select * from employees;