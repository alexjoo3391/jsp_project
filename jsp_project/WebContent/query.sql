CREATE TABLE member (
id VARCHAR2(20) PRIMARY KEY,
password VARCHAR2(30),
money int,
item varchar2(100),
check_point int,
love number(3)
);

insert into member values ('dd', 'dd', 0, 'dd', 1, 0);

select * from member;

SELECT id FROM member WHERE id='dd';