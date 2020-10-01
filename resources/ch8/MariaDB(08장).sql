
/* 08장 */


-- <실습 1> --

DROP DATABASE IF EXISTS ShopDB;
DROP DATABASE IF EXISTS ModelDB;
DROP DATABASE IF EXISTS sqlDB;
DROP DATABASE IF EXISTS tableDB;

CREATE DATABASE tableDB;

-- </실습 1> --

CREATE TABLE test (num INT);

-- <실습 2> --

DROP DATABASE IF EXISTS tableDB;
CREATE DATABASE tableDB;

USE tableDB;
DROP TABLE IF EXISTS buyTBL, userTBL;
CREATE TABLE userTBL -- 회원 테이블
( userID  char(8), -- 사용자 아이디
  name    nvarchar(10), -- 이름
  birthYear   int,  -- 출생연도
  addr	  nchar(2), -- 지역(경기,서울,경남 등으로 글자만 입력)
  mobile1	char(3), -- 휴대폰의국번(011, 016, 017, 018, 019, 010 등)
  mobile2   char(8), -- 휴대폰의 나머지 전화번호(하이픈 제외)
  height    smallint,  -- 키
  mDate    date  -- 회원 가입일
);
CREATE TABLE buyTBL -- 구매 테이블
(  num int, -- 순번(PK)
   userid  char(8),-- 아이디(FK)
prodName nchar(6), -- 물품명
   groupName nchar(4) , -- 분류
   price     int , -- 단가
   amount    smallint -- 수량
);

USE tableDB;
DROP TABLE IF EXISTS buyTBL, userTBL;
CREATE TABLE userTBL 
( userID  char(8) NOT NULL , 
  name    varchar(10) NOT NULL, 
  birthYear   int NOT NULL,  
  addr	  char(2) NOT NULL,
  mobile1	char(3) NULL, 
  mobile2   char(8) NULL, 
  height    smallint NULL, 
  mDate    date NULL 
);
CREATE TABLE buyTBL 
(  num int NOT NULL , 
   userid  char(8) NOT NULL ,
   prodName char(6) NOT NULL,
   groupName char(4) NULL , 
   price     int  NOT NULL,
   amount    smallint  NOT NULL 
);

DROP TABLE IF EXISTS buyTBL, userTBL;
CREATE TABLE userTBL 
( userID  char(8) NOT NULL PRIMARY KEY, 
   name    varchar(10) NOT NULL, 
   birthYear   int NOT NULL,  
   addr	  char(2) NOT NULL,
   mobile1	char(3) NULL, 
   mobile2   char(8) NULL, 
   height    smallint NULL,
   mDate    date NULL 
);
CREATE TABLE buyTBL 
(  num int NOT NULL PRIMARY KEY, 
   userid  char(8) NOT NULL ,
   prodName char(6) NOT NULL,
   groupName char(4) NULL , 
   price     int  NOT NULL,
   amount    smallint  NOT NULL 
);

DROP TABLE IF EXISTS buyTBL;
CREATE TABLE buyTBL 
(  num int AUTO_INCREMENT NOT NULL PRIMARY KEY,
   userid  char(8) NOT NULL ,
   prodName char(6) NOT NULL,
   groupName char(4) NULL , 
   price     int  NOT NULL,
   amount    smallint  NOT NULL 
);

DROP TABLE IF EXISTS buyTBL;
CREATE TABLE buyTBL 
(  num int AUTO_INCREMENT NOT NULL PRIMARY KEY , 
   userid  char(8) NOT NULL ,
   prodName char(6) NOT NULL,
   groupName char(4) NULL , 
   price     int  NOT NULL,
   amount    smallint  NOT NULL 
  , FOREIGN KEY(userid) REFERENCES userTBL(userID)
);

INSERT INTO userTBL VALUES('LSG', N'이승기', 1987, N'서울', '011', '1111111', 182, '2008-8-8');
INSERT INTO userTBL VALUES('KBS', N'김범수', 1979, N'경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO userTBL VALUES('KKH', N'김경호', 1971, N'전남', '019', '3333333', 177, '2007-7-7');

INSERT INTO buyTBL VALUES(NULL, 'KBS', N'운동화', NULL  , 30,   2);
INSERT INTO buyTBL VALUES(NULL, 'KBS', N'노트북', N'전자', 1000, 1);
INSERT INTO buyTBL VALUES(NULL, 'JYP', N'모니터', N'전자', 200,  1);


/*
INSERT INTO userTbl VALUES('JYP', N'조용필', 1950, N'경기', '011', '44444444', 166, '2009-4-4');
INSERT INTO userTbl VALUES('SSK', N'성시경', 1979, N'서울', NULL  , NULL      , 186, '2013-12-12');
INSERT INTO userTbl VALUES('LJB', N'임재범', 1963, N'서울', '016', '66666666', 182, '2009-9-9');
INSERT INTO userTbl VALUES('YJS', N'윤종신', 1969, N'경남', NULL  , NULL      , 170, '2005-5-5');
INSERT INTO userTbl VALUES('EJW', N'은지원', 1972, N'경북', '011', '88888888', 174, '2014-3-3');
INSERT INTO userTbl VALUES('JKW', N'조관우', 1965, N'경기', '018', '99999999', 172, '2010-10-10');
INSERT INTO userTbl VALUES('BBK', N'바비킴', 1973, N'서울', '010', '00000000', 176, '2013-5-5');

INSERT INTO buyTbl VALUES(NULL, 'JYP', N'모니터', N'전자', 200,  1);
INSERT INTO buyTbl VALUES(NULL, 'BBK', N'모니터', N'전자', 200,  5);
INSERT INTO buyTbl VALUES(NULL, 'KBS', N'청바지', N'의류', 50,   3);
INSERT INTO buyTbl VALUES(NULL, 'BBK', N'메모리', N'전자', 80,  10);
INSERT INTO buyTbl VALUES(NULL, 'SSK', N'책'    , N'서적', 15,   5);
INSERT INTO buyTbl VALUES(NULL, 'EJW', N'책'    , N'서적', 15,   2);
INSERT INTO buyTbl VALUES(NULL, 'EJW', N'청바지', N'의류', 50,   1);
INSERT INTO buyTbl VALUES(NULL, 'BBK', N'운동화', NULL   , 30,   2);
INSERT INTO buyTbl VALUES(NULL, 'EJW', N'책'    , N'서적', 15,   1);
INSERT INTO buyTbl VALUES(NULL, 'BBK', N'운동화', NULL   , 30,   2);

*/

-- </실습 2> --

USE tableDB;
DROP TABLE IF EXISTS buyTBL, userTBL;
CREATE TABLE userTBL 
( userID  CHAR(8) NOT NULL PRIMARY KEY, 
  name    VARCHAR(10) NOT NULL, 
  birthYear   INT NOT NULL
);

DESCRIBE userTBL;

DROP TABLE IF EXISTS userTBL;
CREATE TABLE userTBL 
( userID  CHAR(8) NOT NULL, 
  name    VARCHAR(10) NOT NULL, 
  birthYear   INT NOT NULL,  
  CONSTRAINT PRIMARY KEY PK_userTBL_userID (userID)
);

DROP TABLE IF EXISTS userTBL;
CREATE TABLE userTBL 
(   userID  CHAR(8) NOT NULL, 
    name    VARCHAR(10) NOT NULL, 
    birthYear   INT NOT NULL
);
ALTER TABLE userTBL
	ADD CONSTRAINT PK_userTBL_userID 
        PRIMARY KEY (userID);

DROP TABLE IF EXISTS prodTbl;
CREATE TABLE prodTbl
( prodCode CHAR(3) NOT NULL,
  prodID   CHAR(4)  NOT NULL,
  prodDate DATETIME  NOT NULL,
  prodCur  CHAR(10) NULL
);
ALTER TABLE prodTbl
	ADD CONSTRAINT PK_prodTbl_proCode_prodID 
	PRIMARY KEY (prodCode, prodID) ;

DROP TABLE IF EXISTS prodTbl;
CREATE TABLE prodTbl
( prodCode CHAR(3) NOT NULL,
  prodID   CHAR(4)  NOT NULL,
  prodDate DATETIME  NOT NULL,
  prodCur  CHAR(10) NULL,
  CONSTRAINT PK_prodTbl_proCode_prodID 
	PRIMARY KEY (prodCode, prodID) 
);

SHOW INDEX FROM prodTbl ;


DROP TABLE IF EXISTS buyTBL, userTBL;
CREATE TABLE userTBL 
( userID  CHAR(8) NOT NULL PRIMARY KEY, 
  name    VARCHAR(10) NOT NULL, 
  birthYear   INT NOT NULL 
);
CREATE TABLE buyTBL 
(  num INT AUTO_INCREMENT NOT NULL PRIMARY KEY , 
   userID  CHAR(8) NOT NULL, 
   prodName CHAR(6) NOT NULL,
   FOREIGN KEY(userID) REFERENCES userTBL(userID)
);

DROP TABLE IF EXISTS buyTBL;
CREATE TABLE buyTBL 
(  num INT AUTO_INCREMENT NOT NULL PRIMARY KEY , 
   userID  CHAR(8) NOT NULL, 
   prodName CHAR(6) NOT NULL,
   CONSTRAINT FK_userTBL_buyTBL FOREIGN KEY(userID) REFERENCES userTBL(userID)
);

DROP TABLE IF EXISTS buyTBL;
CREATE TABLE buyTBL 
(  num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
   userID  CHAR(8) NOT NULL, 
   prodName CHAR(6) NOT NULL 
);
ALTER TABLE buyTBL
    ADD CONSTRAINT FK_userTBL_buyTBL 
    FOREIGN KEY (userID) 
    REFERENCES userTBL(userID);

SHOW INDEX FROM buyTBL ;

ALTER TABLE buyTBL
	DROP FOREIGN KEY FK_userTBL_buyTBL; -- 외래 키 제거
ALTER TABLE buyTBL
	ADD CONSTRAINT FK_userTBL_buyTBL
	FOREIGN KEY (userID)
	REFERENCES userTBL (userID)
	ON UPDATE CASCADE;

USE tableDB;
DROP TABLE IF EXISTS buyTBL, userTBL;
CREATE TABLE userTBL 
( userID  CHAR(8) NOT NULL PRIMARY KEY, 
  name    VARCHAR(10) NOT NULL, 
  birthYear   INT NOT NULL,  
  email   CHAR(30) NULL  UNIQUE
);
DROP TABLE IF EXISTS userTBL;
CREATE TABLE userTBL 
( userID  CHAR(8) NOT NULL PRIMARY KEY,
  name    VARCHAR(10) NOT NULL, 
  birthYear   INT NOT NULL,  
  email   CHAR(30) NULL ,  
  CONSTRAINT AK_email  UNIQUE (email)
);


-- 출생연도가 1900년 이후 그리고 2020년 이전, 이름은 반드시 넣어야 함.
DROP TABLE IF EXISTS userTBL;
CREATE TABLE userTBL 
( userID  CHAR(8) PRIMARY KEY,
  name    VARCHAR(10) , 
  birthYear  INT CHECK  (birthYear >= 1900 AND birthYear <= 2020),
  mobile1	char(3) NULL, 
  CONSTRAINT CK_name CHECK ( name IS NOT NULL)  
);

-- 휴대폰 국번 체크
ALTER TABLE userTbl
	ADD CONSTRAINT CK_mobile1
	CHECK  (mobile1 IN ('010','011','016','017','018','019')) ;


DROP TABLE IF EXISTS userTBL;
CREATE TABLE userTBL 
( userID  	char(8) NOT NULL PRIMARY KEY,  
  name    	varchar(10) NOT NULL, 
  birthYear	int NOT NULL DEFAULT -1,
  addr	  	char(2) NOT NULL DEFAULT '서울',
  mobile1	char(3) NULL, 
  mobile2	char(8) NULL, 
  height	smallint NULL DEFAULT 170, 
  mDate    	date NULL
);

DROP TABLE IF EXISTS userTBL;
CREATE TABLE userTBL 
( userID	char(8) NOT NULL PRIMARY KEY,  
  name		varchar(10) NOT NULL, 
  birthYear	int NOT NULL ,
  addr		char(2) NOT NULL,
  mobile1	char(3) NULL, 
  mobile2	char(8) NULL, 
  height	smallint NULL, 
  mDate	date NULL 
);
ALTER TABLE userTBL
	ALTER COLUMN birthYear SET DEFAULT -1;
ALTER TABLE userTBL
	ALTER COLUMN addr SET DEFAULT '서울';
ALTER TABLE userTBL
	ALTER COLUMN height SET DEFAULT 170;

-- default 문은 DEFAULT로 설정된 값을 자동 입력한다.
INSERT INTO userTBL VALUES ('LHL', '이혜리', default, default, '011', '1234567', default, '2022.12.12');
-- 열이름이 명시되지 않으면 DEFAULT로 설정된 값을 자동 입력한다
INSERT INTO userTBL(userID, name) VALUES('KAY', '김아영');
-- 값이 직접 명기되면 DEFAULT로 설정된 값은 무시된다.
INSERT INTO userTBL VALUES ('WB', '원빈', 1982, '대전', '019', '9876543', 176, '2023.5.5');
SELECT * FROM userTBL;


-- <실습 3> --

CREATE DATABASE IF NOT EXISTS compressDB;
USE compressDB;
CREATE TABLE normalTBL( emp_no int , first_name varchar(14));
CREATE TABLE compressTBL( emp_no int , first_name varchar(14))
	ROW_FORMAT=COMPRESSED ;

INSERT INTO normalTBL
     SELECT emp_no, first_name FROM employees.employees;   
INSERT INTO compressTBL 
     SELECT emp_no, first_name FROM employees.employees;

SHOW TABLE STATUS FROM compressDB;

USE mysql;
DROP DATABASE IF EXISTS compressDB;

-- </실습 3> --

/*
CREATE TABLE columnTBL( emp_no int , first_name varchar(14) COMPRESSED,  picture BLOB COMPRESSED);
*/


-- <실습 4> --

USE employees;
CREATE TEMPORARY TABLE  IF NOT EXISTS  tempTBL (id INT, name CHAR(7));
CREATE TEMPORARY TABLE  IF NOT EXISTS employees (id INT, name CHAR(7));
DESCRIBE tempTBL;
DESCRIBE employees;

INSERT INTO tempTBL VALUES (1, 'This');
INSERT INTO employees VALUES (2, 'MariaDB');
SELECT * FROM tempTBL;
SELECT * FROM employees;

USE employees;
SELECT * FROM tempTBL;
SELECT * FROM employees;

DROP TABLE tempTBL ;

USE employees;
SELECT * FROM employees;

-- </실습 4> --

USE tableDB;
ALTER TABLE userTBL
	ADD homepage VARCHAR(30)  -- 열추가
		DEFAULT 'http://www.hanbit.co.kr' -- 디폴트값
		NULL; -- Null 허용함

ALTER TABLE userTBL
	DROP COLUMN mobile1;

ALTER TABLE userTBL
	CHANGE COLUMN name uName VARCHAR(20) NULL ;

ALTER TABLE userTBL
	DROP PRIMARY KEY; 

ALTER TABLE buyTBL
	DROP FOREIGN KEY FK_userTBL_buyTBL;


-- <실습 5> --

USE tableDB;
DROP TABLE IF EXISTS buyTBL, userTBL;
CREATE TABLE userTBL 
( userID  char(8), 
  name    nvarchar(10),
  birthYear   int,  
  addr	  nchar(2), 
  mobile1	char(3), 
  mobile2   char(8), 
  height    smallint, 
  mDate    date 
);
CREATE TABLE buyTBL 
(  num int AUTO_INCREMENT PRIMARY KEY,
   userid  char(8),
   prodName nchar(6),
   groupName nchar(4),
   price     int ,
   amount    smallint
);

INSERT INTO userTBL VALUES('LSG', N'이승기', 1987, N'서울', '011', '11111111', 182, '2008-8-8');
INSERT INTO userTBL VALUES('KBS', N'김범수', NULL, N'경남', '011', '22222222', 173, '2012-4-4');
INSERT INTO userTBL VALUES('KKH', N'김경호', 1871, N'전남', '019', '33333333', 177, '2007-7-7');
INSERT INTO userTBL VALUES('JYP', N'조용필', 1950, N'경기', '011', '44444444', 166, '2009-4-4');
INSERT INTO buyTBL VALUES(NULL, 'KBS', N'운동화', NULL   , 30,   2);
INSERT INTO buyTBL VALUES(NULL,'KBS', N'노트북', N'전자', 1000, 1);
INSERT INTO buyTBL VALUES(NULL,'JYP', N'모니터', N'전자', 200,  1);
INSERT INTO buyTBL VALUES(NULL,'BBK', N'모니터', N'전자', 200,  5);

ALTER TABLE userTBL
	ADD CONSTRAINT PK_userTBL_userID
	PRIMARY KEY (userID);

DESC userTBL ;

ALTER TABLE buyTBL
	ADD CONSTRAINT FK_userTBL_buyTBL
	FOREIGN KEY (userID)
	REFERENCES userTBL (userID);

DELETE FROM buyTBL WHERE userid = 'BBK';
ALTER TABLE buyTBL
	ADD CONSTRAINT FK_userTBL_buyTBL
	FOREIGN KEY (userID)
	REFERENCES userTBL (userID);

INSERT INTO buyTBL VALUES(NULL,'BBK', N'모니터', N'전자', 200,  5);

SET foreign_key_checks = 0;  -- 외래 키 제약조건 비활성화
INSERT INTO buyTBL VALUES(NULL, 'BBK', N'모니터', N'전자', 200,  5);
INSERT INTO buyTBL VALUES(NULL, 'KBS', N'청바지', N'의류', 50,   3);
INSERT INTO buyTBL VALUES(NULL, 'BBK', N'메모리', N'전자', 80,  10);
INSERT INTO buyTBL VALUES(NULL, 'SSK', N'책'    , N'서적', 15,   5);
INSERT INTO buyTBL VALUES(NULL, 'EJW', N'책'    , N'서적', 15,   2);
INSERT INTO buyTBL VALUES(NULL, 'EJW', N'청바지', N'의류', 50,   1);
INSERT INTO buyTBL VALUES(NULL, 'BBK', N'운동화', NULL   , 30,   2);
INSERT INTO buyTBL VALUES(NULL, 'EJW', N'책'    , N'서적', 15,   1);
INSERT INTO buyTBL VALUES(NULL, 'BBK', N'운동화', NULL   , 30,   2);
SET foreign_key_checks = 1; -- 외래 키 제약조건 활성화

ALTER TABLE userTBL
	ADD CONSTRAINT CK_birthYear
	CHECK ( (birthYear >= 1900 AND birthYear <= 2020) AND (birthYear IS NOT NULL) ) ;

SET check_constraint_checks = 0; -- CHECK 제약 조건 비활성화
ALTER TABLE userTBL
	ADD CONSTRAINT CK_birthYear
	CHECK ( (birthYear >= 1900 AND birthYear <= 2020) AND (birthYear IS NOT NULL) ) ;
SET check_constraint_checks = 1; -- CHECK 제약 조건 활성화

INSERT INTO userTBL VALUES('SSK', N'성시경', 1979, N'서울', NULL  , NULL , 186, '2013-12-12');
INSERT INTO userTBL VALUES('LJB', N'임재범', 1963, N'서울', '016', '66666666', 182, '2009-9-9');
INSERT INTO userTBL VALUES('YJS', N'윤종신', 1969, N'경남', NULL  , NULL , 170, '2005-5-5');
INSERT INTO userTBL VALUES('EJW', N'은지원', 1972, N'경북', '011', '88888888', 174, '2014-3-3');
INSERT INTO userTBL VALUES('JKW', N'조관우', 1965, N'경기', '018', '99999999', 172, '2010-10-10');
INSERT INTO userTBL VALUES('BBK', N'바비킴', 1973, N'서울', '010', '00000000', 176, '2013-5-5');

UPDATE userTBL SET userID = 'VVK' WHERE userID='BBK';

SET foreign_key_checks = 0;
UPDATE userTBL SET userID = 'VVK' WHERE userID='BBK';
SET foreign_key_checks = 1;

SELECT B.userid, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
   FROM buyTBL B
     INNER JOIN userTBL U
        ON B.userid = U.userid ;

SELECT COUNT(*) FROM buyTBL;

SELECT B.userid, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
   FROM buyTBL B
     LEFT OUTER JOIN userTBL U
        ON B.userid = U.userid
   ORDER BY B.userid ;

SET foreign_key_checks = 0;
UPDATE userTBL SET userID = 'BBK' WHERE userID='VVK';
SET foreign_key_checks = 1;

ALTER TABLE buyTBL
	DROP FOREIGN KEY FK_userTBL_buyTBL;
ALTER TABLE buyTBL 
	ADD CONSTRAINT FK_userTBL_buyTBL
		FOREIGN KEY (userID)
		REFERENCES userTBL (userID)
		ON UPDATE CASCADE;

UPDATE userTBL SET userID = 'VVK' WHERE userID='BBK';
SELECT B.userid, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
   FROM buyTBL B
     INNER JOIN userTBL U
        ON B.userid = U.userid
  ORDER BY B.userid;

DELETE FROM userTBL WHERE userID = 'VVK';

ALTER TABLE buyTBL
	DROP FOREIGN KEY FK_userTBL_buyTBL;
ALTER TABLE buyTBL 
	ADD CONSTRAINT FK_userTBL_buyTBL
		FOREIGN KEY (userID)
		REFERENCES userTBL (userID)
		ON UPDATE CASCADE
		ON DELETE CASCADE;

DELETE FROM userTBL WHERE userID = 'VVK';
SELECT * FROM buyTBL ;

ALTER TABLE userTBL
	DROP COLUMN birthYear ;

-- </실습 5> --





USE tableDB;
CREATE VIEW v_userTBL
AS
	SELECT userid, name, addr FROM userTBL;

SELECT * FROM v_userTBL;  -- 뷰를 테이블이라고 생각해도 무방

SELECT U.userid, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2)  AS '연락처'
FROM userTBL U
  INNER JOIN buyTBL B
     ON U.userid = B.userid ;

CREATE VIEW v_userbuyTBL
AS
SELECT U.userid, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2)  AS '연락처'
FROM userTBL U
	INNER JOIN buyTBL B
	 ON U.userid = B.userid ;

SELECT * FROM v_userbuyTBL WHERE name = N'김범수';


-- <실습 6> --

USE sqlDB;
CREATE VIEW v_userbuyTBL
AS
   SELECT U.userid AS 'USER ID', U.name AS 'USER NAME', B.prodName AS 'PRODUCT NAME', 
		U.addr, CONCAT(U.mobile1, U.mobile2) AS 'MOBILE PHONE'
      FROM userTBL U
	INNER JOIN buyTBL B
	 ON U.userid = B.userid;

SELECT `USER ID`, `USER NAME` FROM v_userbuyTBL; -- 주의! 백틱을 사용한다.

ALTER VIEW v_userbuyTBL
AS
   SELECT U.userid AS '사용자 아이디', U.name AS '이름', B.prodName AS '제품 이름', 
		U.addr, CONCAT(U.mobile1, U.mobile2)  AS '전화 번호'
      FROM userTBL U
          INNER JOIN buyTBL B
             ON U.userid = B.userid ;

SELECT `이름`,`전화 번호` FROM v_userbuyTBL;

DROP VIEW v_userbuyTBL;

USE sqlDB;
CREATE OR REPLACE VIEW v_userTBL
AS
	SELECT userid, name, addr FROM userTBL;

DESCRIBE v_userTBL;

SHOW CREATE VIEW v_userTBL;

UPDATE v_userTBL SET addr = '부산' WHERE userid='JKW' ;

INSERT INTO v_userTBL(userid, name, addr) VALUES('KBM','김병만','충북') ;

CREATE VIEW v_sum
AS
	SELECT userid AS 'userid', SUM(price*amount) AS 'total'  
	   FROM buyTBL GROUP BY userid;

SELECT * FROM v_sum;

SELECT * FROM INFORMATION_SCHEMA.VIEWS
     WHERE TABLE_SCHEMA = 'sqlDB' AND TABLE_NAME = 'v_sum';


CREATE VIEW v_height177
AS
	SELECT * FROM userTBL WHERE height >= 177 ;

SELECT * FROM v_height177 ;

DELETE FROM v_height177 WHERE height < 177 ;

INSERT INTO v_height177 VALUES('KBM', '김병만', 1977 , '경기', '010', '5555555', 158, '2022-01-01') ;


ALTER VIEW v_height177
AS
	SELECT * FROM userTBL WHERE height >= 177
	    WITH CHECK OPTION ;

INSERT INTO v_height177 VALUES('SJH', '서장훈', 2006 , '서울', '010', '3333333', 155, '2022-3-3') ;


CREATE VIEW v_userbuyTBL
AS
  SELECT U.userid, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS mobile
   FROM userTBL U
      INNER JOIN buyTBL B
         ON U.userid = B.userid ;

INSERT INTO v_userbuyTBL VALUES('PKL','박경리','운동화','경기','00000000000','2023-2-2');


DROP TABLE IF EXISTS buyTBL, userTBL;

SELECT * FROM v_userbuyTBL;

CHECK TABLE v_userbuyTBL;

-- </실습 6> --