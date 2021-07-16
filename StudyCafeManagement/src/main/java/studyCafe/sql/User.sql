CREATE TABLE User(
	user_id varchar2(100) primary key not null,
	user_password varchar2(100) not null,
	user_name varchar2(20) not null,
	user_gender char(1) not null,
	user_phone char(11) not null,
	user_address varchar2(40),
	user_email varchar2(30),
	user_birth date not null
	);

CREATE SEQUENCE member1_seq;

CREATE TABLE CafeUser(
	user_id varchar2(20) primary key not null,
	user_password varchar2(20) not null
);

drop table CafeUser purge;

insert into CafeUser values('afsdf222','1232421');
commit