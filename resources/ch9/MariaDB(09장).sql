
/* 09장 */


-- <실습 1> --

USE sqlDB;
CREATE TABLE  TBL1
	(	a INT PRIMARY KEY,
		b INT,
		c INT
	);

SHOW INDEX FROM TBL1;

CREATE TABLE  TBL2
	(	a INT PRIMARY KEY,
		b INT UNIQUE,
		c INT UNIQUE,
		d INT
	);
SHOW INDEX FROM TBL2;

CREATE TABLE  TBL3
	(	a INT UNIQUE,
		b INT UNIQUE,
		c INT UNIQUE,
		d INT
	);
SHOW INDEX FROM TBL3;

CREATE TABLE  TBL4
	(	a INT UNIQUE NOT NULL,
		b INT UNIQUE ,
		c INT UNIQUE,
		d INT
	);
SHOW INDEX FROM TBL4;

CREATE TABLE  TBL5
	(	a INT UNIQUE NOT NULL,
		b INT UNIQUE ,
		c INT UNIQUE,
		d INT PRIMARY KEY
	);
SHOW INDEX FROM TBL5;

USE sqlDB;
DROP TABLE IF EXISTS userTBL;
CREATE TABLE userTBL 
( userID  char(8) NOT NULL PRIMARY KEY, 
  name    varchar(10) NOT NULL,
  birthYear   int NOT NULL,
  addr	  char(2) NOT NULL 
 );

INSERT INTO userTBL VALUES('LSG', N'이승기', 1987, N'서울');
INSERT INTO userTBL VALUES('KBS', N'김범수', 1979, N'경남');
INSERT INTO userTBL VALUES('KKH', N'김경호', 1971, N'전남');
INSERT INTO userTBL VALUES('JYP', N'조용필', 1950, N'경기');
INSERT INTO userTBL VALUES('SSK', N'성시경', 1979, N'서울');
SELECT * FROM userTBL;

ALTER TABLE userTBL DROP PRIMARY KEY ;
ALTER TABLE userTBL 
	ADD CONSTRAINT pk_name PRIMARY KEY(name);
SELECT * FROM userTBL;

-- </실습 1> --



USE sqlDB;
DROP TABLE IF EXISTS clusterTBL;
CREATE TABLE clusterTBL
( userID  char(8) ,
  name    varchar(10) 
);
INSERT INTO clusterTBL VALUES('LSG', N'이승기');
INSERT INTO clusterTBL VALUES('KBS', N'김범수');
INSERT INTO clusterTBL VALUES('KKH', N'김경호');
INSERT INTO clusterTBL VALUES('JYP', N'조용필');
INSERT INTO clusterTBL VALUES('SSK', N'성시경');
INSERT INTO clusterTBL VALUES('LJB', N'임재범');
INSERT INTO clusterTBL VALUES('YJS', N'윤종신');
INSERT INTO clusterTBL VALUES('EJW', N'은지원');
INSERT INTO clusterTBL VALUES('JKW', N'조관우');
INSERT INTO clusterTBL VALUES('BBK', N'바비킴');

SELECT * FROM clusterTBL;

ALTER TABLE clusterTBL
	ADD CONSTRAINT PK_clusterTBL_userID
		PRIMARY KEY (userID);

SELECT * FROM clusterTBL;

USE sqlDB;
DROP TABLE IF EXISTS secondaryTBL;
CREATE TABLE secondaryTBL
( userID  char(8),
  name    varchar(10)
);
INSERT INTO secondaryTBL VALUES('LSG', N'이승기');
INSERT INTO secondaryTBL VALUES('KBS', N'김범수');
INSERT INTO secondaryTBL VALUES('KKH', N'김경호');
INSERT INTO secondaryTBL VALUES('JYP', N'조용필');
INSERT INTO secondaryTBL VALUES('SSK', N'성시경');
INSERT INTO secondaryTBL VALUES('LJB', N'임재범');
INSERT INTO secondaryTBL VALUES('YJS', N'윤종신');
INSERT INTO secondaryTBL VALUES('EJW', N'은지원');
INSERT INTO secondaryTBL VALUES('JKW', N'조관우');
INSERT INTO secondaryTBL VALUES('BBK', N'바비킴');

ALTER TABLE secondaryTBL
	ADD CONSTRAINT UK_secondaryTBL_userID
		UNIQUE (userID);

SELECT * FROM secondaryTBL;

INSERT INTO clusterTBL VALUES('FNT', '푸니타');
INSERT INTO clusterTBL VALUES('KAI', '카아이');

INSERT INTO secondaryTBL VALUES('FNT', '푸니타');
INSERT INTO secondaryTBL VALUES('KAI', '카아이');



-- <실습 2> --

USE sqlDB;
DROP TABLE IF EXISTS mixedTBL;
CREATE TABLE mixedTBL
( userID  char(8) NOT NULL ,
  name    varchar(10) NOT NULL,
  addr     char(2)
);
INSERT INTO mixedTBL VALUES('LSG', N'이승기', N'서울');
INSERT INTO mixedTBL VALUES('KBS', N'김범수', N'경남');
INSERT INTO mixedTBL VALUES('KKH', N'김경호', N'전남');
INSERT INTO mixedTBL VALUES('JYP', N'조용필', N'경기');
INSERT INTO mixedTBL VALUES('SSK', N'성시경', N'서울');
INSERT INTO mixedTBL VALUES('LJB', N'임재범', N'서울');
INSERT INTO mixedTBL VALUES('YJS', N'윤종신', N'경남');
INSERT INTO mixedTBL VALUES('EJW', N'은지원', N'경북');
INSERT INTO mixedTBL VALUES('JKW', N'조관우', N'경기');
INSERT INTO mixedTBL VALUES('BBK', N'바비킴', N'서울');

ALTER TABLE mixedTBL
	ADD CONSTRAINT PK_mixedTBL_userID
		PRIMARY KEY (userID);

ALTER TABLE mixedTBL
	ADD CONSTRAINT UK_mixedTBL_name
		UNIQUE (name) ;

SHOW INDEX FROM mixedTBL;

SELECT addr FROM mixedTBL WHERE name = '임재범';

-- </실습 2> --



-- <실습 3> --

USE sqlDB;
SELECT * FROM userTBL;

USE sqlDB;
SHOW INDEX FROM userTBL;

SHOW TABLE STATUS LIKE 'userTBL';

CREATE INDEX idx_userTBL_addr 
   ON userTBL (addr);

SHOW INDEX FROM userTBL ;

SHOW TABLE STATUS LIKE 'userTBL' ;

ANALYZE TABLE userTBL;
SHOW TABLE STATUS LIKE 'userTBL';

CREATE UNIQUE INDEX idx_userTBL_birthYear
	ON userTBL (birthYear);

CREATE UNIQUE INDEX idx_userTBL_name
	ON userTBL (name);

SHOW INDEX FROM userTBL ;

INSERT INTO userTBL VALUES('GPS', '김범수', 1983, '미국', NULL  , NULL  , 162, NULL);

CREATE INDEX idx_userTBL_name_birthYear
	ON userTBL (name,birthYear);
DROP INDEX idx_userTBL_name ON userTBL;

SHOW INDEX FROM userTBL ;

EXPLAIN SELECT * FROM userTBL WHERE name = '윤종신' and birthYear = '1969'

-- SELECT * FROM userTBL WHERE name = '윤종신';

CREATE INDEX idx_userTBL_mobile1
	ON userTBL (mobile1);

SELECT * FROM userTBL WHERE mobile1 = '011';

EXPLAIN SELECT * FROM userTBL WHERE mobile1 = '011';

SHOW INDEX FROM userTBL ;

DROP INDEX idx_userTBL_addr ON userTBL;
DROP INDEX idx_userTBL_name_birthYear ON userTBL;
DROP INDEX idx_userTBL_mobile1 ON userTBL;

/*
ALTER TABLE userTBL DROP INDEX idx_userTBL_addr;
ALTER TABLE userTBL DROP INDEX idx_userTBL_name_birthYear;
ALTER TABLE userTBL DROP INDEX idx_userTBL_mobile1;
*/

ALTER TABLE userTBL DROP PRIMARY KEY;

SELECT table_name, constraint_name
    FROM information_schema.referential_constraints
    WHERE constraint_schema = 'sqlDB';

ALTER TABLE buyTBL DROP FOREIGN KEY buyTBL_ibfk_1;
ALTER TABLE userTBL DROP PRIMARY KEY;

-- </실습 3> --



-- <실습 4> --

CREATE DATABASE IF NOT EXISTS indexDB;

USE indexDB;
SELECT COUNT(*) FROM employees.employees;

CREATE TABLE Emp SELECT * FROM employees.employees ORDER BY RAND();
CREATE TABLE Emp_C SELECT * FROM employees.employees ORDER BY RAND();
CREATE TABLE Emp_Se SELECT * FROM employees.employees ORDER BY RAND();

SELECT * FROM Emp LIMIT 5;
SELECT * FROM Emp_C LIMIT 5;
SELECT * FROM Emp_Se LIMIT 5;

SHOW TABLE STATUS ;

ALTER TABLE Emp_C ADD PRIMARY KEY(emp_no);
ALTER TABLE Emp_Se ADD INDEX idx_emp_no (emp_no);

SELECT * FROM Emp LIMIT 5;
SELECT * FROM Emp_C LIMIT 5;
SELECT * FROM Emp_Se LIMIT 5;

ANALYZE TABLE Emp, Emp_c, Emp_Se;

SHOW INDEX FROM Emp;
SHOW INDEX FROM Emp_C;
SHOW INDEX FROM Emp_Se;
SHOW TABLE STATUS;

USE indexDB;

SELECT * FROM Emp WHERE emp_no = 100000;

EXPLAIN SELECT * FROM Emp WHERE emp_no = 100000;

SELECT * FROM Emp_C WHERE emp_no = 100000;

EXPLAIN SELECT * FROM Emp_C WHERE emp_no = 100000;

SELECT * FROM Emp_Se WHERE emp_no = 100000;

EXPLAIN SELECT * FROM Emp_Se WHERE emp_no = 100000;

SELECT * FROM Emp WHERE emp_no < 11000;

EXPLAIN SELECT * FROM Emp WHERE emp_no < 11000;

SELECT * FROM Emp_C WHERE emp_no < 11000;

EXPLAIN SELECT * FROM Emp_C WHERE emp_no < 11000;

SELECT * FROM Emp_C IGNORE INDEX(PRIMARY) WHERE emp_no < 11000; 

EXPLAIN SELECT * FROM Emp_C IGNORE INDEX(PRIMARY) WHERE emp_no < 11000; 

SELECT * FROM Emp_C; -- 전체 데이터를 읽음

EXPLAIN SELECT * FROM Emp_C; -- 전체 데이터를 읽음

SELECT * FROM Emp_Se WHERE emp_no < 11000;

EXPLAIN SELECT * FROM Emp_Se WHERE emp_no < 11000;

SELECT * FROM Emp_Se IGNORE INDEX(idx_emp_no) WHERE emp_no < 11000;

SELECT * FROM Emp_Se  WHERE emp_no < 400000;

EXPLAIN SELECT * FROM Emp_Se  WHERE emp_no < 400000;

EXPLAIN SELECT * FROM Emp_Se  WHERE emp_no < 30000;

SELECT * FROM Emp_C WHERE emp_no = 100000;

SELECT * FROM Emp_C WHERE emp_no * 1 = 100000;

EXPLAIN SELECT * FROM Emp_C WHERE emp_no * 1 = 100000;

SELECT * FROM Emp_C WHERE emp_no = 100000 / 1 ;

EXPLAIN SELECT * FROM Emp_C WHERE emp_no = 100000 / 1 ;

SELECT * FROM Emp ;

ALTER TABLE Emp ADD INDEX idx_gender (gender);
ANALYZE TABLE Emp; -- 생성한 인덱스를 통계에 적용시킴
SHOW INDEX FROM Emp;

EXPLAIN SELECT * FROM Emp WHERE gender = 'M';

-- </실습 4> --