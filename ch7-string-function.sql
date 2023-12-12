SELECT ifnull(NULL, '널이군요'), ifnull(100, '널이군요');
-- char_length : 문자열의 길이.. 
SELECT bit_length('abc'), char_length('abc'), length('abc');
-- 문자열 결합, 여러 컬럼 데이터를 추출해서 하나의 문자열로 출력할때.. 
-- 첫번째 매개변수가 결합 문자열 사이에 들어갈 구분자.. 
SELECT concat_ws('-','2023','12','12');
-- 숫자 타입의 데이터를 유저가 보기 편한 형태로 변경.. 
SELECT format(123456789.123456, 4);
-- 대소문자 변경.. 
SELECT lower('abcDEF'), upper('abcDEF');
-- 공백 제거.. 
-- trim 은 공백 제거가 기본이지만.. 특정 캐릭터를 지정해서.. 그 캐릭터를 제거.. 
SELECT trim('  hello  '), trim(both 'ㅋ' from 'ㅋㅋㅋhello worldㅋㅋㅋ');