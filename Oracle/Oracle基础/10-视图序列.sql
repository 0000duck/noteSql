create index emp_deptno_index on emp(deptno)
pctfree 25
tablespace users;

select tablespace_name,segment_type,bytes
from user_segments
where segment_name = 'EMP_DEPTNO_INDEX';

connect scott/1qaz2wsx
select column_expression
from user_ind_expressions
where index_name = 'EMP_JOB_FUN';

connect scott/1qaz2wsx
create or replace view emp_view as
select empno,ename,job,deptno
from emp
where deptno = 20;

create or replace view emp_view_readonly as
select * from dept
where deptno != 88
with read only;

create or replace view emp_view_complex as
select deptno 部门编号,max(sal) 最高工资,min(sal) 最低工资,avg(sal) 平均工资
from emp
group by deptno;

create or replace view emp_view_union as
select d.dname,d.loc,e.empno,e.ename
from emp e,dept d
where e.deptno = d.deptno and d.deptno = 20;

create public synonym public_dept for scott.dept;

create  synonym  private_dept for dept;

create sequence empno_seq
maxvalue 99999
start with 9000
increment by 100
cache 50;

alter sequence empno_seq
maxvalue 100000
increment by 200
cache 100

create bitmap index emp_salary_bmp
on employees(salary)
tablespace users;

--创建表
create table tb_10_1(
stuno number(10) not null, --学号
stuname varchar2(8),	--姓名
sex char(2),	--性别
age int
);


---创建索引
create index tb_10_1_index on tb_10_1(sex)
pctfree 25
tablespace users;

--创建表
create table tb_10_2(
id number(10) not null, --编号
stuname varchar2(8),	--姓名
sex char(2),	--性别
age int
);



--创建序列
create sequence id_seq
maxvalue 10000
start with 1
increment by 3
cache 50;



--测试
insert into tb_10_2(id,stuname,sex,age)
values(id_seq.nextval,'东方','男',30);



connect scott/1qaz2wsx
create index emp_job_reverse
on emp(job) reverse
tablespace users;

create index emp_job_fun
on emp(lower(job));

alter index emp_deptno_index
coalesce deallocate unused;

alter index emp_deptno_index rebuild;

 drop index emp_job_fun

connect system/1qaz2wsx
select index_name,index_type
from dba_indexes
where owner = 'HR';

column column_name for a30
select column_name ,column_length
from user_ind_columns
where index_name = 'EMP_DEPTNO_INDEX';

