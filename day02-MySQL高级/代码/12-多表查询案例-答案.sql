
-- 1.查询所有员工信息。查询员工编号，员工姓名，工资，职务名称，职务描述
/*
	分析：
		1. 员工编号，员工姓名，工资 信息在emp 员工表中
		2. 职务名称，职务描述 信息在 job 职务表中
		3. job 职务表 和 emp 员工表 是 一对多的关系 emp.job_id = job.id

*/
-- 隐式内连接
SELECT
	emp.id,
	emp.ename,
	emp.salary,
	job.jname,
	job.description
FROM
	emp,
	job
WHERE
	emp.job_id = job.id;

SELECT
	*
FROM
	emp;

SELECT
	*
FROM
	job;

-- 显式内连接
SELECT
	emp.id,
	emp.ename,
	emp.salary,
	job.jname,
	job.description
FROM
	emp
INNER JOIN job ON emp.job_id = job.id;

-- 2.查询员工编号，员工姓名，工资，职务名称，职务描述，部门名称，部门位置
/*
	分析：
		1. 员工编号，员工姓名，工资 信息在emp 员工表中
		2. 职务名称，职务描述 信息在 job 职务表中
		3. job 职务表 和 emp 员工表 是 一对多的关系 emp.job_id = job.id

		4. 部门名称，部门位置 来自于 部门表 dept
		5. dept 和 emp 一对多关系 dept.id = emp.dept_id

*/

-- 隐式内连接
SELECT
	emp.id,
	emp.ename,
	emp.salary,
	job.jname,
	job.description,
	dept.dname,
	dept.loc
FROM
	emp,
	job,
	dept
WHERE
	emp.job_id = job.id
	and dept.id = emp.dept_id
;

-- 显式内连接
SELECT
	emp.id,
	emp.ename,
	emp.salary,
	job.jname,
	job.description,
	dept.dname,
	dept.loc
FROM
	emp
INNER JOIN job ON emp.job_id = job.id
INNER JOIN dept ON dept.id = emp.dept_id
;


-- 3.查询员工姓名，工资，工资等级
/*
	分析：
		1. 员工姓名，工资 信息在emp 员工表中
		2. 工资等级 信息在 salarygrade 工资等级表中
		3. emp.salary >= salarygrade.losalary  and emp.salary <= salarygrade.hisalary


*/


SELECT
	emp.ename,
	emp.salary,
	t2.*
FROM
	emp,
	salarygrade t2
WHERE
	emp.salary >= t2.losalary
AND emp.salary <= t2.hisalary





-- 4.查询员工姓名，工资，职务名称，职务描述，部门名称，部门位置，工资等级

/*
	分析：
		1. 员工编号，员工姓名，工资 信息在emp 员工表中
		2. 职务名称，职务描述 信息在 job 职务表中
		3. job 职务表 和 emp 员工表 是 一对多的关系 emp.job_id = job.id

		4. 部门名称，部门位置 来自于 部门表 dept
		5. dept 和 emp 一对多关系 dept.id = emp.dept_id
		6. 工资等级 信息在 salarygrade 工资等级表中
		7. emp.salary >= salarygrade.losalary  and emp.salary <= salarygrade.hisalary
*/
SELECT
	emp.id,
	emp.ename,
	emp.salary,
	job.jname,
	job.description,
	dept.dname,
	dept.loc,
	t2.grade
FROM
	emp
INNER JOIN job ON emp.job_id = job.id
INNER JOIN dept ON dept.id = emp.dept_id
INNER JOIN salarygrade t2 ON emp.salary BETWEEN t2.losalary and t2.hisalary;






-- 5.查询出部门编号、部门名称、部门位置、部门人数
/*
	分析：
		1. 部门编号、部门名称、部门位置 来自于部门 dept 表
		2. 部门人数: 在emp表中 按照dept_id 进行分组，然后count(*)统计数量
		3. 使用子查询，让部门表和分组后的表进行内连接
*/
select * from dept;

select dept_id, count(*) from emp group by dept_id;




SELECT
	dept.id,
	dept.dname,
	dept.loc,
	t1.count
FROM
	dept,
	(
		SELECT
			dept_id,
			count(*) count
		FROM
			emp
		GROUP BY
			dept_id
	) t1
WHERE
	dept.id = t1.dept_id


