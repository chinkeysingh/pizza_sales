SELECT * FROM ecommerce.order_items;
with count_per_order as
(select orders.order_id,orders.customer_id,count(order_items.order_id) as oc
from orders
join order_items
on orders.order_id = order_items.order_id
group by orders.order_id,orders.customer_id)

select customers.customer_city,round(avg(count_per_order.oc), 2)
from customers
join count_per_order
on customers.customer_id = count_per_order.customer_id
group by customer_city;

select * from order_items;
select *, dense rank() over(order by revenue desc) as rn from (select order_items.seller_id,sum(payments.payment_value) revenue from order_items 
join payments on order_items.order_id = payments.order_id group by order_items.seller_id) as a;
select products.product_category category, count(order_items.product_id), round(avg(order_items.price),2)
from products 
join order_items
on products.product_id = order_items.product_id
group by category;

