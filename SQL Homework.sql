--1. How many actors are there with the last name ‘Wahlberg’?
select first_name, last_name
from actor
where last_name like 'Wahlberg';

--2. How many payments were made between $3.99 and $5.99?
--Hello, the query shows that there are NO payments that fit that criteria
--However, if you adjust amounts lower and higher, it will show some results
select customer_id, amount
from payment
where amount between 1.99 and 35.99

--3. What film does the store have the most of? (search in inventory)
--I don't see a way to only display the record with the max amount of inventory
select film_id, max(inventory_id)
from inventory
group by inventory_id
order by inventory_id desc;

--4. How many customers have the last name ‘William’?
--There are NO customers with the last name "William", but there is one with Williams
select last_name, first_name
from customer
where last_name like 'William_';

--5. What store employee (get the id) sold the most rentals?
--Staff ID# 2
select staff_id, max(inventory_id)
from rental
group by staff_id
order by staff_id desc;

--6. How many different district names are there?
--Count: 378
select count (distinct district)
from address;

--7. What film has the most actors in it? (use film_actor table and get film_id)
--Actor ID# 178 has 1,000 actors
select film_id, max(actor_id)
from film_actor
group by film_id
order by film_id desc;

--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
--There are 13 entries
select store_id, last_name
from customer
where last_name like '%es' and store_id = 1;

--How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--with ids between 380 and 430? (use group by and having > 250)
--Count: 1257
select count(amount)
from payment
where rental_id > 250
and customer_id between 380 and 430
--group by (amount)
--order by amount desc;

--10. Within the film table, how many rating categories are there? And what rating has the most movies total?
--There are five, PG-13 has the most movies with 224
select rating, count(*)
from film
group by rating
order by count(*) desc;