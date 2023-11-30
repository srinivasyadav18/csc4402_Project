create database Warehouse_Database;
use Warehouse_Database;

create table user (
    email varchar(50) NOT NULL,
    full_name varchar(35) NOT NULL,
    password varchar(15) NOT NULL,
    primary key(email));

CREATE TABLE product (
    product_id int(10) NOT NULL, 
    product_name varchar(35) NOT NULL,
    product_price decimal(6,2) NOT NULL,
    unit_type varchar(10) NOT NULL,
    PRIMARY KEY (product_id));

CREATE INDEX idx_product_id ON product (product_id);
create index idx_product_name on product (product_name);
create index idx_product_price on product(product_price);
create index idx_user_name on user(full_name);
create index idx_user_email on user(email);

CREATE TABLE warehouse (
    product_id int,
    product_name varchar(35),
    qty_instock decimal(6,2) not null,
    foreign key (product_id) references product(product_id),
    foreign key (product_name) references product(product_name)
);

create table customer (
     cust_id int(10) not null, 
     cust_name varchar(35), 
     email varchar(50),
     phone varchar(15) not null,
     address1 varchar(100) not null, 
     primary key (cust_id), 
     foreign key (cust_name) references user(full_name), 
     foreign key (email) references user(email) 
);

create table order_info ( 
    order_id int(10) not null,
    cust_id int not null,
    product_id int not null,
    product_name varchar(35) not null,
    product_qty decimal(6,2) not null,
    product_price decimal(6,2),
    total_price decimal(6,2) not null,
    primary key (order_id),
    foreign key (product_id) references product(product_id),
    foreign key (product_name) references product(product_name),
    foreign key (product_price) references product(product_price),
    foreign key (cust_id) references customer(cust_id)
);
