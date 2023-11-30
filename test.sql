INSERT INTO user (email, full_name, password)
VALUES ('test@gmail.com', 'test_user', 'test_password');

INSERT INTO customer(cust_id, cust_name, email, phone, address1)
VALUES(0, 'test_user', 'test@gmail.com', 1234, 'test_address');

insert into order_info(order_id, cust_id, product_id, product_name, product_qty, product_price, total_price);
values(1, 0, 000003, 'Cranberries', 2, 9.99, 19.98);
