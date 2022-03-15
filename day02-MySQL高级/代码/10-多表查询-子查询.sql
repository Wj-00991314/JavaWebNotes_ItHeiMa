-- 查询工资高于猪八戒的员工信息

select * from emp;

-- 1. 查询猪八戒的工资
select salary from emp where name = '猪八戒';

-- 2. 查询工资高于猪八戒的员工信息
select * from emp where salary > 3600;

select * from emp where salary > (select salary from emp where name = '猪八戒');



-- 查询 '财务部' 和 '市场部' 所有的员工信息
-- 查询 '财务部' 所有的员工信息

select did from dept where dname = '财务部' or dname = '市场部';

select * from emp where dep_id in (select did from dept where dname = '财务部' or dname = '市场部');

-- 查询入职日期是 '2011-11-11' 之后的员工信息和部门信息
-- 查询入职日期是 '2011-11-11' 之后的员工信息

select * from emp where join_date > '2011-11-11' ;


select * from (select * from emp where join_date > '2011-11-11' ) t1, dept where t1.dep_id = dept.did;
