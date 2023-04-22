CREATE TABLE EMP_DDL(
   EMPNO      NUMBER(4),
   ENAME      VARCHAR2(10),
   JOB        VARCHAR2(9),
   MGR        NUMBER(4),
   HIREDATE   DATE,
   SAL        NUMBER(7,2),
   COMM       NUMBER(7,2),
   DEPTNO     NUMBER(2)
);

insert into EMP_DDL values(1001, 'kimsoo','developer', 2001, '1981-01-01', 500,20,30);
insert into EMP_DDL values(1002, 'yoonhoil','salesman', 2000, '1991-01-01', 400,10,30);
insert into EMP_DDL values(1003, 'jangsosu','developer', 2001, '2001-01-01', 300,20,30);
insert into EMP_DDL(EMPNO,HIREDATE, SAL ,COMM,DEPTNO) values(1004, '2001-01-01', 300,20,30);
insert into EMP_DDL(JOB, MGR, ENAME) values('salesman',2003,'hanjinsa');
update EMP_DDL 
set JOB='salesman', MGR=2003, ENAME='hanjinsa'
where EMPNO=1004;

1.�Ի����� 2000�� ������ �Ի��� ������� ����(comm)�� 40���� �����Ͻÿ�.
update EMP_DDL 
set comm=40
where HIREDATE < '2000-01-01';

select comm,HIREDATE  from  EMP_DDL
where HIREDATE < '2000-01-01';

2. mgr�� 2001�� ����� �޿��� 1.5��� �λ��Ͻÿ�.

update EMP_DDL 
set sal=sal * 1.5
where mgr=2001;

select sal,mgr  from  EMP_DDL
where mgr=2001;

select * from emp_ddl;

delete from emp_ddl
where empno is null;

3. emp_ddl�� ������ emp ���̺��� �����Ͻÿ�.
��, create, select ���� Ȱ���Ͻÿ�.

create table emp
as select * from emp_ddl;

select * from emp;


4. emp_ddl�� ������ ��� �����Ͻÿ�.
��, delete ����� ����Ͻÿ�.
delete from emp_ddl;

5. data ���� �� Ȯ��
select * from emp_ddl;

6. emp_ddl ���̺�� �� ������ ��� �����Ͻÿ�. (���� �� Ȯ��)
drop table emp_ddl;
select * from emp_ddl; 

7. emp ���̺��� ������ Ȯ��
select * from emp;

8. mgr=2001�� �����  comm�� 50���� ����
update emp set comm=50;
rollback;
select * from emp;

delete emp;
rollback;
select * from emp;

7. create�� select�� �̿��Ͽ� emp ���̺��� ������ ������ 
   ������ �����ؼ� emp_ddl�� ����ÿ�.
create table emp_ddl 
  as select * from emp 
   where 1<>1 ; 
   
   
8. insert�� select�� Ȱ���Ͽ� emp�� ������ emp_ddl�� �����Ͻÿ�.
insert into emp_ddl 
       select * from emp;

select * from emp_ddl;

9.empno=1003 �� �����͸� �����Ͻÿ�.
delete from emp_ddl 
where empno=1003;
commit;
rollback;
select * from emp_ddl;
DESC emp_DDL;         //dmp_ddl ��Ű�� ���� Ȯ��

10.EMP ���̺��� ������ ������ �����ؼ� EMP_ALTER ���̺��� ����
CREATE TABLE EMP_ALTER
    AS SELECT * FROM EMP;
SELECT * FROM EMP_ALTER;

11. EMP_ALTER ���̺� HP �ʵ� ���� �߰� VARCHAR2(20).
ALTER TABLE EMP_ALTER
  ADD HP VARCHAR2(20);
SELECT * FROM EMP_ALTER;

12. emp_alter ���̺��� hp���� ������ ������ �Է��Ͻÿ�.
��, update ����� ����Ͻÿ�
update EMP_ALTER set hp='010-1111-2222' where empno=1001;
update EMP_ALTER set hp='010-2222-2222' where empno=1002;
update EMP_ALTER set hp='010-3333-2222' where empno=1003;
update EMP_ALTER set hp='010-4444-2222' where empno=1004;
SELECT * FROM EMP_ALTER;

-- �ǽ� 12-8
ALTER TABLE EMP_ALTER
RENAME COLUMN HP TO TEL;

SELECT * FROM EMP_ALTER;

-- �ǽ� 12-9
ALTER TABLE EMP_ALTER
MODIFY EMPNO NUMBER(5);
DESC EMP_ALTER;

13. EMP_ALTER ���̺��� ename�� varchar2(20)���� �����Ͻÿ�.
ALTER TABLE EMP_ALTER
MODIFY ename varchar2(20);
DESC EMP_ALTER;

14. EMP_ALTER ���̺��� TEL �ʵ� ���� �� Ȯ��
ALTER TABLE EMP_ALTER
 DROP COLUMN TEL;
SELECT * FROM EMP_ALTER;

15. EMP_ALTER ���̺��� �̸��� EMP_RENAME���� ����
RENAME EMP_ALTER TO EMP_RENAME;
DESC EMP_ALTER;  -- �����߻�
DESC EMP_RENAME;

16. P324 Q1,2,3,4,5,6 ������ Ǯ�����.
--Q1
CREATE TABLE EMP_HW(
    EMPNO NUMBER(4),
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2)
);
--Q2
ALTER TABLE EMP_HW 
  ADD BIGO VARCHAR2(20);
--Q3
ALTER TABLE EMP_HW 
  MODIFY BIGO VARCHAR2(30);

--Q4
ALTER TABLE EMP_HW 
  RENAME COLUMN BIGO TO REMARK;
  
--Q5
INSERT INTO EMP_HW(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO,remark) 
    SELECT * FROM EMP;
    
insert into emp_hw
    select empno, ename, job, mgr, hiredate, sal, comm, deptno, null 
    from emp;

--Q6
DROP TABLE EMP_HW;

SELECT * FROM EMP;
-- �� ������ and or
SELECT *
  FROM EMP
 WHERE DEPTNO=30 AND JOB = 'salesman';
 
SELECT *
  FROM EMP
 WHERE DEPTNO = 30 OR JOB = 'CLERK';

--���������  + - * /
SELECT *
  FROM EMP
 WHERE SAL * 12 = 3600;
 
 SELECT *
  FROM EMP
 WHERE SAL > 300;

SELECT *
  FROM EMP
 WHERE ENAME >= 'k';

SELECT *
  FROM EMP
 WHERE ENAME <= 'kim';

SELECT *
  FROM EMP
 WHERE SAL != 300;

SELECT *
  FROM EMP
 WHERE SAL <> 300;

SELECT *
  FROM EMP
 WHERE SAL ^= 300;

SELECT *
  FROM EMP
 WHERE NOT SAL = 300;
 
SELECT *
  FROM EMP
 WHERE JOB = 'developer'  OR JOB = 'salesman';

SELECT *
  FROM EMP
 WHERE JOB IN ('developer', 'salesman');
 
 
 