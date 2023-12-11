USE sqldb;
-- 유저별 구매한 amount 의 합계를 알아내고 싶다.. 
SELECT userID, amount FROM buytbl ORDER BY userID;
-- 아래는 에러.. 
-- GROUP BY userID 으로하면 데이터가 userID 로 그룹핑 됨으로.. 전체 데이터는 100개라고 하더라도.. 
-- 구매 회원의 갯수가 5개라면.. 5개만 나온다.. userID가... 그런데 amount 는 100 개다.. 두 데이터의 갯수가 맞지 않는다
SELECT userID, amount FROM buytbl GROUP BY userID ORDER BY userID;
-- 출력 갯수는 맞추어 줘야 한다..
SELECT userID, SUM(amount) FROM buytbl GROUP BY userID ORDER BY userID;

SELECT userID, SUM(amount * price) AS '총 구매액' FROM buytbl GROUP BY userID ORDER BY userID;

-- 회원별 쇼핑할때 평균 구매량.. 
SELECT userID, AVG(amount) FROM buytbl GROUP BY userID ORDER BY userID;

-- 가장 키가 큰 회원과 작은 회원을 뽑고 싶다.. 
SELECT MAX(height), MIN(height) FROM usertbl;
-- 가장 키가 큰 회원과 작은 회원을 뽑고 싶다.. 사람 이름을 같이 뽑고 싶다.. 
-- 아래는 에러.. 데이터 갯수 맞지 않아서 에러.. 
SELECT name, MAX(height), MIN(height) FROM usertbl;
-- 위의 에러나는 sql 문을 아래처럼 name 으로 group by 해서.. 데이터 갯수를 맞추어서.. 
-- 정상적으로 실행은 된다.. 
SELECT name, MAX(height), MIN(height) FROM usertbl GROUP BY name;

-- 가장 키가 큰 회원과 작은 회원을 뽑고 싶다.. 사람 이름을 같이 뽑고 싶다.. 면 아래처럼.. 
SELECT name, height
	FROM usertbl
	WHERE height = (SELECT MAX(height) FROM usertbl)
    OR height = (SELECT MIN(height) FROM usertbl);

-- COUNT 집계함수.. 데이터 갯수를 획득할때..
-- 회원 갯수.. 
SELECT COUNT(*) FROM usertbl;
SELECT COUNT(mobile1) FROM usertbl;









