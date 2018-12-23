-- index cluster

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