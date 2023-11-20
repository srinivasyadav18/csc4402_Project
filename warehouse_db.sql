create database Warehouse_Database;
create table user (
    -> email varchar(50) NOT NULL,
    -> full_name varchar(35) NOT NULL,
    -> password varchar(15) NOT NULL,
    -> primary key(email));

CREATE TABLE product (
    product_id int(10) NOT NULL, 
    product_name varchar(35) NOT NULL,
    product_price decimal(6,2) NOT NULL,
    unit_type varchar(10) NOT NULL,
    PRIMARY KEY (product_id));

CREATE TABLE warehouse (
    warehouse_id int NOT NULL,
    product_id int,
    product_name varchar(35),
    qty_instock int(5) not null,
    primary key (warehouse_id),
    foreign key (product_id) references product(product_id),
    foreign key (product_name) references product(product_name)
    );
   
CREATE INDEX idx_product_id ON product (product_id);
create index idx_product_name on product (product_name);
create index idx_product_price on product(product_price);

create index idx_user_name on user(full_name);
create index idx_user_email on user(email):

create table customer (
     cust_id int(10) not null, 
     cust_name varchar(35), 
     email varchar(50),
     phone int(11) not null,
     address1 varchar(30) not null,
     address2 varchar(30), 
     city varchar(30) not null, 
     state varchar(30) not null, 
     country varchar(30) not null,
     zip_code int(5) not null, 
     primary key (cust_id), 
     foreign key (cust_name) 
     references user(full_name), 
     foreign key (email) 
     references user(email) );


create table order_info ( 
    order_id int(10) not null,
    cust_id int not null,
    product_id int not null,
    product_name varchar(35) not null,
    product_qty int(2) not null,
    product_price decimal(6,2),
    total_num_products int(2) not null,
    total_price decimal(6,2) not null,
    primary key (order_id),
    foreign key (product_id) references product(product_id),
    foreign key (product_name) references product(product_name),
    foreign key (product_price) references product(product_price),
    foreign key (cust_id) references customer(cust_id)
    );
