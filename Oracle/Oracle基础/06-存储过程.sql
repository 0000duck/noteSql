create procedure pro_insertDept is
begin
  insert into dept values(77,'市场拓展部','JILIN');		--插入数据记录
  commit;									--提交数据
  dbms_output.put_line('插入新记录成功！');		--提示插入记录成功
end pro_insertDept;
/

create or replace procedure pro_insertDept is
begin
  insert into dept values(99,'市场拓展部','BEIJING');	--插入数据记录
  commit;									--提交数据
  dbms_output.put_line('插入新记录成功！');		--提示插入记录成功
end pro_insertDept;
/

create or replace procedure insert_dept(
  num_deptno in number,					--定义in模式的变量，它存储部门编号
  var_ename in varchar2,					--定义in模式的变量，它存储部门名称
  var_loc in varchar2) is
begin
  insert into dept
  values(num_deptno,var_ename,var_loc);		--向dept表中插入记录
  commit;								--提交数据库
end insert_dept;
/


create or replace procedure select_dept(
  num_deptno in number,--定义in模式变量，要求输入部门编号
  var_dname out dept.dname%type,--定义out模式变量，可以存储部门名称并输出
  var_loc out dept.loc%type) is
begin
  select dname,loc
  into var_dname,var_loc
  from dept
  where deptno = num_deptno;--检索某个部门编号的部门信息
exception
  when no_data_found then --若select语句无返回记录
    dbms_output.put_line('该部门编号的不存在');--输出信息
end select_dept;
/

set serverout on
declare
  var_dname dept.dname%type;
  var_loc dept.loc%type;
begin
  select_dept(99,var_dname,var_loc);
  dbms_output.put_line(var_dname||'位于：'||var_loc);
end;
/

create or replace procedure pro_square(
  num in out number,--计算它的平方或平方根
  flag in boolean) is  --计算平方或平方根的标识
  i int := 2; --计算平方的参数
begin
  if flag then --若为true
    num := power(num,i);--计算平方
  else
    num:=sqrt(num);--计算平方根
  end if;
end;
/
  
declare
  var_number number;--存储要进行运算的值和运算后的结果
  var_temp number;--存储要进行运算的值
  boo_flag boolean;--平方或平方根的逻辑标记
begin
  var_temp :=3;--变量赋值
  var_number :=var_temp;
  boo_flag := false;--false表示计算平方根；true表示计算平方
  pro_square(var_number,boo_flag);--调用存储过程
  if boo_flag then
    dbms_output.put_line(var_temp ||'的平方是：'||var_number);--输出计算结果
  else
    dbms_output.put_line(var_temp ||'平方根是：'||var_number);
  end if;
end;
/

create or replace procedure insert_dept(
  num_deptno in number,--定义存储部门编号的IN参数
  var_dname in varchar2 default '综合部',--定义存储部门名称的IN参数，并初始默认值
  var_loc in varchar2 default '北京') is
begin
  insert into dept values(num_deptno,var_dname,var_loc);--插入一条记录
end;
/

create or replace function get_avg_pay(num_deptno number) return number is--创建一个函数，该函数实现计算某个部门的平均工资，传入部门编号参数
  num_avg_pay number;--定义临时变量，保存某个部门的平均工资
begin
  select avg(sal) into num_avg_pay from emp where deptno=num_deptno;--获取某个部门的平均工资
  return(round(num_avg_pay,2));--返回平均工资
exception
  when no_data_found then --若此部门编号不存在
    dbms_output.put_line('该部门编号不存在');
    return(0); --返回平均工资为0
end;
/

create table dept_log
(
  operate_tag varchar2(10),			--定义字段，存储操作种类信息
  operate_time date				--定义字段，存储操作日期
);



create or replace trigger tri_dept
  before insert or update or delete
  on dept --创建触发器，当dept表发生插入，修改，删除操作时引起该触发器执行
declare
  var_tag varchar2(10);--声明一个变量，存储对dept表执行的操作类型
begin
  if inserting then --当触发事件是INSERT时
    var_tag := '插入';--标识插入操作
  elsif updating then --当触发事件是UPDATE时
    var_tag := '修改';--标识修改操作
  elsif deleting then--当触发事件是DELETE时
    var_tag := '删除';--标识删除操作
  end if;
  insert into dept_log
  values(var_tag,sysdate);--向日志表中插入对dept表的操作信息
end tri_dept;
/


 create table goods
(
  id int primary key,
  good_name varchar2(50)
);

create sequence seq_id;

create or replace trigger tri_insert_good
  before insert
  on goods --关于goods数据表的id，在插入id列之前，引起该触发器的运行
  for each row --创建行级触发器
begin
  select seq_id.nextval
  into :new.id
  from dual;--从序列中生成一个新的数值，赋值给当前插入行的id列
end;
/


create view view_emp_dept
  as select empno,ename,dept.deptno,dname,job,hiredate
     from emp,dept
     where emp.deptno = dept.deptno;

create or replace trigger tri_insert_view
  instead of insert
  on view_emp_dept--创建一个关于view_emp_dept视图的替换触发器
  for each row--是行级视图
declare
  row_dept dept%rowtype;
begin
  select * into row_dept from dept where deptno = :new.deptno;--检索指定部门编号的记录行
  if sql%notfound then--未检索到该部门编号的记录
     insert into dept(deptno,dname)
     values(:new.deptno,:new.dname);--向dept表中插入数据
  end if;
  insert into emp(empno,ename,deptno,job,hiredate)
  values(:new.empno,:new.ename,:new.deptno,:new.job,:new.hiredate);--向emp表中插入数据
end tri_insert_view;
/


create table ddl_oper_log
(
  db_obj_name varchar2(20),--数据对象名称
  db_obj_type varchar2(20),--对象类型
  oper_action varchar2(20),--具体dll行为
  oper_user varchar2(20),--操作用户
  oper_date date--操作日期
);

create or replace trigger tri_ddl_oper
  before create or alter or drop
  on scott.schema --在scott模式下，在创建、修改、删除数据对象之前将引发该触发器运行
begin
  insert into ddl_oper_log values(
    ora_dict_obj_name,--操作的数据对象名称
    ora_dict_obj_type,--对象类型
    ora_sysevent,--系统事件名称
    ora_login_user,--登录用户
    sysdate);
end;
/

create or replace package pack_emp is
  function fun_avg_sal(num_deptno number) return number;--该函数用于获取指定部门的平均工资
  procedure pro_regulate_sal(var_job varchar2,num_proportion number);--该存储过程实现按照指定比例上调指定职务的工资
end pack_emp;
/

create or replace package body pack_emp is
  function fun_avg_sal(num_deptno number) return number is  --引入“规范”中的函数
    num_avg_sal number;--定义内部变量
  begin
    select avg(sal)
    into num_avg_sal
    from emp
    where deptno = num_deptno;--计算某个部门的平均工资
    return(num_avg_sal);--返回平均工资
  exception
    when no_data_found then--若未发现记录
      dbms_output.put_line('该部门编号不存在雇员记录');
    return 0;--返回0
  end fun_avg_sal;

  procedure pro_regulate_sal(var_job varchar2,num_proportion number) is--引入“规范”中的存储过程
  begin
    update emp
    set sal = sal*(1+num_proportion)
    where job = var_job;--为指定的职务调整工资
  end pro_regulate_sal;
end pack_emp;
/

   
set serveroutput on
declare
  num_deptno emp.deptno%type;--定义部门编号变量
  var_job emp.job%type;--定义职务变量
  num_avg_sal emp.sal%type;--定义工资变量
  num_proportion number;--定义工资调整比例变量
begin
  num_deptno:=10;--设置部门编号为10
  num_avg_sal:=pack_emp.fun_avg_sal(num_deptno);--计算部门编号为10的平均工资
  dbms_output.put_line(num_deptno||'号部门的平均工资是：'||num_avg_sal);--输出平均工资
  
  var_job:='SALESMAN';--设置职务名称
  num_proportion:=0.1;--设置调整比例
  pack_emp.pro_regulate_sal(var_job,num_proportion);--调整指定部门的工资
end;
/


create or replace function get_avg_pay(var_job varchar2) return number is--创建一个函数，该函数实现计算某个职务的平均工资，传入职务名称参数
  num_avg_pay number;--定义临时变量，保存某个职务的平均工资
begin
  select avg(sal) into num_avg_pay from emp where job=var_job;--获取某个部门的平均工资
  return(round(num_avg_pay,2));--返回平均工资
exception
  when no_data_found then --若此职务不存在
    dbms_output.put_line('该职务不存在');
    return(0); --返回平均工资为0
end;
/

create or replace trigger about_job_trigger
  before update or insert of job
  on emp
  for each row
begin
  if updating then
     :new.job:=upper(:new.job);
  else
    :new.job:=upper(:new.job);
  end if;
end;
/









