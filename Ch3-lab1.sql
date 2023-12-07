-- workbench에서의 주석은 --에 한칸 띄워서.. 
-- 간단한 sql... 
SELECT * FROM memberTBL;
SELECT memberName, memberAddress FROM memberTBL;
SELECT * FROM memberTBL WHERE memberName = '지윤이';

INSERT INTO productTBL VALUES ('컴퓨터',10,'2023-10-10','삼성', 20);
INSERT INTO productTBL VALUES ('세탁기',4,'2023-10-11','LG', 10);
INSERT INTO productTBL VALUES ('냉장고',20,'2023-10-12','삼성', 6);

select * from productTBL;


-- 테스트 table create
CREATE TABLE indexTBL (first_name varchar(14), last_name varchar(16), hire_date date);

-- 대량의 데이터를 구축하기 위해서.. employees 의 데이터를 select 해서, indexTBL 에 insert 하겠다.. 
INSERT INTO indexTBL
	SELECT first_name, last_name, hire_date
    FROM employees.employees
    LIMIT 500;

-- 데이터 저장 확인
SELECT * FROM indexTBL;

-- 특정 검색 조건으로 select... 
SELECT * FROM indexTBL WHERE first_name = 'Mary';


-- 데이터 양이 많고, first_name 컬럼을 조건으로 select 하는 비율이 높다는 가정하에.. 
-- 퍼퍼먼스 튜닝을 위해 index 를 설정하기로 결정했다..
CREATE INDEX idx_indexTBL_firstname ON indexTBL(first_name);




