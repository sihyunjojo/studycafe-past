CREATE TABLE Notice_info(
	notice_number number primary key not null,
	user_id varchar2(100) NOT NULL,
	notice_pagenumber number not null,
	notice_title varchar2(100) not null,
	notice_kind varchar2(10) not null,
	notice_time date not null,
	notice_readcount number not null,
	notice_content varchar2(1000) not null,
	notice_filename varchar2(20),
	notice_popup char(1) not null,
	constraint user_id_FK_notice foreign key(user_id) 
	references CafeUser(user_id)
);

create sequence Notice_info_seq;
alter table Notice_info modify notice_title varchar2(100);


drop table Notice_info;
DROP SEQUENCE Notice_info_seq;