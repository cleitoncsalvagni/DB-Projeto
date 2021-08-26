 /* Atividade 1 */

  SELECT UPPER(first_name ||' '|| last_name) as "Nome ator"
  	FROM actor 
	
 /* Atividade 2 */

  SELECT actor_id,
  		 first_name,
		 last_name
  	FROM actor
   WHERE first_name = 'Joe'
   
 /* Atividade 3 */

  SELECT *
  	FROM actor
   WHERE first_name ILIKE '%Gen%'

 /* Atividade 4 */

  SELECT *
  	FROM actor
   WHERE last_name ILIKE '%Li%'
ORDER BY last_name,
		 first_name

 /* Atividade 5 */

  SELECT country_id,
         country
    FROM country
   WHERE country IN ('Afghanistan','Bangladesh','China')
   
 /* Atividade 6 */

  ALTER TABLE actor ADD COLUMN middle_name VARCHAR;
  SELECT * FROM actor
  
 /* Atividade 7 */
 
  ALTER TABLE actor DROP COLUMN middle_name
  SELECT * FROM actor
  
 /* Atividade 8 */

  SELECT last_name,
   COUNT (*) as quantidade
  	FROM actor
GROUP BY last_name
	
 /* Atividade 9 */

  SELECT last_name,
   COUNT (*) as quantidade
  	FROM actor	
GROUP BY last_name 
	HAVING COUNT(*) > 1

 /* Atividade 10 */

  UPDATE actor 
  	 SET first_name = 'James'
   WHERE last_name ILIKE 'Williams'
     AND first_name ILIKE 'Groucho'
	 
 /* Atividade 11 */

  UPDATE actor 
  	 SET first_name = 'Groucho'
   WHERE last_name ILIKE 'Williams'
     AND first_name ILIKE 'James'
	 
 /* Atividade 12 */

  SELECT s.first_name,
  		 s.last_name,
		 a.address
  	FROM staff as s
	JOIN address as a ON s.address_id = a.address_id
		 
 /* Atividade 13 */

  SELECT s.staff_id,
  		 s.first_name,
		 s.last_name,
		 p.payment_date,
		 SUM(p.amount) as valor_levantado
    FROM staff as s
	JOIN payment as p ON s.staff_id = p.staff_id
   WHERE p.payment_date >= '2007-01-01'
     AND p.payment_date <= '2007-01-31'
GROUP BY s.staff_id,
  		 s.first_name,
		 s.last_name,
		 p.payment_date
		 
-- Complementação: Saber que periodo tenho vendas */

  SELECT distinct CAST (payment_date as date) as dt
  	FROM payment
ORDER BY dt

 /* Atividade 14 */
 
  SELECT f.title,
  		 COUNT(*) as qtd
  	FROM film_actor as fa 
	JOIN film as f ON f.film_id = fa.film_id
GROUP BY f.title

 /* Atividade 15 */
 
  SELECT f.title,
  		 COUNT(*) as quantidade
  	FROM film as f
	JOIN inventory as i ON f.film_id = i.film_id
   WHERE f.title = 'Hunchback Impossible'
GROUP BY f.title

 /* Atividade 16 */
 
  SELECT c.first_name,
  	     c.last_name,
		 SUM(p.amount) as valor_gasto
   FROM payment as p
   JOIN customer as c ON c.customer_id = p.customer_id 
GROUP BY c.first_name,
  		 c.last_name	
ORDER BY c.last_name ASC
  
 /* Atividade 17 */
 
  SELECT f.title,
  	     lan.name as linguagem
    FROM film as f
    JOIN language as lan ON f.language_id = lan.language_id 
   WHERE f.title LIKE 'K%'
      OR f.title LIKE 'Q%'
	 AND lan.name = 'English' 
  
 /* Atividade 18 */ 
 
-- Exemplo dois JOIN
 
  SELECT actor.first_name,
  	     actor.last_name
  	FROM film
	JOIN film_actor ON film.film_id = film_actor.film_id
	JOIN actor ON actor.actor_id = film_actor.actor_id
   WHERE film.title = 'Alone Trip'

-- subquery / ou subselect

  SELECT actor.first_name,
  	     actor.last_name
  	FROM film_actor
	JOIN actor ON actor.actor_id = film_actor.actor_id
   WHERE film_actor.film_id = (SELECT film_id
   							     FROM film
                                WHERE film.title = 'Alone Trip')
  SELECT actor.first_name,
  	     actor.last_name
  	FROM actor
	JOIN (SELECT actor_id
  			FROM film
			JOIN film_actor ON film.film_id = film_actor.film_id
   		   WHERE film.title = 'Alone Trip') as tabela on actor.actor_id = tabela.actor_id

 /* Atividade 19 */
 
  SELECT co.first_name,
  		 co.last_name,
		 co.email
  	FROM customer as co
	JOIN address as a on co.address_id = a.address_id
	JOIN city on a.city_id = city.city_id
	JOIN country as c on city.country_id = c.country_id
   WHERE c.country = 'Canada'
GROUP BY co.first_name,
  		 co.last_name,
		 co.email;
  
 /* Atividade 20 */	
 
  SELECT f.title
  	FROM film as f
	JOIN film_category as fc ON f.film_id = fc.film_id
	JOIN category as c ON fc.category_id = c.category_id
   WHERE c.name = 'Family'
GROUP BY f.title; 

 /* Atividade 21 */

  SELECT f.title,
  		 CAST (r.rental_date as date)
	FROM film as f
	JOIN inventory as i ON f.film_id = i.film_id
	JOIN rental as r ON i.inventory_id = r.inventory_id
GROUP BY f.title,
  		 r.rental_date
ORDER BY r.rental_date DESC;
 
 /* Atividade 22 */ 
 
  SELECT s.store_id,
  		 COUNT (*) as negócios
  	FROM store as s
	JOIN staff as st ON s.store_id = st.store_id
	JOIN payment as p ON st.staff_id = p.staff_id
GROUP BY s.store_id
 
 /* Atividade 23 */

   SELECT store.store_id,
   		  city.city,
		  country.country
   	FROM store
	JOIN address on store.address_id = address.address_id
	JOIN city on address.city_id = city.city_id
	JOIN country on city.country_id = country.country_id

 /* Atividade 24 */   
 
  SELECT cat.name,
  		 SUM(p.amount) as receita
  	FROM film as f
	JOIN film_category as fc ON f.film_id = fc.film_id
	JOIN category as cat ON fc.category_id = cat.category_id
	JOIN inventory as i ON f.film_id = i.film_id
	JOIN rental as r ON i.inventory_id = r.inventory_id
	JOIN payment as p ON r.rental_id = p.rental_id
GROUP BY cat.name,
  		 p.amount
ORDER BY p.amount limit 5;
 
 /* Atividade 25 */
 
 ==================
 
 /* Atividade 26 */
 
 ==================

 /* Atividade 27 */
 
 ==================

 
 ----- Complementação Aula
 
   ALTER TABLE customer ALTER COLUMN address_id DROP NOT NULL
   UPDATE customer SET address_id = null where customer_id = 2
 
   SELECT c.customer_id,
          c.first_name,
		  c.last_name,
		  a.address,
		  a.city_id
	 FROM customer as c
	 right JOIN address as a ON c.address_id = a.address_id
	 WHERE c.customer_id is null
 ORDER BY c.customer_id
 
---- Desafio ----
 --> Liste as cidades que não tem funcionarios 
 
  SELECT c.city,
  		 a.address_id,
		 s.staff_id	 
  	FROM staff as s
	RIGHT JOIN address as a ON a.address_id = s.address_id
	RIGHT JOIN city as c ON a.city_id = c.city_id
   WHERE s.staff_id is null
 ORDER BY c.city