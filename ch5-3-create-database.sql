-- 만약 데이터베이스가 있다면 삭제해라.. 없다면.. 아무일도 없다..
DROP DATABASE IF EXISTS sqldb;
-- 작업 데이터베이스 생성
CREATE DATABASE sqldb;

USE sqldb;

-- 테이블 생성
CREATE TABLE usertbl 
(
	-- pk
	userID CHAR(8) NOT NULL, 
    -- CHAR, VARCHAR 모두 문자열 데이터.. 내부적으로 메모리 할당의 차이..
    name VARCHAR(10) NOT NULL, 
    -- INT -21억~+21억까지의 숫자 표현..
    birthYear INT NOT NULL,
    addr CHAR(2) NOT NULL,
    -- 전화번호는 숫자이지만.. - 문자열까지 포함이 되어야 해서, 전화번호 숫자로 숫자 연산을 안함으로.. 문자열로
    mobile1 CHAR(3),
    mobile2 CHAR(8),
    -- SMALLINT, -328~327 까지 표현.. 나이, 키등에 사용.. 메모리 효율성 때문에.. 
    height SMALLINT,
    mDate DATE, -- 회원가입일
    PRIMARY KEY (userID) -- pk 설정은 위에 userID 선언하면서 해도 되고.. 지금처럼 아래에 명시해도 되고..
);

DESC usertbl;

CREATE TABLE buytbl 
(
	-- 의미 있는 데이터중 PK 로 할 적절한 컬럼이 없는 경우 일련번호로 PK 설정을 많이 한다..
    -- 그런경우에는 값이 의미있는 B/L 데이터가 아님으로.. 자동 증가되게 설정을 많이 한다.. 
    -- PK 설정은 컬럼을 명시하면서 직접 설정도 가능하고.. 
	num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    userID CHAR(8) NOT NULL,
    prodName CHAR(6) NOT NULL,
    groupName CHAR(4), -- 분류... 
    price INT NOT NULL,
    amount SMALLINT NOT NULL,
    -- 내 테이블의 userID 를 usertbl 의 userID 컬럼과 FK 설정을 하겠다.. 
    FOREIGN KEY (userID) REFERENCES usertbl(userID)
);


INSERT INTO usertbl VALUES('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
INSERT INTO usertbl VALUES('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO usertbl VALUES('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-7-7');
INSERT INTO usertbl VALUES('JYP', '조용필', 1950, '경기', '011', '4444444', 166, '2009-4-4');
INSERT INTO usertbl VALUES('SSK', '성시경', 1979, '서울', NULL  , NULL      , 186, '2013-12-12');
INSERT INTO usertbl VALUES('LJB', '임재범', 1963, '서울', '016', '6666666', 182, '2009-9-9');
INSERT INTO usertbl VALUES('YJS', '윤종신', 1969, '경남', NULL  , NULL      , 170, '2005-5-5');
INSERT INTO usertbl VALUES('EJW', '은지원', 1972, '경북', '011', '8888888', 174, '2014-3-3');
INSERT INTO usertbl VALUES('JKW', '조관우', 1965, '경기', '018', '9999999', 172, '2010-10-10');
INSERT INTO usertbl VALUES('BBK', '바비킴', 1973, '서울', '010', '0000000', 176, '2013-5-5');
-- insert 시에 num 컬럼에 null 대입.. 이렇게 되면 auto increment 에 의해 자동 증가된 값이 들어간다..
INSERT INTO buytbl VALUES(NULL, 'KBS', '운동화', NULL   , 30,   2);
INSERT INTO buytbl VALUES(NULL, 'KBS', '노트북', '전자', 1000, 1);
INSERT INTO buytbl VALUES(NULL, 'JYP', '모니터', '전자', 200,  1);
INSERT INTO buytbl VALUES(NULL, 'BBK', '모니터', '전자', 200,  5);
INSERT INTO buytbl VALUES(NULL, 'KBS', '청바지', '의류', 50,   3);
INSERT INTO buytbl VALUES(NULL, 'BBK', '메모리', '전자', 80,  10);
INSERT INTO buytbl VALUES(NULL, 'SSK', '책'    , '서적', 15,   5);
INSERT INTO buytbl VALUES(NULL, 'EJW', '책'    , '서적', 15,   2);
INSERT INTO buytbl VALUES(NULL, 'EJW', '청바지', '의류', 50,   1);
INSERT INTO buytbl VALUES(NULL, 'BBK', '운동화', NULL   , 30,   2);
INSERT INTO buytbl VALUES(NULL, 'EJW', '책'    , '서적', 15,   1);
INSERT INTO buytbl VALUES(NULL, 'BBK', '운동화', NULL   , 30,   2);