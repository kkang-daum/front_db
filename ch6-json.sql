SELECT name, height FROM usertbl WHERE height >= 180;
-- 위의 sql 의 결과를 json 으로 변경해서 출력(전달) 하고 싶다..
-- json 은 데이터가 key: value 형태이다.. value 는 select 된 데이터.. key 값을 무엇으로 할지를 결정
SELECT JSON_OBJECT('data1', name, 'data2', height) AS '결과 json' 
FROM usertbl WHERE height >= 180;