CREATE TABLE CafeUser(
	user_id varchar2(100) primary key not null,
	user_password varchar2(100) not null,
	user_checkpw varchar2(100) not null,
	user_name varchar2(20) not null,
	user_gender char(1) not null,
	user_phone char(11) not null,
	user_address varchar2(40),
	user_email varchar2(30),
	user_birth varchar2(20) not null
	);

���̵� unique

alter table CafeUser add constraint unique_user_id unique (user_id);

drop table CafeUser2 purge;

insert into CafeUser2 values('afsdf222','1232421');
commit