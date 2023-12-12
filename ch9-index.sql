CREATE TABLE tbl1
(
	a INT PRIMARY KEY,
    b INT,
    c INT
);
-- pk 설정하면 자동으로 index 만들어 진다. 
SHOW INDEX FROM tbl1;

CREATE TABLE tbl2
(
	a INT PRIMARY KEY,
    b INT UNIQUE,
    c INT UNIQUE
);
SHOW INDEX FROM tbl2;