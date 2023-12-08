-- database 명까지 명시해서.. select
SELECT * FROM employees.employees;

-- 특정 database 를 사용하겠다고 선언한후에 이용..
-- application 에서 sql 문을 실행시킨다면.. 접속 db 정보에 이용하고자 하는 database 명까지 명시됨으로..
-- select, insert 등 테이블 명시시에 database 를 use 하겠다고는 잘 안한다.. 
USE employees;
SELECT * FROM employees;

-- 특정 column data 만 필요하다면.. 
SELECT first_name FROM employees;
-- 여러 컬럼을 명시하려면 , 로 구분해서.. 
SELECT first_name, last_name FROM employees;
-- 테이블 내에서의 컬럼의 순서와 row의 순서는 의미가 없다.. 
-- select 할때.. 컬럼을 명시하는 순서대로 데이터는 뽑힌다..
SELECT last_name, gender, first_name FROM employees;
-- 컬럼 데이터를 뽑으면서 별칭을 명시할 수도 있다.. 
SELECT first_name AS 이름, gender AS 성별, hire_date '회사 입사일'
	FROM employees;

-- 테이블 명에도 별칭을 줄 수 있다.. 테이블을 여러개 같이 거는 경우(이후에 나오는 join)
-- 컬럼이 어느 테이블인지.. 테이블명을 계속 명시해야 하는데.. 테이블명이 길어서 귀찮거나.. 직관적으로 명시하고 싶거나
SELECT e.first_name, e.gender FROM employees AS e



