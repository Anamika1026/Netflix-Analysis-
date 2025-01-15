create database netflix_titles;

USE netflix_titles;

select * from netflix_titles;

## the number of movies and TV shows added each year
SELECT YEAR(date_added) AS year, type, COUNT(*) AS count
FROM netflix_titles
GROUP BY YEAR(date_added), type
ORDER BY year;

##identify top countries contributing content
SELECT country, COUNT(*) AS total_content
FROM netflix_titles
GROUP BY country
ORDER BY total_content DESC
LIMIT 10;

##find the most common genres
SELECT listed_in AS genre, COUNT(*) AS count
FROM netflix_titles
GROUP BY genre
ORDER BY count DESC
LIMIT 10;

##count content by rating
SELECT rating, COUNT(*) AS count
FROM netflix_titles
GROUP BY rating
ORDER BY count DESC;

##aggregate trends
SELECT listed_in AS genre, COUNT(*) AS yearly_count, YEAR(date_added) AS year
FROM netflix_titles
GROUP BY genre, year
ORDER BY year;


##identify underperforming genres or regions with minimal content
SELECT country, listed_in AS genre, COUNT(*) AS count  
FROM netflix_titles  
GROUP BY country, genre  
HAVING count < 10  
ORDER BY count ASC;



##identify overlapping genres for content targeting
SELECT listed_in AS genre, COUNT(*) AS count
FROM netflix_titles
WHERE rating = 'TV-MA'
GROUP BY genre
ORDER BY count DESC;



