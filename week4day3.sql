Week 5 - Wednesday
Questions

1. List all customers who live in Texas (use
JOINs)

SELECT customer_id, first_name, last_name, district
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';


2. Get all payments above $6.99 with the Customer's Full Name'

SELECT first_name, last_name, amount
FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id
WHERE amount >+ 6.99;

3. Show all customers names who have made payments over $175(use
subqueries)

SELECT first_name, last_name, amount
FROM(
    SELECT *
    FROM payment
    INNER JOIN customer
    ON payment.customer_id = customer.customer_id
    Where amount > 175
) AS amount_over_175;


4. List all customers that live in Nepal (use the city
table)

SELECT first_name, last_name, country
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';



5. Which staff member had the most
transactions?


SELECT staff_id, COUNT(payment_id) AS numbers
FROM payment
GROUP BY staff_id 
ORDER BY numbers;

6. How many movies of each rating are
there?

SELECT rating, COUNT(*) as num_movies
FROM film
WHERE rating IN ('G', 'PG', 'PG-13', 'R')
GROUP BY rating;


7.Show all customers who have made a single payment
above $6.99 (Use Subqueries)

SELECT *
FROM payment
WHERE customer_id IN (
  SELECT customer_id
  FROM payment
  WHERE amount > 6.99
  GROUP BY customer_id
  HAVING COUNT(*) = 1
);


8. How many free rentals did our stores give away?
- 0 

SELECT amount
FROM payment
WHERE amount = 0;