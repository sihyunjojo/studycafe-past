CREATE TABLE Board_info(
	board_number number primary key not null,
	user_id varchar2(100) NOT NULL,
	board_pagenumber number not null,
	board_title varchar2(20) not null,
	board_kind varchar2(10) not null,
	board_time date not null,
	board_readcount number not null,
	board_content varchar2(1000) not null,
	board_filename varchar2(20),
	board_popup char(1) not null,
	constraint user_id_FK_Board foreign key(user_id) 
	references CafeUser(user_id)
);

create sequence Board_info_seq;



alter table Board_info modify board_title varchar2(100);

INSERT INTO board_info VALUES(Board_info_seq.nextval, 'aaa', 1, 'dsfsd', 'Ŀ��',  sysdate, 1, 'dsfds', '����', 'F')


drop table board_info;
DROP SEQUENCE Board_info_seq;