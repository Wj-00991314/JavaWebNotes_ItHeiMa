-- 查询所有数据
SELECT
	*
FROM
	stu;


-- 给指定列添加数据 INSERT INTO 表名(列名1,列名2,…) VALUES(值1,值2,…);
INSERT INTO stu (id, NAME)
VALUES
	(1, '张三');

-- 给所有列添加数据，列名的列表可以省略的
INSERT INTO stu (
	id, -- 编号
	NAME,-- 姓名
	sex,
	birthday,
	score,
	email,
	tel,
	STATUS
)
VALUES
	(
		2,
		'李四',
		'男',
		'1999-11-11',
		88.88,
		'lisi@itcast.cn',
		'13888888888',
		1
	);

INSERT INTO stu
VALUES
	(
		2,
		'李四',
		'男',
		'1999-11-11',
		88.88,
		'lisi@itcast.cn',
		'13888888888',
		1
	);


INSERT INTO stu
VALUES
	(
		2,
		'李四',
		'男',
		'1999-11-11',
		88.88,
		'lisi@itcast.cn',
		'13888888888',
		1
	),(
		2,
		'李四',
		'男',
		'1999-11-11',
		88.88,
		'lisi@itcast.cn',
		'13888888888',
		1
	),(
		2,
		'李四',
		'男',
		'1999-11-11',
		88.88,
		'lisi@itcast.cn',
		'13888888888',
		1
	);

select * from stu;

-- 修改数据 UPDATE 表名 SET 列名1=值1,列名2=值2,… [WHERE 条件] ;

-- 将张三的性别改为女

update stu set sex = '女' where name = '张三';

-- 将张三的生日改为 1999-12-12 分数改为99.99

update stu set birthday = '1999-12-12', score = 99.99 where name = '张三';


-- 注意：如果update语句没有加where条件，则会将表中所有数据全部修改！

update stu set sex = '女';


-- 删除  DELETE FROM 表名 [WHERE 条件] ;


-- 删除张三记录

delete from stu where name = '张三';

delete from stu;
