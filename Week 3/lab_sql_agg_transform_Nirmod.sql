-- 1.1 Determine the shortest and longest movie durations and name the values as max_duration and min_duration

SELECT MIN(length) as min_duration, MAX(length) as max_duration 
FROM film;

-- 1.2. Express the average movie duration in hours and minutes. Don't use decimals.
-- Hint: Look for floor and round functions.
SELECT 
CASE 
	WHEN AVG(length) > 60 THEN ROUND(AVG(length), -1)/ 60 
    END as Hours,
CASE
	WHEN AVG(length) > 60 THEN FLOOR(AVG(length)) % 60 
	END as Minutes
FROM film;


-- 2.1 Calculate the number of days that the company has been operating
SELECT datediff(NOW(), MIN(rental_date)) / 365 as company_exist_time FROM rental;


# 2.2 Retrieve rental information and add two additional columns to show the month and weekday of the rental. Return 20 rows of results.
SELECT EXTRACT(MONTH FROM rental_date) as month_number, WEEKDAY(rental_date) as day_num
FROM rental;

-- You need to ensure that customers can easily access information about the movie collection. 
-- To achieve this, retrieve the film titles and their rental duration. If any rental duration value is NULL, 
-- replace it with the string 'Not Available'. 
-- Sort the results of the film title in ascending order.
SELECT title,
CASE 
	WHEN isnull(rental_duration) THEN REPLACE(rental_duration, null, 'Not Available')
    WHEN rental_duration THEN rental_duration
END as rental_duration
FROM film
ORDER BY title;

# Challenge 2 

-- Next, you need to analyze the films in the collection to gain some more insights. Using the film table, determine:
-- 1.1 The total number of films that have been released.
SELECT COUNT(title) as num_of_films 
FROM film;

-- 1.2 The number of films for each rating.
-- 1.3 The number of films for each rating, sorting the results in descending order of the number of films. 
SELECT rating, COUNT(title) as film_count
FROM film
GROUP BY rating
ORDER BY film_count DESC;

-- 2.1 The mean film duration for each rating, and sort the results in descending order of the mean duration. 
-- Round off the average lengths to two decimal places. This will help identify popular movie lengths for each category.
SELECT rating, ROUND(AVG(length), 2) as mean_duration
FROM film
GROUP BY rating
ORDER BY mean_duration DESC;

-- 2.2 Identify which ratings have a mean duration of over two hours in order to help select films for customers who prefer longer movies.
SELECT rating, ROUND(AVG(length), 2) as mean_duration
FROM film
GROUP BY rating
HAVING mean_duration > 120;





