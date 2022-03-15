/*
	外键约束:
		* 外键用来让两个表的数据之间建立链接，保证数据的一致性和完整性

	
	-- 创建表时添加外键约束
	CREATE TABLE 表名(
		 列名 数据类型,
		 …
		 [CONSTRAINT] [外键名称] FOREIGN KEY(外键列名) REFERENCES 主表(主表列名) 
	); 


	-- 建完表后添加外键约束
	ALTER TABLE 表名 ADD CONSTRAINT 外键名称 FOREIGN KEY (外键字段名称) REFERENCES 主表名称(主表列名称);


	-- 删除约束
	ALTER TABLE 表名 DROP FOREIGN KEY 外键名称;
	
	
*/
-- 删除表
DROP TABLE IF EXISTS emp;
DROP TABLE IF EXISTS dept;


-- 部门表
CREATE TABLE dept(
	id int primary key auto_increment,
	dep_name varchar(20),
	addr varchar(20)
);
-- 员工表 
CREATE TABLE emp(
	id int primary key auto_increment,
	name varchar(20),
	age int,
	dep_id int,

	-- 添加外键 dep_id,关联 dept 表的id主键
	CONSTRAINT fk_emp_dept FOREIGN KEY(dep_id) REFERENCES dept(id)
		
);
-- 添加 2 个部门
insert into dept(dep_name,addr) values
('研发部','广州'),('销售部', '深圳');

-- 添加员工,dep_id 表示员工所在的部门
INSERT INTO emp (NAME, age, dep_id) VALUES 
('张三', 20, 1),
('李四', 20, 1),
('王五', 20, 1),
('赵六', 20, 2),
('孙七', 22, 2),
('周八', 18, 2);

-- ------------------
select * from emp;


-- 删除外键
alter table emp drop FOREIGN key fk_emp_dept;



-- 建完表后，添加外键

alter table emp add CONSTRAINT fk_emp_dept FOREIGN key(dep_id) REFERENCES dept(id);


