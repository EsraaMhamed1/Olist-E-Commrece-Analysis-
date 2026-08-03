
--1. Monthly Orders Trend
-------------------------
go 

select * from orders ; 
go 

select   count(order_id) as num_of_orders , 
         month(order_purchase_timestamp) as months , 
		 year(order_purchase_timestamp) as years
from orders 
where order_status = 'delivered' 
group by  year(order_purchase_timestamp) ,
          month(order_purchase_timestamp) 
order by year(order_purchase_timestamp) , 
         month(order_purchase_timestamp) asc ;
go 



--2. Orders by Status


--3. Delivery Performance


--4. On-Time vs Late Deliveries


--5. Average Delivery Delay
