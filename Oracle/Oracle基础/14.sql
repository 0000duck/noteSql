--修改
alter system set large_pool_size=64m;



--显示
show parameter large_pool_size;


select sum(getmisses) 不命中数
from v$rowcache;

