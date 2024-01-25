USE sakila;

# Step 1: Create a View
# First, create a view that summarizes rental information for each customer. 
# The view should include the customer's ID, name, email address, and total number of rentals (rental_count).
CREATE VIEW customer_info AS
SELECT customer_id, first_name, last_name, email, address, COUNT(rental_id) AS count_rental
FROM customer
INNER JOIN address 
USING(address_id)
INNER JOIN rental
USING(customer_id)
GROUP BY customer_id;

SELECT * FROM customer_info;

# Step 2: Create a Temporary Table
# Next, create a Temporary Table that calculates the total amount paid by each customer (total_paid). 
# The Temporary Table should use the rental summary view created in Step 1 to join with the payment table and calculate 
# the total amount paid by each customer.
CREATE TEMPORARY TABLE temp_total_paid AS 
SELECT customer_info.*, SUM(amount)  total_paid 
FROM payment 
INNER JOIN customer_info
USING(customer_id)
GROUP BY customer_id;

SELECT * FROM temp_total_paid;


-- Step 3: Create a CTE and the Customer Summary Report
WITH cte_customer_summary AS (
    
    SELECT
        ci.customer_id,
        ci.first_name,
        ci.last_name,
        ci.email,
        ci.count_rental,
        ttp.total_paid
    FROM customer_info ci
    JOIN temp_total_paid ttp ON ci.customer_id = ttp.customer_id
)

-- Step 4: Create the query to generate the final customer summary report
SELECT
    customer_id,
    first_name,
    last_name,
    email,
    count_rental,
    total_paid,
    total_paid / count_rental AS average_payment_per_rental
FROM cte_customer_summary;


