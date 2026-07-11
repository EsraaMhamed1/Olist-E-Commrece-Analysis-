
-------------------------
--1. Customer 
-------------------------
-- show cols.
SELECT *
FROM   customers;

go

--number of rows 
SELECT Count(*) AS total_rows
FROM   customers;

go

-- check null values 
SELECT *
FROM   customers
WHERE  customer_id IS NULL;

go

SELECT Count(customer_unique_id) AS count_u_id
FROM   customers;

go

SELECT*
FROM   customers
WHERE  customer_unique_id IS NULL;

go

SELECT Sum(CASE
             WHEN customer_id IS NULL THEN 1
             ELSE 0
           END) AS customer_id_nulls,
       Sum(CASE
             WHEN customer_unique_id IS NULL THEN 1
             ELSE 0
           END) AS customer_unique_id_nulls,
       Sum(CASE
             WHEN customer_city IS NULL THEN 1
             ELSE 0
           END) AS customer_city_nulls,
       Sum(CASE
             WHEN customer_state IS NULL THEN 1
             ELSE 0
           END) AS customer_state_nulls
FROM   customers;

go

-- destinct city 
SELECT DISTINCT customer_city
FROM   customers
ORDER  BY customer_city ASC;

go

-- destinct city
SELECT DISTINCT customer_state
FROM   customers
ORDER  BY customer_state ASC;

go

-- uniqueness
SELECT Count(DISTINCT customer_id) AS cust_rows
FROM   customers;

go

SELECT Count(*)                           AS total_rows,
       Count(DISTINCT customer_id)        AS distinct_customer_id,
       Count(DISTINCT customer_unique_id) AS distinct_customer_unique_id
FROM   customers;
go

-------------------------------------------------------------------------
-------------------------------------------------------------------------
------------------------
--2. Orders 
------------------------
go

-- show data 
SELECT *
FROM   orders;

go

-- numbers of rows 
SELECT Count(*) AS total_rows
FROM   orders;

go

-- uniqueness
SELECT Count(DISTINCT order_id) AS unique_id
FROM   orders;

go

SELECT Sum(CASE
             WHEN order_id IS NULL THEN 1
             ELSE 0
           END) AS order_id_nulls,
       Sum(CASE
             WHEN customer_id IS NULL THEN 1
             ELSE 0
           END) AS customer_id_nulls,
       Sum(CASE
             WHEN order_status IS NULL THEN 1
             ELSE 0
           END) AS order_status_nulls,
       Sum(CASE
             WHEN order_purchase_timestamp IS NULL THEN 1
             ELSE 0
           END) AS purchase_timestamp_nulls,
       Sum(CASE
             WHEN order_approved_at IS NULL THEN 1
             ELSE 0
           END) asorder_approved_at_nulls,
       Sum(CASE
             WHEN order_estimated_delivery_date IS NULL THEN 1
             ELSE 0
           END) AS estimated_delivery_date_nulls,
       Sum(CASE
             WHEN order_delivered_carrier_date IS NULL THEN 1
             ELSE 0
           END) AS delivered_carrier_nulls,
       Sum(CASE
             WHEN order_delivered_customer_date IS NULL THEN 1
             ELSE 0
           END) AS order_customer_date_nulls
FROM   orders;

go

-- order_status 
SELECT DISTINCT order_status
FROM   orders;

go

SELECT order_status,
       Count(order_id) AS num_of_orders_each_status
FROM   orders
GROUP  BY order_status;

go

-- ensure null values 
SELECT order_status,
       Count(order_id) AS num_orders
FROM   orders
WHERE  order_delivered_customer_date IS NULL
GROUP  BY order_status;

go

SELECT order_id,
       order_status,
       order_purchase_timestamp,
       order_delivered_customer_date
FROM   orders
WHERE  order_status = 'delivered'
       AND order_delivered_customer_date IS NULL;

go

-- test Dates 
SELECT Count(*)
FROM   orders
WHERE  order_approved_at < order_purchase_timestamp;

go

SELECT Count(*)
FROM   orders
WHERE  Cast(order_delivered_carrier_date AS DATE) < Cast(
       order_approved_at AS DATE);

go

SELECT Count(*)
FROM   orders
WHERE  Cast(order_delivered_customer_date AS DATE) < Cast(
       order_delivered_carrier_date AS DATE);

go

SELECT Count(*)
FROM   orders
WHERE  order_estimated_delivery_date < order_purchase_timestamp;

go 

-----------------------------------------------------------------
-----------------------------------------------------------------


