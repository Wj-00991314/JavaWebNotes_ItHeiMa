-- 创建用户表
CREATE TABLE tb_user(
	id int primary key auto_increment,
	username varchar(20) unique,
	password varchar(32)
);

-- 添加数据
INSERT INTO tb_user(username,password) values('zhangsan','123'),('lisi','234');

SELECT * FROM tb_user;


