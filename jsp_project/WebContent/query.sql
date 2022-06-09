
CREATE TABLE member (
	id VARCHAR2(20) PRIMARY KEY,
	password VARCHAR2(30),
	money int,
	item VARCHAR2(100),
	check_point int,
	love number(3)
);

SELECT * FROM member;

INSERT INTO member VALUES ('dd', 'dd', 0, 'dd', 1, 0);

DELETE FROM member WHERE id = 'aaaa';