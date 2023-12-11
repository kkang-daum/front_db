SELECT * FROM testtbl2;
UPDATE testtbl2 SET age = 10;

UPDATE testtbl2 SET age = 20 WHERE id=1;
UPDATE testtbl2 SET age = 20, userName = '강길동' WHERE id=2;

DELETE FROM testtbl2 WHERE id='2';

CREATE TABLE memberTBL (SELECT userID, name, addr FROM usertbl LIMIT 3);
-- 다른 테이블의 내용을 SELECT 해서 테이블을 CREATE 하는 경우, 데이터 복재 개념이다... 제약조건은 복재가 안된다.
SELECT * FROM memberTBL;
-- 제약 조건은 테이블을 만들면서 지정하던가.. 테이블을 만든 후에 별도로 지정하던가.. 
-- 데이터 변경이 아니라.. 제약조건 변경.. alert
ALTER TABLE memberTBL
	ADD CONSTRAINT pk_memberTBL PRIMARY KEY (userID);
-- 데이터를 insert 한다.. 제약조건 위배시켜서.. 
-- 에러 발생하고.. 그 이후 SQL 은 실행되지 않는다. 
INSERT INTO memberTBL VALUES ('BBK', '홍길동', '강원');
INSERT INTO memberTBL VALUES ('KIM', '김길동', '강원');
INSERT INTO memberTBL VALUES ('LEE', '이길동', '강원');

-- 에러가 발생하기는 하지만 IGNORE 를 지정하고 실행시켜 보자.. 
INSERT IGNORE INTO memberTBL VALUES ('BBK', '홍길동', '강원');
INSERT IGNORE INTO memberTBL VALUES ('KIM', '김길동', '강원');
INSERT IGNORE INTO memberTBL VALUES ('LEE', '이길동', '강원');

-- 키 중복, 원래는 에러가 나야 하지만.. 중복키로 INSERT 시키면 기존 데이터를 UPDATE 시켜라.. 
INSERT INTO memberTBL VALUES ('BBK', '홍길동', '강원')
	ON DUPLICATE KEY UPDATE name='홍길동', addr='강원';
