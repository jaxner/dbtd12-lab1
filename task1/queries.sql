-- 1.
select last_name || ', ' || first_name
from authors natural join books
where title = 'The Shining';

-- 2.
select title from books
natural join authors
where first_name='Paulette' and last_name='Bourgeois';

-- 3.
select last_name || ', ' || first_name as full_name from customers 
natural join shipments
natural join editions
natural join books
natural join subjects
where subject='Horror';

-- 4.
select title from books
natural join editions
natural join stock
where stock=(select max(stock) from stock);

-- 5.
select sum(retail_price) from shipments
natural join stock
natural join editions
natural join books
natural join subjects
where subject='Science Fiction';

-- 6.
select title from books
natural join editions
natural join shipments
natural join customers
group by title
having count(customer_id) = 2;

-- 7. 
with publisher_profit as (
     select name, sum(cost * stock) as profit
     from publishers 
     natural join editions
     natural join stock
     group by name
)

select name, profit
from publisher_profit
where profit >= ALL (select profit from publisher_profit); 

-- 8. 
select sum(retail_price-cost) from stock
natural join shipments;

select sum(retail_price-cost) - (select sum(cost*stock) from stock) from stock
natural join shipments;

with sold as (
     select isbn, count(shipment_id) as amount
     from shipments
     group by isbn
)
select sum((retail_price-cost)*amount - cost*stock)
from stock natural join sold;

-- 9.
select last_name || ', ' || first_name as full_name
from customers
natural join shipments
natural join editions
natural join books
natural join subjects
group by full_name
having count(distinct subject) >= 3;

-- 10.
select subject from subjects
except
select subject from shipments natural join books natural join subjects;
