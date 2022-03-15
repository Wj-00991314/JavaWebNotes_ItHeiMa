SELECT * FROM stu;

-- 条件查询 =====================

-- 1.查询年龄大于20岁的学员信息
select * from stu where age > 20;


-- 2.查询年龄大于等于20岁的学员信息
select * from stu where age >= 20;


-- 3.查询年龄大于等于20岁 并且 年龄 小于等于 30岁 的学员信息
select * from stu where age >= 20 &&  age <= 30;
select * from stu where age >= 20 and  age <= 30;

select * from stu where age BETWEEN 20 and 30;

-- 4.查询入学日期在'1998-09-01' 到 '1999-09-01'  之间的学员信息

select * from stu where hire_date BETWEEN '1998-09-01' and '1999-09-01';


-- 5. 查询年龄等于18岁的学员信息

select * from stu where age = 18;

-- 6. 查询年龄不等于18岁的学员信息
select * from stu where age != 18;

select * from stu where age <> 18;

-- 7. 查询年龄等于18岁 或者 年龄等于20岁 或者 年龄等于22岁的学员信息
select * from stu where age = 18 or age = 20 or age = 22;
select * from stu where age in (18,20 ,22);

-- 8. 查询英语成绩为 null的学员信息  
-- 注意： null值的比较不能使用 = != 。需要使用 is  is not
 
select * from stu where english = null; -- 不行的

select * from stu where english is null;

select * from stu where english is not null;


-- 模糊查询 like =====================
/*
	通配符：
	 (1)_:代表单个任意字符
	 (2)%:代表任意个数字符
*/

-- 1. 查询姓'马'的学员信息

select * from stu where name like '马%';

-- 2. 查询第二个字是'花'的学员信息   

select * from stu where name like '_花%';

-- 3. 查询名字中包含 '德' 的学员信息

select * from stu where name like '%德%';











