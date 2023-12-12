-- join 은 일반적으로 inner join 이다. 특이한 경우 outer join 을 사용하기도 한다.
-- 아래처럼 두 테이블을 연결하는 것도 join 이라고 한다. 하지만 inner, outer 예약어를 사용하지 않았다. 암시적 join 
-- 이라고 한다.. 의미 없은 형태로 두 테이블이 연결되는 경우가 일반적이어서 많이 사용하지는 않는다. 
SELECT * FROM buytbl, usertbl;


-- inner join
SELECT * FROM buytbl
	INNER JOIN usertbl
		ON buytbl.userID = usertbl.userID -- join 조건.. 이 조건에 맞게 가상 테이블을 만든다. 
	WHERE buytbl.userID = 'KBS'
	ORDER BY num;
    
-- 테이블을 join 시키로 각 테이블의 컬럼데이터를 추출할때, 컬럼명이 동일하다면 어느 테이블의 컬럼데이터인지를 꼭 명시해야
-- 명시할때 테이블명.컬럼명 이렇게 명시하는데.. 테이블명이 길어서 sql 문이 좀 길게 작성된다. 그래서 일반적으로
-- 별칭을 주고 별칭으로 명시한다. 
SELECT
	B.userID, U.name, B.prodName, U.addr
FROM buytbl B
	INNER JOIN usertbl U
		ON B.userID = U.userID
ORDER BY B.num;

-- outer join
SELECT U.userID, U.name, B.prodName, U.addr
FROM usertbl U
	LEFT OUTER JOIN buytbl B
    ON U.userId = B.userID
ORDER BY U.userID;
-- 위의 코드를 아래처럼 작성, 동일
SELECT U.userID, U.name, B.prodName, U.addr
FROM buytbl B
	RIGHT OUTER JOIN usertbl U 
    ON U.userId = B.userID
ORDER BY U.userID;

-- SELF JOIN
CREATE TABLE emptbl (emp CHAR(3), manager CHAR(3), empTel char(4));
insert into emptbl values ('나사장', NULL, '1111');
insert into emptbl values ('나이사', '나사장', '2222');
insert into emptbl values ('나부장', '나이사', '3333');
insert into emptbl values ('나직원', '나부장', '4444');
-- 나직원의 관리자 전화번호 추출.. 
SELECT A.emp as '부하직원', B.emp as '직속상관', B.empTel as '직속상관전화번호'
	FROM emptbl A
		INNER JOIN emptbl B
			ON A.manager = B.emp
	WHERE A.emp = '나직원';



