
/* 05장 */


-- <실습 1> --

-- </실습 1> --



-- <실습 2> --

-- </실습 2> --



-- <실습 3> --

use shopDB;
select * from membertbl;

USE ShopDB;
CREATE TABLE test (id INT);

USE ShopDB;
CREATE TABLE test (id INT);
INSERT INTO test VALUES(1);

SELECT * FROM employees ;

-- </실습 3> --



-- <실습 4> --
/*
ip addr 
ping Linux_IP_주소 
*/

SHOW databases;

CREATE DATABASE myDB;
USE myDB;
CREATE TABLE myTBL (uname CHAR(10));
INSERT INTO myTBL VALUES ('전지적참견시점');
SELECT * FROM myTBL;

/*
 mysql -u root -p 

USE myDB;
INSERT INTO myTBL VALUES ('MBC TV');
SELECT * FROM myTBL;;

exit 
shutdown -h now 
*/

-- </실습 4> --



-- <실습 5> --

CREATE USER director@'%' IDENTIFIED BY 'director';
GRANT ALL ON *.* TO director@'%' WITH GRANT OPTION;

CREATE USER ceo@'%' IDENTIFIED BY 'ceo';
GRANT SELECT ON *.* TO ceo@'%';

CREATE USER staff@'%' IDENTIFIED BY 'staff';
GRANT SELECT, INSERT, UPDATE, DELETE ON ShoDB.* TO staff@'%';
GRANT SELECT ON employees.* TO staff@'%';

CREATE DATABASE sampleDB;
DROP DATABASE sampleDB;

USE ShopDB;
SELECT * FROM membertbl;

USE ShopDB;
DELETE FROM memberTBL WHERE memberID = 'Sang';
SELECT * FROM memberTBL;

DROP TABLE memberTBL;

USE employees;
SELECT * FROM employees;

-- </실습 5> --

