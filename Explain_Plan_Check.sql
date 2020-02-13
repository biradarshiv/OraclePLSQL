alter session set statistics_level = ALL;
set linesize 256;
set pagesize 0;
alter session set optimiser_adaptive_features = FALSE;

/*
Note that these two keywords are repeated twice in the below page
SB1            - This is the text that will help us to find the sql ID attached with the sql that we are running.
fzabc_SqlID    - This is the sql ID
*/


select /*+gather_plan_statistics*/ /*+SB1*/ .....
Your sql being run

select s.last_load_time, s.sql_id, s.sql_fulltext
from v$sql s
where upper(s.sql_fulltext) like '%SB1%'
order by last_load_time desc;

select * from table(DBMS_XPLAN.display_cursor('fzabc_SqlID',NULL,'ALLSTATS LAST'));

Parallel Queries
select * from table(DBMS_XPLAN.display_cursor('fzabc_SqlID',NULL,'ALLSTATS ALL'));

--------------------
-- ALL STATS LAST
--------------------
E-Rows | 0Mem | 1Mem | Used-Mem

Starts | E-Rows | A-Time | Buffers | 0Mem | 1Mem | Used-Mem

--------------------
-- ALL STATS ALL
--------------------
E-Rows | E-Bytes | E-Temp | Cost(%CPU) | E-Time | 0Mem | 1Mem | 0/1/M

Id | Operation | Name | Starts | E-Rows | E-Bytes | E-Temp | Cost(%CPU) | E-Time | A-Rows | A-Rows | A-Time | Buffers | 0Mem | 1Mem | 0/1/M



0Mem - Memory needed to perform operation in Memory only
1Mem - Memory needed to perform operation in 1 pass(including Temp)
M    - Multipass
Used-Temp     - Amount of temporary space used for this operation

