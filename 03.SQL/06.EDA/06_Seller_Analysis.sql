
-- 1. Top 10 Sellers by Revenue
-------------------------------
go 

select * from sellers ;
go 

select * from order_items ; 
go 

select * from orders ; 
go 

select top(10) s.seller_state, s.seller_id , round(sum(oi.price) ,2)as Revenue 
from sellers s 
join order_items oi 
on s.seller_id = oi.seller_id 
join orders o 
on o.order_id = oi.order_id 
where order_status = 'delivered' 
group by s.seller_id, s.seller_state 
order by Revenue desc; 
go 



-- 2. Sellers Distribution by State
-- 3. Revenue by Seller State
-- 4. Average Revenue per Seller
-- 5. Sellers with the Most Products Sold
