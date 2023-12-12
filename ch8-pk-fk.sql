-- pk 지정.. 
-- 테이블을 만들면서 컬럼 선언데 pk 설정.. 
CREATE TABLE sample1
(
	id char(8) not null PRIMARY KEY,
    name varchar(10) not null,
    birthYear int not null
);
DESC sample1;

-- 테이블을 만들면서 pk 를 별도로 설정.. 
CREATE TABLE sample2
(
	id char(8) not null,
    name varchar(10) not null,
    birthYear int not null,
    CONSTRAINT PRIMARY KEY pk_sample2 (id)
);

-- 테이블이 생성된 후에.. pk 설정.. 
CREATE TABLE sample3
(
	id char(8) not null,
    name varchar(10) not null,
    birthYear int not null
);
-- 이미 만들어진 테이블에 pk 설정.. 이미 존재하는 테이블의 구조(Scheme) 변경. alter 문.. 
-- 제약조건을 추가, 제거, 변경시에도 alter 문.. 
ALTER TABLE sample3
	ADD CONSTRAINT pk_sample3
    PRIMARY KEY (id);
    
desc sample3;

-- fk.... sample3 와 fk 설정.. 
create table sample4
(
	num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id char(8) NOT NULL,
    prodName CHAR(8) not null,
    CONSTRAINT fk_sample3_sample4 FOREIGN KEY (id) REFERENCES sample3(id)
);
-- 테이블이 생성된 후에 fk 지정.. 
create table sample5
(
	num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id char(8) NOT NULL,
    prodName CHAR(8) not null
);
ALTER TABLE sample5
	ADD CONSTRAINT fk_sample3_sample5
    FOREIGN KEY (id)
    REFERENCES sample3(id);
    
-- 지정된 제약조건 삭제.. 
-- alert.. 
ALTER TABLE sample5
	DROP FOREIGN KEY fk_sample3_sample5;
-- fk 는 외부테이블과의 관계이다. reference table 의 데이터가 삭제, 수정될때 나의 테이블의 관계 데이터도 같이
-- 자동으로 삭제, 수정되라... 
ALTER TABLE sample5
	ADD CONSTRAINT fk_sample3_sample5
    FOREIGN KEY (id)
    REFERENCES sample3(id)
    ON UPDATE CASCADE;
    