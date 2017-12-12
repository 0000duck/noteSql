load data
  infile 'd:\data\student.txt'
  into table student
  (stuno position(01:04) integer external,
   stuname position(11:14) char,
   sex position(21:22) char,
   old position(29:30) integer external
  )