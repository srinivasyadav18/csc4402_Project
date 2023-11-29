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
     phone int(11) not null,
     address1 varchar(30) not null,
    --  address2 varchar(30), 
    --  city varchar(30) not null, 
    --  state varchar(30) not null, 
    --  country varchar(30) not null,
    --  zip_code int(5) not null, 
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

INSERT INTO user (email, full_name, password)
VALUES ('test@gmail.com', 'test_user', 'test_password');

INSERT INTO product (product_id, product_name, product_price, unit_type)
VALUES ( 000001, 'Almonds', 18.58, 'LB'),
(000002, 'Bananas', 3.49, 'LB'),
(000003, 'Cranberries', 9.99, 'LB'),
(000004, 'Deli_Chicken', 19.99, 'LB'),
(000005, 'Eggs', 2.99, 'Units'),
(000006, 'Figs', 8.88, 'LB'),
(000007, 'Grapes', 6.99, 'LB'),
(000008, 'Honey', 12.45, 'Ounce'),
(000009, 'Ice_Cream', 5.49, 'Ounce'),
(000010, 'Jack_fruit', 8.99, 'LB'),
(000011, 'Kiwi', 7.49, 'LB'),
(000012, 'Lemons', 5.99, 'LB'),
(000013, 'Mangoes', 10.80, 'LB'),
(000014, 'Night_lamp', 20.88, 'Units'),
(000015, 'Oranges', 4.99, 'Units');

INSERT INTO warehouse (product_id, product_name, qty_instock)
VALUES(000003, 'Cranberries', 1800),
(000002, 'Bananas', 1000),
(000011, 'Kiwi', 500),
(000012, 'Lemons', 1245),
(000013, 'Mangoes', 5421),
(000014, 'Night_lamp', 1204),
(000015, 'Oranges', 1800);

INSERT INTO customer(cust_id, cust_name, email, phone, address1)
VALUES(0, 'test_user', 'test@gmail.com', 1234, 'test_address');

-- insert into order_info(order_id, cust_id, product_id, product_name, product_qty, product_price, total_price);
-- values(1, 1, 000001, 'Almonds', 2, 18.58, 50);
