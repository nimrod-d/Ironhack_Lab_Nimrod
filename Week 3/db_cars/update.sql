-- UPDATE FILE -- 

SELECT * FROM customers;

UPDATE customers SET email = 'ppicasso@gmail.com' WHERE Customer_ID = 10001;
UPDATE customers SET email = 'lincoln@us.gov' WHERE Customer_ID = 20001;
UPDATE customers SET email = 'hello@napoleon.me' WHERE Customer_ID = 30001;

SELECT * FROM customers;