-- 만약 데이터베이스가 있다면 삭제해라.. 없다면.. 아무일도 없다..
DROP DATABASE IF EXISTS sqldb;
-- 작업 데이터베이스 생성
CREATE DATABASE sqldb;
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

