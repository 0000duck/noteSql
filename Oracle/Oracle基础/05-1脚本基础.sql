set serveroutput on
declare
  a int:=100;
  b int:=200;
  c number;
begin
  c:=(a+b)/(a-b);
  dbms_output.put_line(c);
exception
  when zero_divide then
  dbms_output.put_line('除数不许为零!');
end;
/

定义变量：【256个ASCII字符组成】，每行只能定义一个变量，以字母开头，以“;”结尾。
v_name	varchar2(30);
v$sal	number(6,2);
v#error EXCEPTION;
"1234"  VARCHAR2(30);
"变量A"	number(6,2);

select file_name,tablespace_name from dba_data_files;

SELECT * FROM emp

set serveroutput on
declare
  var_ename emp.ename%type;    --声明与ename列类型相同的变量
  var_job emp.job%type;        --声明与job列类型相同的变量
begin
  select ename,job
  into var_ename,var_job	   --若返回多行数据，则报错
  from emp
  where empno=7369;            --检索数据，并保存在变量中
  dbms_output.put_line(var_ename||'的职务是'||var_job);	--输出变量的值
end;
/

-- 记录类型：
set serveroutput on
declare
  type emp_type is record --声明record类型emp_type
  (
    var_ename varchar2(20),--定义字段
    var_job varchar2(20),
    var_sal number
  );
  empinfo  emp_type; --定义变量
begin
  select ename,job,sal
  into empinfo
  from emp
  where empno=7369;--检索数据
  --输出雇员信息
  dbms_output.put_line('雇员'||empinfo.var_ename||'的职务是'||empinfo.var_job||'、工资是'||empinfo.var_sal);
end;
/

-- 行数据类型
set serveroutput on
declare
  rowVar_emp emp%rowtype; --定义能够存储emp表中一行数据的变量rowVar_emp
begin
  select * 
  into rowVar_emp
  from emp
  where empno=7369;--检索数据
  /*输出雇员信息*/
  dbms_output.put_line('雇员'||rowVar_emp.ename||'的编号是'||rowVar_emp.empno||',职务是'||rowVar_emp.job);
end;
/

-- 自定义数组类型
DECLARE
  TYPE user_name_type IS TABLE OF VARCHAR2(10) INDEX BY BINARY_INTEGER;
  user_name_arr user_name_type;
BEGIN
  user_name_arr(0) := '张三';
  user_name_arr(1) := '李菁菁';
  FOR i IN 0 .. 1
  LOOP
    dbms_output.put_line('User Name:' || user_name_arr(i));
  END LOOP;
END;

-- 定义常量：constant关键字
con_day constant integer:=365;

-- between 操作符
1 BETWEEN 0 AND 100;
-- in 操作符
'scott' IN ('scott','mary')

-- if then 表达式：
set serveroutput on
declare
  var_name1 varchar2(50);
  var_name2 varchar2(50);
begin
  var_name1:='East';
  var_name2:='xiaoke';
  if length(var_name1) < length(var_name2) then
    dbms_output.put_line('字符串“'||var_name1||'”的长度比字符串“'||var_name2||'”的长度小');
  end if;
end;
/

-- if then else 表达式：
set serveroutput on
declare
  age int:=55;--定义整形变量并赋值
begin
  if age >= 56 then--比较年龄是否大于56岁
    dbms_output.put_line('您可以申请退休了！');--输出退休信息
  else
    dbms_output.put_line('您小于56岁，不可以申请退休了！');--输出不可退休信息
  end if;
end;
/

-- if then elsif else 表达式：
set serveroutput on
declare
  month int:=10;--定义整形变量并赋值
begin
  if month >= 0 and month <= 3  then--判断春季
    dbms_output.put_line('这是春季');
  elsif  month >= 4 and month <= 6 then--判断夏季
    dbms_output.put_line('这是夏季');
  elsif  month >= 7 and month <= 9  then--判断秋季
    dbms_output.put_line('这是秋季');
  elsif  month >= 10 and month <= 12 then--判断冬季
    dbms_output.put_line('这是冬季');
  else
    dbms_output.put_line('对不起，月份不合法！');
  end if;
end;
/

-- case when 语句
set serveroutput on
declare
  season int:=3;--定义整形变量并赋值
  aboutInfo varchar2(50); 
begin
  case season 
    when 1 then
      aboutInfo := season||'季度包括1，2，3月份';
    when 2 then
      aboutInfo := season||'季度包括4，5，6月份';
    when 3 then
      aboutInfo := season||'季度包括7，8，9月份';
    when 4 then
      aboutInfo := season||'季度包括10，11，12月份';
    else
      aboutInfo := season||'季节不合法';
  end case;
  dbms_output.put_line(aboutinfo);
end;
/

-- loop exit when 表达式：至少循环一次，碰到exit when 表达式为ture退出
set serveroutput on
declare
  sum_i int:= 0;--定义整数变量，存储整数和
  i int:= 0;--定义整数变量，存储自然数
begin
  loop--循环累加自然数
    i:=i+1;--得出自然数
    sum_i:= sum_i+i;--计算前n个自然数的和
    exit when i = 100;--当循环100次时，程序退出循环体
  end loop;
  dbms_output.put_line('前100个自然数的和是：'||sum_i);--计算前100个自然数的和
end;
/

-- while loop 表达式
set serveroutput on
declare
  sum_i int:= 0;--定义整数变量，存储整数和
  i int:= 0;--定义整数变量，存储自然数
begin
  while i<=99 loop
    i:=i+1;--得出自然数
    sum_i:= sum_i+i;--计算前n个自然数的和
  end loop;
  dbms_output.put_line('前100个自然数的和是：'||sum_i);--计算前100个自然数的和
end;
/

-- for in loop 表达式
set serveroutput on
declare
  sum_i int:= 0;--定义整数变量，存储整数和
begin
  for i in reverse 1..100 loop --遍历前100个自然数[reverse 递减]
    if mod(i,2)=0 then --判断是否为偶数
      sum_i:=sum_i+i;--计算偶数和
    end if;
  end loop;
  dbms_output.put_line('前100个自然数中偶数之和是：'||sum_i);
end;
/

-- OPEN_CURSORS参数查看同时打开多个游标的数量
select name,value from v$parameter where name = 'open_cursors';
set serveroutput on
declare
  /*声明游标，检索雇员信息*/  
  cursor cur_emp (var_job in varchar2:='SALESMAN')
  is select empno,ename,sal
    from emp
    where job=var_job;  
  type record_emp is record --声明一个记录类型（RECORD类型）
  (
    /*定义当前记录的成员变量*/
    var_empno emp.empno%type,
    var_ename emp.ename%type,
    var_sal emp.sal%type
  );
  emp_row record_emp;--声明一个record_emp类型的变量
begin
  open cur_emp('MANAGER');
  fetch cur_emp into emp_row;--先让指针指向结果集中的第一行
  while cur_emp%found loop
    dbms_output.put_line(emp_row.var_ename||'的编号是'||emp_row.var_empno||',工资是'||emp_row.var_sal);
    fetch cur_emp into emp_row;--让指针指向结果集中的下一行
  end loop;
  close cur_emp;
end;
/

set serveroutput on
declare
  var_ename varchar2(50);--声明变量，用来存储雇员名称
  var_job varchar2(50);--声明变量，用来存储雇员的职务
  /*声明游标，检索指定员工编号的雇员信息*/  
  cursor cur_emp
  is select ename,job
    from emp
    where empno=7499;
begin
  open cur_emp;--打开游标
  fetch cur_emp into var_ename,var_job;--读取游标，并存储雇员名和职务
  if cur_emp%found then --若检索到数据记录，则输出雇员信息
    dbms_output.put_line('编号是7499的雇员名称为：'||var_ename||'，职务是：'||var_job);
  else
    dbms_output.put_line('无数据记录');--提示无记录信息
  end if;
end;
/

-- 游标属性：
1、%found 是否找到
2、%notfound 是否没找到
3、%rowcount 游标行数
4、%isopen 是否打开

-- 隐式游标【sql】操作
set serveroutput on
begin
  update emp
  set sal=sal*(1+0.2)
  where job='SALESMAN';
  if sql%notfound then
    dbms_output.put_line('没有雇员需要上调工资');
  else
    dbms_output.put_line('有'||sql%rowcount||'个雇员工资上调20%');
  end if;
end;
/

-- for语句隐式游标
 set serveroutput on
 begin
  for emp_record in (select empno,ename,sal from emp where job='SALESMAN')
  loop
    dbms_output.put('雇员编号：'||emp_record.empno);
    dbms_output.put('；雇员名称：'||emp_record.ename);
    dbms_output.put_line('；雇员工资：'||emp_record.sal);
  end loop;
end;
/

-- for语句显式游标
set serveroutput on
declare
 cursor cur_emp is
 select * from emp
 where deptno = 30;
begin
  for emp_record in cur_emp
  loop
    dbms_output.put('雇员编号：'||emp_record.empno);
    dbms_output.put('；雇员名称：'||emp_record.ename);
    dbms_output.put_line('；雇员职务：'||emp_record.job);
  end loop;
end;
/

set serveroutput on
declare
  var_empno number;--定义变量，存储雇员编号
  var_ename varchar2(50);--定义变量，存储雇员名称
begin
  select empno,ename into var_empno,var_ename 
  from emp
  where deptno=10;--检索部门编号为10的雇员信息
  if sql%found then --若检索成功，则输出雇员信息
    dbms_output.put_line('雇员编号：'||var_empno||'；雇员名称'||var_ename);
  end if;
exception --捕获异常
  when too_many_rows then --若SELECT INTO语句的返回记录超过一行
    dbms_output.put_line('返回记录超过一行');
  when no_data_found then --若SELECT INTO语句的返回记录为0行
    dbms_output.put_line('无数据记录');
end;
/

-- 自定义异常
set serveroutput on
declare
  primary_iterant exception;--定义一个异常变量
  pragma exception_init(primary_iterant,-00001);--关联错误号和异常变量名
begin
  insert into dept values(10,'软件开发部','深圳');--向dept表中插入一条与已有主键值重复的记录，以便引发异常
exception
  when primary_iterant then  --若oracle捕获到的异常为-00001异常
    dbms_output.put_line('主键不允许重复！');--输出异常描述信息
end;
/

-- raise语句
set serveroutput on
declare
  null_exception exception;--声明一个exception类型的异常变量
  dept_row dept%rowtype;--声明rowtype类型的变量dept_row,与dept表中一行的数据类型相同
begin
  dept_row.deptno := 66;--给部门编号变量赋值
  dept_row.dname := '公关部';--给部门名称变量赋值
  insert into dept 
  values(dept_row.deptno,dept_row.dname,dept_row.loc);--向dept表中插入一条记录
  if dept_row.loc is null then--如果判断“loc”变量的值为null
    raise null_exception;--引发null异常，程序转入exception部分
  end if;
exception
  when null_exception then--当raise引发的异常是null_exception时
  dbms_output.put_line('loc字段的值不许为null');--输出异常提示信息
  rollback;--回滚插入的数据记录
end;
/

set serveroutput on
declare
  sum_i int:= 0;--定义整数变量，存储整数和
  i int:= 0;--定义整数变量，存储自然数
begin
  loop--循环累加自然数
    i:=i+1;--得出自然数
    sum_i:= sum_i+i;--计算前n个自然数的和
    exit when i = 10;--当循环10次时，程序退出循环体
  end loop;
  dbms_output.put_line('前10个自然数的和是：'||sum_i);--计算前10个自然数的和
end;
/

set serveroutput on
begin
  update emp
  set sal=sal*(1+0.05)
  where job='SALESMAN';
  if sql%notfound then
    dbms_output.put_line('没有雇员需要下调工资');
  else
    dbms_output.put_line('有'||sql%rowcount||'个雇员工资下调5%');
  end if;
end;
/
