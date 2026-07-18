-- KPIS
--------
go

-- Total orders 
SELECT Count(*) AS total_orders
FROM   orders;

go

--  successful orders  received 
SELECT Count(*) AS successful_orders
FROM   orders
WHERE  order_status = 'delivered';

go

-- successful order rate
SELECT Count(*)                             AS total_orders,
       Sum(CASE
             WHEN order_status = 'delivered' THEN 1
             ELSE 0
           END)                             AS successful_orders,
       Round(Sum(CASE
                   WHEN order_status = 'delivered' THEN 1
                   ELSE 0
                 END) * 100.0 / Count(*), 2)AS successful_rate
FROM   orders;

go 

