-- workbench에서의 주석은 --에 한칸 띄워서.. 
-- 간단한 sql... 
SELECT * FROM memberTBL;
SELECT memberName, memberAddress FROM memberTBL;
SELECT * FROM memberTBL WHERE memberName = '지윤이';

INSERT INTO productTBL VALUES ('컴퓨터',10,'2023-10-10','삼성', 20);
INSERT INTO productTBL VALUES ('세탁기',4,'2023-10-11','LG', 10);
INSERT INTO productTBL VALUES ('냉장고',20,'2023-10-12','삼성', 6);

select * from productTBL;