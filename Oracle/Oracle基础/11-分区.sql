    1、查询当前用户下有哪些是分区表：  
    SELECT * FROM USER_PART_TABLES;  
       
    2、查询当前用户下有哪些分区索引：  
    SELECT * FROM USER_PART_INDEXES;  
       
    3、查询当前用户下分区索引的分区信息：  
    SELECT * FROM USER_IND_PARTITIONS T  
    WHERE T.INDEX_NAME=?  
       
    4、查询当前用户下分区表的分区信息：  
    SELECT * FROM USER_TAB_PARTITIONS T  
    WHERE T.TABLE_NAME=?;  
       
    5、查询某分区下的数据量：  
    SELECT COUNT(*) FROM TABLE_PARTITION PARTITION(TAB_PARTOTION_01);  
       
    6、查询索引、表上在那些列上创建了分区：  
    SELECT * FROM USER_PART_KEY_COLUMNS;  
       
    7、查询某用户下二级分区的信息（只有创建了二级分区才有数据）：  
    SELECT * FROM USER_TAB_SUBPARTITIONS;


-- 全删除
ALTER TABLE yourTable DROP PARTITION partionName1;
-- 清数据
ALTER TABLE yourTable TRUNCATE PARTITION partionName1;


create table ware_retail_part --创建一个描述商品零售的数据表
(
  id integer primary key,--销售编号
  retail_date date,--销售日期
  ware_name varchar2(50)--商品名称
)
partition by range(retail_date)
(
  --2011年第一个季度为part_01分区
  partition par_01 values less than(to_date('2011-04-01','yyyy-mm-dd')) tablespace TBSP_1,
  --2011年第二个季度为part_02分区
  partition par_02 values less than(to_date('2011-07-01','yyyy-mm-dd')) tablespace TBSP_1,
  --2011年第三个季度为part_03分区
  partition par_03 values less than(to_date('2011-10-01','yyyy-mm-dd')) tablespace TBSP_2,
  --2011年第四个季度为part_04分区
  partition par_04 values less than(to_date('2012-01-01','yyyy-mm-dd')) tablespace TBSP_2 
);

--创建表和分区
create table sales--创建一个销售记录表
(
  id number primary key,--记录编号
  goodsname varchar2(10),--商品名
  saledate date--销售日期
)
partition by range(saledate)--按照日期分区
(
  --第一季度数据
  partition part_sea1 values less than(to_date('2011-04-01','yyyy-mm-dd')) tablespace tbsp_1,
  --第二季度数据
  partition part_sea2 values less than(to_date('2011-07-01','yyyy-mm-dd')) tablespace tbsp_2,
  --第三季度数据
  partition part_sea3 values less than(to_date('2011-10-01','yyyy-mm-dd')) tablespace tbsp_1,
  --第四季度数据
  partition part_sea4 values less than(to_date('2012-01-01','yyyy-mm-dd')) tablespace tbsp_2
);

--创建局部索引
create index index_3_4 on sales(saledate)
local(
partition part_seal tablespace tbsp_1,
partition part_sea2 tablespace tbsp_2,
partition part_sea3 tablespace tbsp_1,
partition part_sea4 tablespace tbsp_2
);

--并入分区
alter table sales merge partitions part_sea3,part_sea4 into partition part_sea4;

--重建局部索引
alter table sales modify partition part_sea4 rebuild unusable local indexes;

--创建3个表空间

create tablespace ts_1 datafile 'D:\OracleFiles\OracleData\ts1.dbf'
size 10m
extent management local autoallocate;
create tablespace ts_2 datafile 'D:\OracleFiles\OracleData\ts2.dbf'
size 10m
extent management local autoallocate;
create tablespace ts_3 datafile 'D:\OracleFiles\OracleData\ts3.dbf'
size 10m
extent management local autoallocate;


--创建分区表
create table studentgrade
(
  id number primary key,--记录id
  name varchar2(10),--学生名称
  subject varchar2(10),--学科
  grade number --成绩
)
partition by range(grade)
(
  --小于60分，不及格
  partition par_nopass values less than(60) tablespace ts_1,
  --小于70分，及格
  partition par_pass values less than(70) tablespace ts_2,
  --大于或等于70分，优秀
  partition par_good values less than(maxvalue) tablespace ts_3
);


--创建本地索引分区
create index grade_index on studentgrade(grade)
local--根据表分区创建本地索引分区
(
  partition p1 tablespace ts_1,
  partition p2 tablespace ts_2,
  partition p3 tablespace ts_3
);

--查询所创建的索引分区信息
select partition_name,tablespace_name from dba_ind_partitions where index_name = 'GRADE_INDEX';





create index index_SalePrice on Books(SalePrice)
global partition by range(SalePrice)
(
  partition p1 values less than (30),
  partition p2 values less than (50),
  partition p3 values less than (maxvalue)
);

create index index_ISBN on books(ISBN)
global partition by hash(ISBN);

alter index index_saleprice rename partition p3 to p_new;

 create table Books_Sale						--图书销售表
(
  id integer primary key,				--编号
  quantity number,					--销售数量
  book_name varchar2(50),				--名称
  publisher varchar2(50)                                --出版社
)
partition by list(publisher)					--以publisher 列为分区键创建列表分区
(
  partition A values('A省出版社'),			--A省份
  partition B values('B省出版社'), 		--B省份
  partition C values('C省出版社') 			--C省份
);

create index grade_index on Books_Sale(publisher)
local		--根据表分区创建本地索引分区
(
  partition p1 tablespace users,
  partition p2 tablespace users,
  partition p3 tablespace users
);

create table ware_retail_part2 --创建一个描述商品零售的数据表
(
  id integer primary key,--销售编号
  retail_date date,--销售日期
  ware_name varchar2(50)--商品名称
)
partition by range(id,retail_date)--按照销售序号和销售日期分区
(
  --第一个分区part_01
  partition par_01 values less than(10000,to_date('2011-12-01','yyyy-mm-dd')) tablespace TBSP_1,
  --第一个分区part_02
  partition par_02 values less than(20000,to_date('2012-12-01','yyyy-mm-dd')) tablespace TBSP_1,
  --第一个分区part_03
  partition par_03 values less than(maxvalue,maxvalue) tablespace TBSP_2 
);

create table ware_retail_part3 --创建一个描述商品零售的数据表
(
  id integer primary key,--销售编号
  retail_date date,--销售日期
  ware_name varchar2(50)--商品名称
)
partition by hash(id)
(
  partition par_01 tablespace TBSP_1,
  partition par_02 tablespace TBSP_2
);

create table person
(
  id number primary key,
  name varchar2(20),
  sex varchar2(2)
)
partition by hash(id)
partitions 2
store in(tbsp_1,tbsp_2);

create table goods
(
  id number,
  goodname varchar2(50)
)
storage(initial 2048k)
partition by hash(id)
(
 partition par1 tablespace tbsp_1,
 partition par2 tablespace tbsp_2
);

create table clients
(
  id integer primary key,
  name varchar2(50),
  province varchar2(20)
)
partition by list(province)
(
  partition shandong values('山东省'),
  partition guangdong values('广东省'),
  partition yunnan values('云南省')
);

 create table person2 					--创建以一个描述个人信息的表
(
  id number primary key,				--个人的编号
  name varchar2(20),					--姓名
  sex varchar2(2)					--性别
)
partition by range(id)--以id作为分区键创建范围分区
subpartition by hash(name)--以name列作为分区键创建hash子分区
subpartitions 2 store in(tbsp_1,tbsp_2)--hash子分区公有两个，分别存储在两个不同的命名空间中
(
  partition par1 values less than(5000),--范围分区，id小于5000
  partition par2 values less than(10000),--范围分区，id小于10000
  partition par3 values less than(maxvalue)--范围分区，id不小于10000
);

create table saleRecord
(
 id number primary key, --编号
 goodsname varchar2(50),--商品名称
 saledate date,--销售日期
 quantity number--销售量
)
partition by range(saledate)
interval (numtoyminterval(1,'year'))
(
  --设置分区键值日期小于2012-01-01
  partition par_fist values less than (to_date('2012-01-01','yyyy-mm-dd'))
);

alter table clients
add partition hebei values('河北省')
storage(initial 10K next 20k) tablespace tbsp_1
nologging;

