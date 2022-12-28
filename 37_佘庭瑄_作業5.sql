-- 1.顯示所有員工之姓名,所屬部門編號,部門名稱及部門所在地點。
SELECT ename, e.deptno, dname, loc
FROM emp as e JOIN dept as d ON e.deptno=d.deptno;

-- 2.顯示所有有賺取佣金的員工之姓名,佣金金額,部門名稱及部門所在地點。
SELECT ename, comm, dname, loc
FROM emp as e JOIN dept as d ON e.deptno=d.deptno
WHERE comm IS NOT NULL AND comm != 0;

-- 3.顯示姓名中包含有”A”的員工之姓名及部門名稱。
SELECT ename, dname
FROM emp as e JOIN dept as d ON e.deptno=d.deptno
WHERE ename LIKE '%A%';

-- 4.顯示所有在”DALLAS”工作的員工之姓名,職稱,部門編號及部門名稱
SELECT ename, job, e.deptno, dname
FROM emp as e JOIN dept as d ON e.deptno=d.deptno
WHERE loc = "DALLAS";

-- 5.顯示出表頭名為:Employee, Emp#, Manager, Mgr#，分別表示所有員工之姓名,員工編號,主管姓名, 主管的員工編號。
SELECT a.ename as Employee, a.empno as "Emp#", b.ename as Manager, a.mgr as "Mgr#"
FROM emp as a join emp as b on a.mgr=b.empno;

-- 6.顯示出SALGRADE資料表的結構，並建立一查詢顯示所有員工之姓名,職稱,部門名稱,薪資及薪資等級。
SELECT e.ename, e.job, d.dname, e.sal, s.grade
FROM emp as e join dept as d on e.deptno=d.deptno
              join salgrade as s on(e.sal BETWEEN s.losal AND hisal);
                            
-- 7.顯示出表頭名為: Employee, EmpHiredate, Manager, MgrHiredate的資料項，來顯示所有比他的主管還要早進公司的員工之姓名,進公司日期和主管之姓名及進公司日期。
SELECT a.ename as Employee, a.hiredate as EmpHiredate, b.ename as Manager, b.hiredate as MgrHiredate
FROM emp as a join emp as b ON a.mgr = b.empno
WHERE a.hiredate < b.hiredate;

-- 8.顯示出表頭名為: dname, loc, Number of People, Salary的資料來顯示所有部門之部門名稱,部門所在地點,部門員工數量及部門員工的平均薪資，平均薪資四捨五入取到小數第二位。
SELECT d.dname, d.loc, count(e.empno), ROUND(AVG(e.sal), 2)
FROM emp as e join dept as d ON e.deptno=d.deptno
GROUP BY d.dname;





