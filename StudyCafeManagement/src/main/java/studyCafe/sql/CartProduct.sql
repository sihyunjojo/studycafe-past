CREATE TABLE CartProduct(
	user_id varchar2(100) NOT NULL,				
	prod_number NUMBER(10) NOT NULL,
	prod_cartstate CHAR(1) NOT NULL,
	constraint user_id_FK_cart foreign key(user_id) references CafeUser(user_id),
	constraint prod_number_FK_cart foreign key(prod_number) references Product(prod_number),
	constraint cart_PK PRIMARY KEY(user_id, prod_number)
);


CREATE SEQUENCE product_seq;

drop table cartproduct;

