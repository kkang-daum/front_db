SELECT YEAR(curdate()), MONTH(curdate()), dayofyear(curdate()), microsecond(curdate());
-- now(), sysdate() 모두 현재 시간이기는 하지만. 차이가 있다. 
-- now 는 sql 이 실행되는 순간, sysdate() 는 함수가 호출되는 순간..
SELECT date(now()), time(now());

SELECT datediff('2025-01-01', now());