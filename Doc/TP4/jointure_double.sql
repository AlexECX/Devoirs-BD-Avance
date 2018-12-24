

-- with index
-- drop table T1_index;
-- drop table T2_index;

-- drop index indexT1;
-- drop index indexT2;

-- create table T1_index as select * from T1;
-- create table T2_index as select * from T2;

-- create index indexT1 on T1_index(col1);
-- create index indexT2 on T2_index(col1);

SELECT /*+ FULL(T3) INDEX(T1_index col1) INDEX(T2_index col1) */ COUNT(*) FROM T3,T1_index,T2_index WHERE T1_index.col1=T3.col1 AND T2_index.col1 = T3.col2 AND T1_index.col2 = 1;

-- with cluster

-- drop cluster clusterT1;
-- drop cluster clusterT2;

-- create cluster clusterT1(var1 INTEGER)
-- SIZE 160 HASHKEYS 100000;

-- create cluster clusterT2(var1 INTEGER)
-- SIZE 160 HASHKEYS 100000;

-- create table T1_CLUSTER cluster clusterT1(col1) as select * from T1;
-- create table T2_CLUSTER cluster clusterT2(col1) as select * from T2;

-- SELECT /*+ INDEX(T1_index col1) INDEX(T2_index col1)*/ COUNT(*) FROM T3,T1_index,T2_index WHERE T1_index.col1=T3.col1 AND T2_index.col1 = T3.col2 AND T1_index.col2 = 1
