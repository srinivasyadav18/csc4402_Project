use Warehouse_Database;

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

-- Insert products into warehouse

INSERT INTO warehouse (product_id, product_name, qty_instock)
VALUES(000003, 'Cranberries', 1800),
(000002, 'Bananas', 1000),
(000011, 'Kiwi', 500),
(000012, 'Lemons', 1245),
(000013, 'Mangoes', 5421),
(000014, 'Night_lamp', 1204),
(000015, 'Oranges', 1800);

INSERT INTO user (email, full_name, password)
VALUES ('user@gmail.com', 'user', 'password');

INSERT INTO customer(cust_id, cust_name, email, phone, address1)
VALUES(777, 'user', 'user@gmail.com', 911911, 'user_address');
