

-- with index

-- -- drop table T1_index;
-- -- drop table T2_index;
-- -- drop table T3_index;

-- -- drop index indexT1;
-- -- drop index indexT2;

-- -- create table T1_index as select * from T1;
-- -- create table T2_index as select * from T2;
-- -- create table T3_index as select * from T3;

-- -- create index indexT1 on T1_INDEX(col1);
-- -- create index indexT2 on T2_INDEX(col1);

SELECT /*+ FULL)*/ COUNT(*) FROM T1,T2,T3 WHERE T1.col1=T3.col1 AND T2.col1 = T3.col2 AND T1.col2 = 1