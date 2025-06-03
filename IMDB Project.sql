-- a) Can you get all data about movies?
SELECT * FROM movies;

-- b) How do you get all data about directors?
SELECT * FROM directors;

-- c) How many movies are present in IMDB?
SELECT COUNT(*) AS total_movies FROM movies;

-- d) Find these 3 directors: James Cameron ; Luc Besson ; John Woo
SELECT * FROM directors
WHERE name IN ('James Cameron', 'Luc Besson', 'John Woo');

-- e) Find all directors with name starting with S.
SELECT * FROM directors
WHERE name LIKE 'S%';

-- f) Count female directors.
-- Note: Gender = 1 represents female
SELECT COUNT(*) AS female_directors
FROM directors
WHERE gender = 1;

-- g) What is the name of the 10th first woman director? (ordered alphabetically)
SELECT name
FROM directors
WHERE gender = 1
ORDER BY name
LIMIT 1 OFFSET 9;

-- h) What are the 3 most popular movies?
SELECT original_title, popularity
FROM movies
ORDER BY popularity DESC
LIMIT 3;

-- i) What are the 3 most bankable movies? (profit = revenue - budget)
SELECT original_title, (revenue - budget) AS profit
FROM movies
ORDER BY profit DESC
LIMIT 3;

-- j) What is the most awarded average vote since January 1st, 2000?
SELECT original_title, vote_average, release_date
FROM movies
WHERE release_date >= '2000-01-01'
ORDER BY vote_average DESC
LIMIT 1;

-- k) Which movie(s) were directed by Brenda Chapman?
SELECT m.original_title
FROM movies m
JOIN directors d ON m.director_id = d.id
WHERE d.name = 'Brenda Chapman';

-- l) Which director made the most movies?
SELECT d.name, COUNT(*) AS movie_count
FROM movies m
JOIN directors d ON m.director_id = d.id
GROUP BY d.name
ORDER BY movie_count DESC
LIMIT 1;

-- m) Which director is the most bankable? (total profit from all movies)
SELECT d.name, SUM(m.revenue - m.budget) AS total_profit
FROM movies m
JOIN directors d ON m.director_id = d.id
GROUP BY d.name
ORDER BY total_profit DESC
LIMIT 1;
