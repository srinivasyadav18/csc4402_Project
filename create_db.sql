CREATE DATABASE test_database;
USE test_database;

CREATE TABLE test_table (id int, name varchar(10));
INSERT INTO test_table values(0, "test123");
INSERT INTO test_table values(1, "test1123");
INSERT INTO test_table values(2, "test1223");
INSERT INTO test_table values(3, "test1233");

SELECT * FROM test_table;
