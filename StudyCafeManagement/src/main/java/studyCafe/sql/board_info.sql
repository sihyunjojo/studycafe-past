CREATE TABLE Board_info(
	board_number number primary key not null,
	user_id varchar2(100) NOT NULL,
	board_title varchar2(20) not null,
	board_time date not null,
	board_readcount number not null,
	board_content varchar2(1000) not null,
	constraint user_id_FK_Board foreign key(user_id) 
	references CafeUser(user_id)
);

create sequence Board_info_seq;



alter table Board_info modify board_title varchar2(100);

begin
	for i in 1..100 loop
		insert into Seat values(i, 'admin', 'F');
	end loop; 
end;
/
commit

INSERT INTO board_info VALUES(Board_info_seq.nextval, 'admin', 'test', sysdate, 0, 'test_content');


drop table board_info;
DROP SEQUENCE Board_info_seq;