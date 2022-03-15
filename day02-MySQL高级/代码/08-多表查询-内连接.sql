DROP TABLE
IF EXISTS emp;

DROP TABLE
IF EXISTS dept;

# 创建部门表
CREATE TABLE dept (
	did INT PRIMARY KEY AUTO_INCREMENT,
	dname VARCHAR (20)
);

# 创建员工表
CREATE TABLE emp (
	id INT PRIMARY KEY AUTO_INCREMENT,
	NAME VARCHAR (10),
	gender CHAR (1),
	-- 性别
	salary DOUBLE,
	-- 工资
	join_date DATE,
	-- 入职日期
	dep_id INT,
	FOREIGN KEY (dep_id) REFERENCES dept (did) -- 外键，关联部门表(部门表的主键)
);

-- 添加部门数据
INSERT INTO dept (dNAME)
VALUES
	('研发部'),
	('市场部'),
	('财务部'),
	('销售部');

-- 添加员工数据
INSERT INTO emp (
	NAME,
	gender,
	salary,
	join_date,
	dep_id
)
VALUES
	(
		'孙悟空',
		'男',
		7200,
		'2013-02-24',
		1
	),
	(
		'猪八戒',
		'男',
		3600,
		'2010-12-02',
		2
	),
	(
		'唐僧',
		'男',
		9000,
		'2008-08-08',
		2
	),
	(
		'白骨精',
		'女',
		5000,
		'2015-10-07',
		3
	),
	(
		'蜘蛛精',
		'女',
		4500,
		'2011-03-14',
		1
	),
	(
		'小白龙',
		'男',
		2500,
		'2011-02-14',
		NULL
	);

SELECT
	*
FROM
	emp;

-- 多表查询
SELECT
	*
FROM
	emp,
	dept;

-- 笛卡尔积 ： 有 A ,B两个集合 取 A,B所有的组合情况
-- 消除无效数据
-- 查询emp 和 dept 的数据 ，emp.dep_id = dept.did
-- 隐式内连接
SELECT
	*
FROM
	emp,
	dept
WHERE
	emp.dep_id = dept.did;

-- 查询 emp的 name， gender，dept表的dname
SELECT
	emp. NAME,
	emp.gender,
	dept.dname
FROM
	emp,
	dept
WHERE
	emp.dep_id = dept.did;

-- 给表 起别名
SELECT
	t1. NAME,
	t1.gender,
	t2.dname
FROM
	emp t1,
	dept t2
WHERE
	t1.dep_id = t2.did;


-- 显式内连接

select * from emp inner join dept on emp.dep_id = dept.did;

select * from emp  join dept on emp.dep_id = dept.did;


