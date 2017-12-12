use db_2012
go
select 书名,出版社,SUM(单价) as 总计金额 from books
group by GROUPING sets(书名,出版社)
