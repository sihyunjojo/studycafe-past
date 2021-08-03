CREATE TABLE Seat(
	seat_number number primary key not null,
	user_id varchar2(100) NOT NULL,
	seat_res char(1) not null,
	constraint user_id_FK_Seat foreign key(user_id) references CafeUser(user_id)
);


begin
	for i in 1..100 loop
		insert into Seat values(i, 'admin', 'F');
	end loop; 
end;
/
commit;


drop table sea
purge;