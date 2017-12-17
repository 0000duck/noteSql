create procedure pro_insertDept is
begin
  insert into dept values(77,'�г���չ��','JILIN');		--�������ݼ�¼
  commit;									--�ύ����
  dbms_output.put_line('�����¼�¼�ɹ���');		--��ʾ�����¼�ɹ�
end pro_insertDept;
/

create or replace procedure pro_insertDept is
begin
  insert into dept values(99,'�г���չ��','BEIJING');	--�������ݼ�¼
  commit;									--�ύ����
  dbms_output.put_line('�����¼�¼�ɹ���');		--��ʾ�����¼�ɹ�
end pro_insertDept;
/

create or replace procedure insert_dept(
  num_deptno in number,					--����inģʽ�ı��������洢���ű��
  var_ename in varchar2,					--����inģʽ�ı��������洢��������
  var_loc in varchar2) is
begin
  insert into dept
  values(num_deptno,var_ename,var_loc);		--��dept���в����¼
  commit;								--�ύ���ݿ�
end insert_dept;
/


create or replace procedure select_dept(
  num_deptno in number,--����inģʽ������Ҫ�����벿�ű��
  var_dname out dept.dname%type,--����outģʽ���������Դ洢�������Ʋ����
  var_loc out dept.loc%type) is
begin
  select dname,loc
  into var_dname,var_loc
  from dept
  where deptno = num_deptno;--����ĳ�����ű�ŵĲ�����Ϣ
exception
  when no_data_found then --��select����޷��ؼ�¼
    dbms_output.put_line('�ò��ű�ŵĲ�����');--�����Ϣ
end select_dept;
/

set serverout on
declare
  var_dname dept.dname%type;
  var_loc dept.loc%type;
begin
  select_dept(99,var_dname,var_loc);
  dbms_output.put_line(var_dname||'λ�ڣ�'||var_loc);
end;
/

create or replace procedure pro_square(
  num in out number,--��������ƽ����ƽ����
  flag in boolean) is  --����ƽ����ƽ�����ı�ʶ
  i int := 2; --����ƽ���Ĳ���
begin
  if flag then --��Ϊtrue
    num := power(num,i);--����ƽ��
  else
    num:=sqrt(num);--����ƽ����
  end if;
end;
/
  
declare
  var_number number;--�洢Ҫ���������ֵ�������Ľ��
  var_temp number;--�洢Ҫ���������ֵ
  boo_flag boolean;--ƽ����ƽ�������߼����
begin
  var_temp :=3;--������ֵ
  var_number :=var_temp;
  boo_flag := false;--false��ʾ����ƽ������true��ʾ����ƽ��
  pro_square(var_number,boo_flag);--���ô洢����
  if boo_flag then
    dbms_output.put_line(var_temp ||'��ƽ���ǣ�'||var_number);--���������
  else
    dbms_output.put_line(var_temp ||'ƽ�����ǣ�'||var_number);
  end if;
end;
/

create or replace procedure insert_dept(
  num_deptno in number,--����洢���ű�ŵ�IN����
  var_dname in varchar2 default '�ۺϲ�',--����洢�������Ƶ�IN����������ʼĬ��ֵ
  var_loc in varchar2 default '����') is
begin
  insert into dept values(num_deptno,var_dname,var_loc);--����һ����¼
end;
/

create or replace function get_avg_pay(num_deptno number) return number is--����һ���������ú���ʵ�ּ���ĳ�����ŵ�ƽ�����ʣ����벿�ű�Ų���
  num_avg_pay number;--������ʱ����������ĳ�����ŵ�ƽ������
begin
  select avg(sal) into num_avg_pay from emp where deptno=num_deptno;--��ȡĳ�����ŵ�ƽ������
  return(round(num_avg_pay,2));--����ƽ������
exception
  when no_data_found then --���˲��ű�Ų�����
    dbms_output.put_line('�ò��ű�Ų�����');
    return(0); --����ƽ������Ϊ0
end;
/

create table dept_log
(
  operate_tag varchar2(10),			--�����ֶΣ��洢����������Ϣ
  operate_time date				--�����ֶΣ��洢��������
);



create or replace trigger tri_dept
  before insert or update or delete
  on dept --��������������dept�������룬�޸ģ�ɾ������ʱ����ô�����ִ��
declare
  var_tag varchar2(10);--����һ���������洢��dept��ִ�еĲ�������
begin
  if inserting then --�������¼���INSERTʱ
    var_tag := '����';--��ʶ�������
  elsif updating then --�������¼���UPDATEʱ
    var_tag := '�޸�';--��ʶ�޸Ĳ���
  elsif deleting then--�������¼���DELETEʱ
    var_tag := 'ɾ��';--��ʶɾ������
  end if;
  insert into dept_log
  values(var_tag,sysdate);--����־���в����dept��Ĳ�����Ϣ
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
  on goods --����goods���ݱ��id���ڲ���id��֮ǰ������ô�����������
  for each row --�����м�������
begin
  select seq_id.nextval
  into :new.id
  from dual;--������������һ���µ���ֵ����ֵ����ǰ�����е�id��
end;
/


create view view_emp_dept
  as select empno,ename,dept.deptno,dname,job,hiredate
     from emp,dept
     where emp.deptno = dept.deptno;

create or replace trigger tri_insert_view
  instead of insert
  on view_emp_dept--����һ������view_emp_dept��ͼ���滻������
  for each row--���м���ͼ
declare
  row_dept dept%rowtype;
begin
  select * into row_dept from dept where deptno = :new.deptno;--����ָ�����ű�ŵļ�¼��
  if sql%notfound then--δ�������ò��ű�ŵļ�¼
     insert into dept(deptno,dname)
     values(:new.deptno,:new.dname);--��dept���в�������
  end if;
  insert into emp(empno,ename,deptno,job,hiredate)
  values(:new.empno,:new.ename,:new.deptno,:new.job,:new.hiredate);--��emp���в�������
end tri_insert_view;
/


create table ddl_oper_log
(
  db_obj_name varchar2(20),--���ݶ�������
  db_obj_type varchar2(20),--��������
  oper_action varchar2(20),--����dll��Ϊ
  oper_user varchar2(20),--�����û�
  oper_date date--��������
);

create or replace trigger tri_ddl_oper
  before create or alter or drop
  on scott.schema --��scottģʽ�£��ڴ������޸ġ�ɾ�����ݶ���֮ǰ�������ô���������
begin
  insert into ddl_oper_log values(
    ora_dict_obj_name,--���������ݶ�������
    ora_dict_obj_type,--��������
    ora_sysevent,--ϵͳ�¼�����
    ora_login_user,--��¼�û�
    sysdate);
end;
/

create or replace package pack_emp is
  function fun_avg_sal(num_deptno number) return number;--�ú������ڻ�ȡָ�����ŵ�ƽ������
  procedure pro_regulate_sal(var_job varchar2,num_proportion number);--�ô洢����ʵ�ְ���ָ�������ϵ�ָ��ְ��Ĺ���
end pack_emp;
/

create or replace package body pack_emp is
  function fun_avg_sal(num_deptno number) return number is  --���롰�淶���еĺ���
    num_avg_sal number;--�����ڲ�����
  begin
    select avg(sal)
    into num_avg_sal
    from emp
    where deptno = num_deptno;--����ĳ�����ŵ�ƽ������
    return(num_avg_sal);--����ƽ������
  exception
    when no_data_found then--��δ���ּ�¼
      dbms_output.put_line('�ò��ű�Ų����ڹ�Ա��¼');
    return 0;--����0
  end fun_avg_sal;

  procedure pro_regulate_sal(var_job varchar2,num_proportion number) is--���롰�淶���еĴ洢����
  begin
    update emp
    set sal = sal*(1+num_proportion)
    where job = var_job;--Ϊָ����ְ���������
  end pro_regulate_sal;
end pack_emp;
/

   
set serveroutput on
declare
  num_deptno emp.deptno%type;--���岿�ű�ű���
  var_job emp.job%type;--����ְ�����
  num_avg_sal emp.sal%type;--���幤�ʱ���
  num_proportion number;--���幤�ʵ�����������
begin
  num_deptno:=10;--���ò��ű��Ϊ10
  num_avg_sal:=pack_emp.fun_avg_sal(num_deptno);--���㲿�ű��Ϊ10��ƽ������
  dbms_output.put_line(num_deptno||'�Ų��ŵ�ƽ�������ǣ�'||num_avg_sal);--���ƽ������
  
  var_job:='SALESMAN';--����ְ������
  num_proportion:=0.1;--���õ�������
  pack_emp.pro_regulate_sal(var_job,num_proportion);--����ָ�����ŵĹ���
end;
/


create or replace function get_avg_pay(var_job varchar2) return number is--����һ���������ú���ʵ�ּ���ĳ��ְ���ƽ�����ʣ�����ְ�����Ʋ���
  num_avg_pay number;--������ʱ����������ĳ��ְ���ƽ������
begin
  select avg(sal) into num_avg_pay from emp where job=var_job;--��ȡĳ�����ŵ�ƽ������
  return(round(num_avg_pay,2));--����ƽ������
exception
  when no_data_found then --����ְ�񲻴���
    dbms_output.put_line('��ְ�񲻴���');
    return(0); --����ƽ������Ϊ0
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









