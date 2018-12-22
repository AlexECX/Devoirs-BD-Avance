
-- drop table T1_INDEX;
-- drop table T2_INDEX;

-- create table T1_INDEX as select * from T1;
-- create table T2_INDEX as select * from T2;

-- create index indexT1 on T1_INDEX(col1);
-- create index indexT2 on T2_INDEX(col1);

-- select /*+ FULL*/ count(*) from T1, T2 where T1.col1 = T2.col1;
-- select /*+ USE_NL_WITH_INDEX(T1_INDEX col1) USE_NL_WITH_INDEX(T2_INDEX col1)*/ count(*) from T1_INDEX, T2_INDEX where T1_INDEX.col1 = T2_INDEX.col1;

-----------

drop cluster clusterT1;
drop cluster clusterT2;

create cluster clusterT1(var1 INTEGER)
SIZE 250 INDEX;

create INDEX indexclusterT1 on cluster clusterT1;

create cluster clusterT2(var1 INTEGER)
SIZE 250 INDEX;

create INDEX indexclusterT2 on cluster clusterT2;

create table T1_CLUSTER cluster clusterT1(col1) as select * from T1;
create table T2_CLUSTER cluster clusterT2(col1) as select * from T2;

select count(*) from T1_CLUSTER, T2_CLUSTER where T1_CLUSTER.col1 = T2_CLUSTER.col1;

