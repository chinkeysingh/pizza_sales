SELECT * FROM ecommerce.orders;
select count(order_id), month(order_purchase_timestamp) as months from ecommerce.orders
where year(order_purchase_timestamp)= 2018
group by months;

select years,months, payment, sum(payment)
over(order by years,months) cummulative_sales
from
(select year(orders.order_purchase_timestamp) as years,month(orders.order_purchase_timestamp) as months,
round(sum(payments.payment_value),2) as payment
from orders
join payments
on orders.order_id = payments.order_id
group by years, months
order by years,months) as a;

with a as(select year(orders.order_purchase_timestamp) as years, round(sum(payments.payment_value),2) as payment
from payments
join orders
on orders.order_id = payments.order_id
group by years
order by years)
select years, ((payment - lag(payment, 1) over(order by years))/
lag(payment, 1) over(order by years)) * 100 from a;

select count(order_id) from orders;
select count(distinct order_id) from orders;

