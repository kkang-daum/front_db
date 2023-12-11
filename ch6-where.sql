-- 테이블의 전체 데이터 획득, 컬럼조건, row 조건 없이..


-- 이름이 김경호인 데이터만 검색하고 싶다.. 데이터에 대한 조건.. where
SELECT * FROM usertbl WHERE name = '김경호';

SELECT * FROM usertbl;
-- 생년이 1970 이상이고 키가 182 이상인 사람, 그 중 id 와 name 데이터를 추출하고 싶다.. 
SELECT userID, name FROM usertbl WHERE birthYear >= 1970 AND height >= 182;

-- OR... 
SELECT userID, name FROM usertbl WHERE birthYear >= 1970 OR height >= 182;

-- 키가 180 이상에서 183 이하인 사람을 추출하고 싶다. 
SELECT userID, name, height FROM usertbl WHERE height >= 180 AND height <= 183;

-- 숫자로 조건을 줄때, 특정 범위 조건이라면.. between 을 활용할 수도 있다.. 
SELECT userID, name, height FROM usertbl WHERE height BETWEEN 180 AND 183;

-- BETWEEN 은 숫자처럼 연속적인 데이터의 범위 표현에 유용하기는 하지만.. 문자열등 연속적이지 않은 곳에서도 사용은 가능.. 
SELECT userID, name, addr FROM usertbl WHERE addr BETWEEN '경기' AND '서울';