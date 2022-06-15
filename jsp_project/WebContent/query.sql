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

insert into member values('admin', '1234', 1, 0);

update member set love=0 where id='admin';

DELETE FROM member WHERE id = 'dd';