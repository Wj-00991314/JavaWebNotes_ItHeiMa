/*
	分页查询:

			SELECT 字段列表 FROM 表名 LIMIT  起始索引 , 查询条目数
				* 起始索引：从0开始

*/
select * from stu ;
-- 1. 从0开始查询，查询3条数据
select * from stu limit 0 , 3;


-- 2. 每页显示3条数据，查询第1页数据
select * from stu limit 0 , 3;
-- 3. 每页显示3条数据，查询第2页数据
select * from stu limit 3 , 3;
-- 4. 每页显示3条数据，查询第3页数据

select * from stu limit 6 , 3;

-- 起始索引 = （当前页码 - 1） * 每页显示的条数
