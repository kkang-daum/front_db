USE sqldb;
-- 테이블 생성.. 
CREATE TABLE testtbl1 (
	id int,
    userName char(3),
    age int
);
-- insert, column name 명시하지 않고.. 
-- table 에 선언한 모든 column data 를 순서대로.. autoincrement 가 설정된 column data 가 있다고 하더라도 null로
INSERT INTO testtbl1 VALUES (1, '홍길동', 25);
-- COLUMN NAME 을 명시하는 경우, 명시된 COLUMN  데이터만.. 명시된 순서대로.. 
INSERT INTO testtbl1 (id, userName) VALUES (2, '김길동');
-- 순서 바꾸어서.. 
INSERT INTO testtbl1 (age, userName, id) VALUES (30, '이길동', 3);

-- AUTO INCREMENT, 테이블을 만들면서 주는 COLUMN 의 제약조건.. 값이 자동 증가되게.. 
CREATE TABLE testtbl2 (
	id int AUTO_INCREMENT PRIMARY KEY,
    userName char(3),
    age int
);
-- INSERT 시에 AUTO_INCREMENT 설정된 컬럼 데이터는 NULL 로.. 
INSERT INTO testtbl2 VALUES (NULL, '홍길동', 25);
INSERT INTO testtbl2 VALUES (NULL, '김길동', 20);
INSERT INTO testtbl2 VALUES (NULL, '이길동', 35);
SELECT * FROM testtbl2;

-- auto_increment 에 의해 추가되는 값은 1부터 1씩 증가되면서 들어간다..
-- 원한다면.. 100(임의 숫자)부터.. 증가되게 할 수도 있다..
-- 테이블의 조건을 수정하는 것이다.. 테이블 내의 데이터를 수정하는 것이 아니라.. alert 문.. 
ALTER TABLE testtbl2 AUTO_INCREMENT = 100;
INSERT INTO testtbl2 VALUES (NULL, '박길동', 30);
SELECT * FROM testtbl2;
INSERT INTO testtbl2 VALUES (NULL, '최길동', 30);
SELECT * FROM testtbl2;

INSERT INTO testtbl2 (userName, age) VALUES ('최길동', 30);