-- subquery
SELECT name, height FROM usertbl 
	WHERE height > (SELECT height FROM usertbl WHERE name = '김경호');
    
-- subquery 가 실행이 되면 데이터가 나오고, 그 데이터가 outer query 에 포함되어 실행된다..
-- subquery 의 데이터가 outer query 에 포함될때 문법적으로 오류나지 않게.. 
-- 아래는 에러이다.. 
SELECT name, height FROM usertbl 
	WHERE height >= (SELECT height FROM usertbl WHERE addr='경남');

-- 아래처럼 여러건의 데이터가 sub query 에 의해 나왔다면 그 데이터들이 outer query 에 적용되어 문법 오류가 없게..
-- ANY, ALL 을 같이.. 
SELECT name, height FROM usertbl 
	WHERE height >= ALL(SELECT height FROM usertbl WHERE addr='경남');
    
-- SUB QUERY 는 최종 데이터가 나온다. 그 데이터가 OUTER QUERY 에 포함되어 실행된다.
-- WHERE 뿐만 아니라.. 데이터가 들어갈 자리.. 모두 가능하다.. 
SELECT name, height, addr, (
	SELECT AVG(height) FROM usertbl p WHERE p.addr = x.addr) AS ADDR_AVG_HEIGHT
FROM usertbl x;