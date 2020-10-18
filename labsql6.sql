
#LAB SQL 6

USE sakila;

#Add new films to the database

show variables like 'local_infile';

set global local_infile =1;

load data local infile './films_2020.csv' into table film fields terminated by ',';

#Creating new table with excel file 

CREATE TABLE film_2020
(title VARCHAR(3000),
description VARCHAR (3000),
release_year INT,
language_id INT,
rental_date decimal,
length INT,
rating VARCHAR(10),
special_features VARCHAR(3000));

select*from film_2020;

#update inventory:
#1 all items placed in store 2 the ones from 2020
UPDATE sakila.film_2020
SET  store_id= '1'
WHERE release_year= 2020;

select*from film_2020;

#2 all the other film before 2020 go to store 1
alter table sakila.film add column store_id int (1);

UPDATE sakila.film
SET  store_id= '2'
WHERE release_year < 2020;

select*from sakila.film;

#3. 2020 films rental duration equals to 3 days 
#rental duration will be 3 days 
#with an offer price of 2.99€
#replacement cost of 8.99€. 

alter table sakila.film_2020 add column replacement_cost decimal;
UPDATE sakila.film
SET  replacement_cost= '8.99'
WHERE release_year = 2020;

alter table sakila.film_2020 add column rental_duration int;
UPDATE sakila.film
SET  rental_duration= '3'
WHERE release_year = 2020;

alter table sakila.film_2020 add column rental_rate decimal;
UPDATE sakila.film
SET  rental_rate= '2.99'
WHERE release_year = 2020;

select*from sakila.film_2020;