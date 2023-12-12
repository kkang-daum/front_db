-- 변수 선언
SET @myVar1 = 5;
SET @myVar2 = 3;
SET @myVar3 = "사람 이름 ==>";

-- 변수 활용.. 
SELECT @myVar1;
SELECT @myVar1 + @myVar2;
SELECT @myVar3, name FROM usertbl WHERE height>180;
-- 위를 아래처럼.. 
SELECT "사람 이름 ==>" , name FROM usertbl WHERE height>180;

-- 변수가 활용되는 대표적인 사례가 저장 프로시저와 PREPARE 부분이다..
-- PREPARE.. app code 에서도 많이 화자되는 용어.. 
-- SQL 문을 준비한다.. 그런데. 완성된 SQL 문이 아니라.. 데이터가 들어갈 자리를 ? 로 표현.. 
-- 완성된 SQL 문이 아님으로 실행시킬 수 없고.. ? 에 해당되는 데이터를 명시하면서 실행.. 
-- SQL 의 구조가 동일하고 데이터가 교체되면서 실행되는 것이 반복될때..
-- PREPARE 로 sql 을 한번만 명시하고.. 실행시킬때마다 ? 만 교체해서.. 
-- PREPARE 준비.. 준비지 실행은 아니다.. 데이터만 교체해서 반복 재사용해야 하는 sql 을 선언하는 것이다.
PREPARE myQuery -- prepare 이름.. 
	FROM 'SELECT name, height FROM usertbl ORDER BY height LIMIT ?;';
-- 위의 PREPARE 를 실행시키려면 EXECUTE 로 실행.. 실행시키면서 ? 에 해당되는 데이터 주어야 한다..
EXECUTE myQuery USING @myVar1;
EXECUTE myQuery USING @myVar2;

-- 데이터 여러개 선언되는 prepare 
PREPARE myQuery2 -- prepare 이름.. 
	FROM 'SELECT name, height FROM usertbl WHERE addr=? ORDER BY height LIMIT ?;';
SET @myVar4 = '서울';
-- ? 순서에 맞추어서 데이터 할당.. 
EXECUTE myQuery2 USING @myVar4, @myVar1;

