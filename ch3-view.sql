use shopdb;

-- 뷰 생성, 
CREATE VIEW uv_memberTBL
AS
	SELECT memberName, memberAddress FROM memberTBL;
    
-- 뷰는 가상 테이블이지만 이용자 입장에서는 테이블처럼 이용된다...
SELECT * FROM uv_memberTBL;