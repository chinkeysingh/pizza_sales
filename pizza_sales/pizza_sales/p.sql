SELECT * FROM ecommerce.payments;

select products.product_category category , round(sum(payments.payment_value),2) sales from products
join order_items
on products.product_id = order_items.product_id
join payments
on payments.order_id = order_items.order_id
group by category order by sales desc;
select payment_type, round(avg(payment_value),2) from payments
group by payment_type;
