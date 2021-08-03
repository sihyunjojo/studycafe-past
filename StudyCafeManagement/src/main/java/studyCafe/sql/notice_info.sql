CREATE TABLE Notice_info(
	notice_number number primary key not null,
	user_id varchar2(100) NOT NULL,
	notice_title varchar2(100) not null,
	notice_time date not null,
	notice_readcount number not null,
	notice_content varchar2(1000) not null,
	constraint user_id_FK_notice foreign key(user_id) 
	references CafeUser(user_id)
);

create sequence Notice_info_seq;



alter table Notice_info modify notice_title varchar2(100);

begin
   for i in 1..100 loop
      INSERT INTO notice_info VALUES(Notice_info_seq.nextval, 'admin', 
      'test', sysdate, 0, 'test_content');
   end loop; 
end;
/
commit;

drop table Notice_info;
DROP SEQUENCE Notice_info_seq;