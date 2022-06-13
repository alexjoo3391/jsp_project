CREATE TABLE member (
	id VARCHAR2(20) PRIMARY KEY,
	password VARCHAR2(30),
	check_point int,
	love number(3)
);

SELECT * FROM member;

INSERT INTO member VALUES ('jeongayoung323', 'buree', 1, 0);
INSERT INTO member VALUES ('zizonchanbi', 'abcde12345', 1, 0);
INSERT INTO member VALUES ('seoyeon29', '12345', 1, 0);
INSERT INTO member VALUES ('asterion', '0702', 1, 0);

DELETE FROM member WHERE id = 'dd';