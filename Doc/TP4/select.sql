set autotrace on;
select /*+ FULL)*/count(*)
  from T1
 where T1.col2=1
 