-- procedure 내의 sql 문에 ; 구분자가 실행되지 않게, 구분자를 변경한다.. 
DELIMITER $$
CREATE PROCEDURE myProc(
	IN textValue CHAR(10),
    OUT outValue INT
)
BEGIN 
	-- 구분자가 ; 이 아님으로 등록만 된다.. 나중에 call 할때. 실행된다. 
    -- 이곳은 등록하는 곳이다.. testtbl 이 없어도 등록은 된다.. 물론 call 할때는 testtbl 이 만들어져야 한다..
	INSERT INTO testtbl VALUES (NULL, textValue);
    SELECT MAX(id) INTO outValue FROM testtbl;
END $$
DELIMITER ;
-- 구분자를 ; 으로 원복 시킨다..
CREATE TABLE testtbl (id INT AUTO_INCREMENT PRIMARY KEY, txt CHAR(10));
-- PROCEDURE 이용.. 
CALL myProc('테스트값', @myValue);
SELECT CONCAT('현재 입력된 ID 값 ==>', @myValue);