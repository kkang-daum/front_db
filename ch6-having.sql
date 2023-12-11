-- 유저별 총 구매액을 추출하고자 한다.. 
SELECT userID, SUM(price * amount) FROM buytbl GROUP BY userID;
-- having 은 group by 에 의해 데이터 구룹핑이 끝난 후에 들어가는 조건.. , 유저별 총 구매액, 1000 이상인 사람들만.. 
SELECT userID, SUM(price * amount) FROM buytbl GROUP BY userID HAVING SUM(price * amount) > 1000;
-- ROLLUP 
SELECT groupName, SUM(price * amount) FROM buytbl GROUP BY groupName WITH ROLLUP;
