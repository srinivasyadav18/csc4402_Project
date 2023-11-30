use Warehouse_Database;

INSERT INTO user (email, full_name, password)
VALUES ('test@gmail.com', 'test_user', 'test_password');

INSERT INTO customer(cust_id, cust_name, email, phone, address1)
VALUES(1234, 'test_user', 'test@gmail.com', 911911, 'test_address');

INSERT INTO product (product_id, product_name, product_price, unit_type)
VALUES ( 789, 'Eggs', 5.2, 'units');

INSERT INTO warehouse (product_id, product_name, qty_instock)
VALUES(789, 'Eggs', 1800);

insert into order_info(order_id, cust_id, product_id, product_name, product_qty, product_price, total_price)
values(5432, 1234, 789, 'Eggs', 2, 5.2, 10.4);

