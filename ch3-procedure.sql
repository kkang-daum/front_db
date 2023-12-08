-- 특정 업무에서 아래의 sql 을 실행시켜야 한다는 가정.. 
SELECT * FROM memberTBL WHERE memberName = '당탕이';
SELECT * FROM productTBL WHERE productName = '냉장고';

-- 위의 두개의 SQL 문이 같이, 빈번하게 실행된다면.. 저장프로시저를 만들자.. 
DELIMITER //
CREATE PROCEDURE myProc()
BEGIN
	SELECT * FROM memberTBL WHERE memberName = '당탕이';
	SELECT * FROM productTBL WHERE productName = '냉장고';
END //
DELIMITER ;

CALL myProc();


