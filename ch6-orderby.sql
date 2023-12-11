-- 가입 날짜로 정렬하고 싶다.. 
SELECT name, mDate FROM usertbl ORDER BY mDate;
-- 가입 날짜로 정렬하고 싶다.. , 역순으로.. 
SELECT name, mDate FROM usertbl ORDER BY name DESC;
-- 정렬 조건을 여러개.. 
SELECT name, height FROM usertbl ORDER BY height DESC, name ASC;

-- 지역의 갯수를 세고 싶다.. 
SELECT addr FROM usertbl;
SELECT DISTINCT addr FROM usertbl;
-- 집계 함수와 많이 사용..
SELECT COUNT(DISTINCT addr) FROM usertbl;

USE employees;
SELECT emp_no, hire_date FROM employees ORDER BY hire_date LIMIT 5;
-- OFFSET 적용.. 
SELECT emp_no, hire_date FROM employees ORDER BY hire_date LIMIT 1, 5;
