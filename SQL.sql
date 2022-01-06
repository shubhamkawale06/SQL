create table student (
no number(2),
name varchar(10),
marks number(3));

select * from student;

insert into student values(
1,'sudha',100);

insert into student values(
2,'saketh',200);

insert into student values(
&no,
'&name',
&marks);

insert into student (
no,
name) values(
3,'Ramesh');

insert into student(
no,
name) values(
4,'Madhu');

select * from student;

insert into student(
no,name) values(
&no,&name);

alter table student add sdob date;

alter table student modify marks number(5);

ALTER TABLE STUDENT RENAME COLUMN MARKS TO SMARKS;

SELECT * FROM STUDENT ;

ALTER TABLE STUDENT SET UNUSED COLUMN SDOB;

SELECT * FROM STUDENT;

ALTER TABLE STUDENT DROP UNUSED COLUMN;

SELECT * FROM STUDENT;


--for RENAMING THE TABLE
rename student to stud;

COMMIT;

SELECT * FROM STUDENT ;

ROLLBACK;

SELECT  * FROM STUD;

RENAME STUD TO STUDENT;

SELECT * FROM STUDENT;

RENAME STUDENT TO STUD;

CREATE TABLE STUDENT (
NO NUMBER,
NAME VARCHAR2(20),
MARKS NUMBER);

INSERT INTO  STUDENT (
NO,NAME,MARKS) VALUES(
&NO,&NAME,&MARKS);

SAVEPOINT S4;

SELECT * FROM STUDENT;

ROLLBACK TO S3;

SELECT * FROM STUDENT;

ROLLBACK TO S2;

SELECT * FROM STUDENT ;

ROLLBACK TO S1;

SELECT * FROM STUDENT;

SELECT * FROM SHUBHAM.STUDENT;

GRANT SELECT ON STUDENT TO INVENTORY1;

SELECT * FROM INVENTORY1.STUDENT;


REVOKE SELECT ON STUDENT FROM INVENTORY1;


SELECT * FROM STUDENT;

DROP TABLE STUDENT;

SELECT * FROM STUD;

CREATE TABLE NEWSTUD AS (SELECT * FROM STUD);

SELECT * FROM NEWSTUD;
 
CREATE TABLE NEW1STUD(NO1,NUM2,NUM3) AS 
SELECT * FROM NEWSTUD;

SELECT * FROM NEW1STUD;

CREATE TABLE NEW2STUD(NO1,NO2) AS SELECT NO,NAME FROM
STUD;

SELECT * FROM NEW2STUD;

CREATE TABLE NEW3STUD (NUM1,NUM2,NUM3)
AS SELECT * FROM STUD WHERE NO = 2;

SELECT * FROM NEW3STUD;

DROP TABLE NEW3STUD;

INSERT INTO NEW3STUD SELECT * FROM STUD;

SELECT * FROM NEW3STUD;

SELECT * FROM NEW3STUD;

SELECT * FROM STUD;
ALTER TABLE STUD RENAME COLUMN NO TO NUMBERs;

SELECT * FROM NEW3STUD;

MERGE INTO NEW3STUD T
USING STUD S
On (S.numbers = T.NUM1)
WHEN MATCHED THEN
UPDATE SET T.NUM2 = S.NAME 
WHEN NOT MATCHED THEN
INSERT (S.numbers,S.NAME,S.SMARKS)
VALUES (T.NUM1,T.NUM2,T.NUM3);

--
CREATE TABLE SourceProducts(
    ProductID		INT,
    ProductName		VARCHAR(50),
    Price			DECIMAL(9,2)
);

INSERT INTO SourceProducts(ProductID,ProductName, Price) VALUES(1,'Table',100);
INSERT INTO SourceProducts(ProductID,ProductName, Price) VALUES(2,'Desk',80);
INSERT INTO SourceProducts(ProductID,ProductName, Price) VALUES(3,'Chair',50);
INSERT INTO SourceProducts(ProductID,ProductName, Price) VALUES(4,'Computer',300);


CREATE TABLE TargetProducts(
    ProductID		INT,
    ProductName		VARCHAR(50),
    Price			DECIMAL(9,2)
);

    
INSERT INTO TargetProducts(ProductID,ProductName, Price) VALUES(1,'Table',100);
INSERT INTO TargetProducts(ProductID,ProductName, Price) VALUES(2,'Desk',180);
INSERT INTO TargetProducts(ProductID,ProductName, Price) VALUES(5,'Bed',50);
INSERT INTO TargetProducts(ProductID,ProductName, Price) VALUES(6,'Cupboard',300);


SELECT * FROM SourceProducts;
SELECT * FROM TargetProducts;

merge into targetproducts t
using sourceproducts s
on t.productid  = s.productid
when matched then
update set t.price = s.price;


MERGE into TargetProducts  Target
USING SourceProducts	 Source
ON Source.ProductID = Target.ProductID
WHEN NOT MATCHED  THEN
INSERT (ProductID,ProductName, Price) 
VALUES (Source.ProductID,Source.ProductName, Source.Price);


CREATE TABLE people_source ( 
  person_id  INTEGER NOT NULL PRIMARY KEY, 
  first_name VARCHAR2(20) NOT NULL, 
  last_name  VARCHAR2(20) NOT NULL, 
  title      VARCHAR2(10) NOT NULL 
);

CREATE TABLE people_target ( 
  person_id  INTEGER NOT NULL PRIMARY KEY, 
  first_name VARCHAR2(20) NOT NULL, 
  last_name  VARCHAR2(20) NOT NULL, 
  title      VARCHAR2(10) NOT NULL 
);

INSERT INTO people_target VALUES (1, 'John', 'Smith', 'Mr');
INSERT INTO people_target VALUES (2, 'alice', 'jones', 'Mrs');
INSERT INTO people_source VALUES (2, 'Alice', 'Jones', 'Mrs.');
INSERT INTO people_source VALUES (3, 'Jane', 'Doe', 'Miss');
INSERT INTO people_source VALUES (4, 'Dave', 'Brown', 'Mr');

COMMIT;

select * from people_target;
select * from people_source;

merge into people_target t
using people_source s
on (s.person_id = t.person_id)
when not matched then
insert (person_id,first_name,last_name,title)
values (person_id,first_name,last_name,title);

--insert muliple

select * from student;
insert all
into student values(1,'a',100)
into student values(2,'b',200)
into student values(3,'c',300)
select * from stud;
rollback;
--
--create table dept (
--deptno number,
--dname varchar2(20),
--loc varchar2(20));
--
--insert into dept (deptno,dname,loc)values(
--10,'accounting','new york'),
--(20,'research','dallas'),
--(30,'sales','Chicago'),
--(40,'operation','bostan


functions

--abs
select abs(50),abs(-40),abs(0),abs(null) from dual;

--sign

select sign(5),sign(-6),sign(0),sign(null) from dual;

--sqrt
select sqrt(4),sqrt(0),sqrt(null),sqrt(1) from dual;

select numbers,name,nvl(smarks,300) from stud;
select * from stud;


--sysdate

select sysdate from dual;
select current_date,sysdate from dual;
select current_timestamp,current_date,sysdate from dual;
select systimestamp from dual;

select localtimestamp from dual;

slect dbtimezone from dual;

select sessiontimezone from dual;

select to_char(sysdate,'DD MONTH YYYY HH:MI:SS AM DY') from dual;

SELECT TO_CHAR(TO_DATE('26/DEC/2018','DD MON YYYY'),'DD * MONTH * DAY') FROM DUAL;

select months_between(to_date('26-AUG-2019','DD-MON-YYYY'),to_date('26-JAN-2019','DD-MON-YYYY')) FROM DUAL;

SELECT TRUNC(TO_DATE(20220101,'YYYYMMDD'),'MONTH')
FROM DUAL;

SELECT TO_DATE(20220101,'YYYYMMDD') FROM DUAL;


SELECT UID FROM DUAL;
SELECT USER FROM DUAL;

--DATE 03/01/22
--PRIMARY FOREIGN KEY

DROP TABLE STUDENT;
CREATE TABLE STUDENT(
NO NUMBER NOT NULL,
NAME VARCHAR2(20),
MARKS NUMBER(3));

INSERT INTO STUDENT (
NAME,MARKS)VALUES(
'SHUBHAM',100);

CREATE TABLE STUDENT (
NO NUMBER CONSTRAINT NN NOT NULL,
NAME VARCHAR2(20),
MARKS NUMBER(3));

INSERT INTO STUDENT(
NAME,
MARKS) VALUES ('SHUBHAM',100);

INSERT INTO STUDENT VALUES(
1,'SHUBHAM',200);

SELECT * FROM STUDENT;

TRUNCATE TABLE STUDENT;

SELECT * FROM STUDENT;

DROP TABLE STUDENT;

CREATE TABLE STUDENT(
NO NUMBER NOT  NULL,
NAME VARCHAR2(20),
MARKS NUMBER CHECK (MARKS < 200));

INSERT INTO STUDENT VALUES(1,'SHUBHAM',400);

INSERT INTO STUDENT VALUES (1,'SHUBHAM',199);

SELECT * FROM STUDENT;

TRUNCATE TABLE STUDENT;

DROP TABLE STUDENT;

CREATE TABLE STUDENT(
NO NUMBER CONSTRAINT NN NOT NULL,
NAME VARCHAR2(20),
MARKS NUMBER CONSTRAINT CH CHECK (MARKS < 200));

INSERT INTO STUDENT VALUES(1,'SHUBHAM',199);

SELECT * FROM STUDENT;

TRUNCATE TABLE STUDENT;

DROP TABLE STUDENT;

--PRIMARY KEY

CREATE TABLE STUDENT(
NO NUMBER PRIMARY KEY,
NAME VARCHAR2(30),
MARKS NUMBER);

INSERT INTO STUDENT VALUES (&NO,&NAME,&MARKS);

TRUNCATE TABLE STUDENT;

DROP TABLE STUDENT;

CREATE TABLE STUDENT(
NO NUMBER CONSTRAINT PK PRIMARY KEY,
NAME VARCHAR2(20),
MARKS NUMBER);

INSERT INTO STUDENT VALUES(&NO,&NAME,&MARKS);

TRUNCATE TABLE STUDENT;

DROP TABLE STUDENT;

--FOREIGN KEY

CREATE TABLE DEPT(DEPTNO NUMBER CONSTRAINT PK PRIMARY KEY,
DNAME VARCHAR2(20),
LOCATION VARCHAR2(20));

DROP TABLE DEPT;

insert into dept values (10,'Accounting','New York');

insert into dept values (20,'Research','Dallas');

insert into dept values (30,'Sales','Chicago');

insert into dept values (40,'Operations','Boston');

CREATE TABLE EMP(EMPNO NUMBER,
EMPNAME VARCHAR2(20),
DEPTNO NUMBER,CONSTRAINT FK FOREIGN KEY(DEPTNO) REFERENCES DEPT(DEPTNO));

DROP TABLE EMP;

INSERT INTO EMP VALUES(
2,'RAHUL',20);

DELETE FROM EMP WHERE DEPTNO = 20;
ROLLBACK;
SELECT * FROM DEPT;

SELECT * FROM EMP;

CREATE TABLE DOC(
DOCID NUMBER PRIMARY KEY,
DOCNAME VARCHAR2(20));

CREATE TABLE DOCINFO(
IDS NUMBER,
LOC VARCHAR2(20),CONSTRAINT FK FOREIGN KEY(IDS) REFERENCES DOC(DOCID));

DROP TABLE DOCINFO;

SELECT * FROM DOC;

INSERT INTO DOC VALUES(&DOCID,&DOCNAME);

CREATE TABLE DOCINFO(
DOCID NUMBER,
LOC VARCHAR2(20),
FOREIGN KEY(DOCID) REFERENCES DOC(DOCID));

INSERT INTO DOCINFO VALUES(
3,'TIRODA');

SELECT * FROM DOCINFO;
SELECT * FROM DOC;


SELECT 
D.DOCID,
D.DOCNAME,
DC.LOC FROM DOC D ,DOCINFO DC WHERE D.DOCID = DC.DOCID;

DELETE FROM DOC WHERE DOCID = 1;
SELECT * FROM DUAL;


--TYPE IN SQL
CREATE TYPE ADDR AS OBJECT(HNO NUMBER,CITY VARCHAR2(20));/
DROP TYPE ADDR;

DROP TABLE STUDENT;

CREATE TABLE STUDENT(ID NUMBER,NAME VARCHAR2(20),ADDRESS ADDR);

INSERT INTO STUDENT VALUES(3,'HOMIT',ADDR(345,'MALI'));

SELECT S.ID,S.NAME,S.ADDRESS.HNO HOUSENUMBER,S.ADDRESS.CITY CITY FROM STUDENT S;

UPDATE STUDENT S SET S.ADDRESS.CITY = 'NAGPUR' WHERE S.ADDRESS.HNO = 234;

DELETE FROM STUDENT S WHERE S.ADDRESS.HNO = 123;

SELECT S.ID,S.NAME,S.ADDRESS.HNO,S.ADDRESS.CITY FROM STUDENT S;

DROP TYPE ADDR;

DROP TABLE STUDENT;

DROP TYPE ADDR;





