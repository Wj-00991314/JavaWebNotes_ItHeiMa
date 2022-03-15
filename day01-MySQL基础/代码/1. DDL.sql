



create table tb_user(

	id int ,
	username varchar(20),
	password varchar(32)

);





-- 学生表
create table tb_stu(
	id int ,-- 编号
	name varchar(10),-- 姓名
	gender char(1),-- 性别
	birthday date,-- 生日
	score double(5,2) ,-- 分数
	email varchar(64),-- 邮箱
	tel varchar(20),-- 手机号
	status tinyint-- 状态
);



