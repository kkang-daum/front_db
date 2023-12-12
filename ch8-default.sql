CREATE table sample6 (
	id char(4) not null PRIMARY KEY,
    name char(4) not null,
    addr char(2) not null DEFAULT '서울',
    height SMALLINT
);
-- insert 시에 default 로 선언된 컬럼에 데이터 지정.. 그 데이터가 들어가고.. 
INSERT INTO sample6 VALUE ('aaa', 'aaa', '부산', 180);
-- insert 시에 default 가 선언된 컬럼에 default 값이 대입되길 원한다..  default 예약어로 데이터를 대체.. 
INSERT INTO sample6 VALUE ('bbb', 'bbb', default,  170);
-- insert column 을 명시한 경우에는 데이터 지정하지 않으면 되고..
INSERT INTO sample6 (id, name, height) VALUE ('CCC', 'CCC', 175);

select * from sample6;
