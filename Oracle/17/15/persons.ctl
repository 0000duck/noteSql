load data
infile 'd:\data\persons.csv'
append into table persons
fields terminated by ','
(code,name,sex,old)