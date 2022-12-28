-- 1.利用下列資料來新建DEPARTMENT資料表。
CREATE TABLE department
(id INT NOT NULL, name VARCHAR(24) NOT NULL);
DESC department;

-- 2.利用DEPT資料表中的資料,將資料新增至DEPARTMENT資料表中(只新增相對的資料欄)。
DROP TABLE department;
CREATE TABLE department
AS
SELECT deptno, dname name FROM dept;

SELECT * FROM department;

-- 3.利用下列資料來新建EMPLOYEE資料表。
CREATE TABLE employee
(id INT NOT NULL, last_name VARCHAR(24) NOT NULL, first_name VARCHAR(24), dept_id INT);
DESC employee;

-- 4.將EMPLOYEE資料表中last_name欄位的資料型態更改為varchar(40)。
ALTER TABLE employee
CHANGE last_name last_name VARCHAR(40);
DESC employee;

-- 5.使用EMP資料表的結構中之EMPNO, ENAME,andDEPTNO之定義來新建EMPLOYEE2資料表並將欄位名稱設定為ID, LAST_NAME, and DEPT_ID。
CREATE TABLE employee2
AS
SELECT empno as ID, ename as LAST_NAME, deptno as DEPT_ID
FROM emp;
DESC employee2;

-- 6.刪除整個EMPLOYEE資料表。
DROP TABLE employee;

-- 7.將EMPLOYEE2資料表改名為EMPLOYEE。
ALTER TABLE employee2
RENAME TO employee;

-- 8.將EMPLOYEE資料表中的LAST_NAME欄位刪除。
ALTER TABLE employee
DROP last_name;
DESC employee;

-- 9.修改EMPLOYEE資料表,新增一個欄位SALARY 資料型態為INT。
ALTER TABLE employee
ADD SALARY INT;
DESC employee;

-- 10.修改EMPLOYEE資料表,使用ID欄位新增一個Primary key的限制條件(constraint),並為他命名。
ALTER TABLE employee
ADD CONSTRAINT PK_empolyee_ID primary key(ID);
SHOW INDEXES FROM employee;

-- 11.在EMPLOYEE資料表新增一個外部鍵(foreign key)以確保員工不會被分派到一個不存在的部門。
ALTER TABLE employee
ADD CONSTRAINT FK_employee_DEPT_ID FOREIGN KEY(DEPT_ID) REFERENCES dept(deptno);
SHOW INDEXES FROM employee;


