CREATE TABLE member (
	id VARCHAR2(20) PRIMARY KEY,
	password VARCHAR2(30),
	check_point int,
	love number(3)
);

SELECT * FROM member;

INSERT INTO member VALUES ('dd', 'dd', 1, 0);

DELETE FROM member WHERE id = 'aaaa';