

-- 左外连接
-- 查询emp表所有数据和对应的部门信息

select * from emp left join dept on emp.dep_id = dept.did;


-- 右外连接
-- 查询dept表所有数据和对应的员工信息

select * from emp right join dept on emp.dep_id = dept.did;


select * from dept left join emp on emp.dep_id = dept.did;






