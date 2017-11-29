select 图书名称,图书分类,出版日期 from tb_aspnetbook
where month(出版日期)=10 
order by 出版日期
