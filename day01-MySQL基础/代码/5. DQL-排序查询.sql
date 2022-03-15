/*
	排序查询：
		* 语法：SELECT 字段列表 FROM 表名  ORDER BY 排序字段名1 [排序方式1],排序字段名2 [排序方式2] …;
		* 排序方式：
				* ASC：升序排列（默认值）
				* DESC：降序排列
*/

-- 1.查询学生信息，按照年龄升序排列 

select * from stu order by age ;

-- 2.查询学生信息，按照数学成绩降序排列

select * from stu order by math desc ;

-- 3.查询学生信息，按照数学成绩降序排列，如果数学成绩一样，再按照英语成绩升序排列

select * from stu order by math desc , english asc ;



