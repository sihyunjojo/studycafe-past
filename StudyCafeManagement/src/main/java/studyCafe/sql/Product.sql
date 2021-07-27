CREATE TABLE Product(
	prod_number NUMBER(10) NOT NULL PRIMARY KEY,
	prod_type VARCHAR2(20) NOT NULL,
	prod_amount NUMBER(10) NOT NULL,
	prod_name VARCHAR2(20) NOT NULL,
	prod_price NUMBER(10) NOT NULL,
	prod_image VARCHAR2(20) NULL,
	prod_content VARCHAR2(1000) NULL,
	prod_readcount NUMBER(10) NOT NULL
);

CREATE SEQUENCE Product_seq;
drop table Product;

DROP SEQUENCE product_seq;
