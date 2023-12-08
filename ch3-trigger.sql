-- 테스트를 위해서 새로운 회원 등록.. 
INSERT INTO memberTBL VALUES ('hong', '홍길동','서울 강남구');

SELECT * FROM memberTBL;

DELETE FROM memberTBL WHERE memberName = '홍길동';

-- 회원테이블에서 삭제시에.. 데이터를 탈퇴회원을 위한 테이블로 옮겨서 유지하겠다고 결정.. 
-- 탈퇴 회원 정보만 유지하기 위한 테이블 생성.. 
CREATE TABLE deleteMemberTBL (
	memberID char(8),
    memberName char(5),
    memberAddress char(20),
    deleteDate date -- 탈퇴한 날짜.. 
);

-- 회원 테이블에서 delete 가 실행될때 데이터를 탈퇴 테이블로 자동으로 옮겨주는 트리거 등록.. 
DELIMITER //
CREATE TRIGGER trg_deleteMemberTBL
	AFTER DELETE -- 언제 실행되는 트리거인지... 삭제후에 실행 
    ON memberTBL -- 트리거가 부착될 테이블 명시.. 
    FOR EACH ROW -- 각 행마다 적용시킨다.. 
BEGIN -- 트리거 내용.. 
	-- OLD 는 예약어.. 기존 테이블을 지칭.. 
    -- CURDATE() 는 MYSQL 내장 함수.. 
	INSERT INTO deleteMemberTBL
		VALUES(OLD.memberID, OLD.memberName, OLD.memberAddress, CURDATE());
END //
DELIMITER ;

SELECT * FROM memberTBL;

-- 데이터 삭제해서 트리거 동작하게 테스트.. 
DELETE FROM memberTBL WHERE memberName = '상길이';

-- 트리거에 의해 삭제 테이블에 탈퇴 회원정보가 들어 갔는지 확인.. 
SELECT * FROM deleteMemberTBL;

