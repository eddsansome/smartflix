SELECT movies.id, title, released, poster, movie_ratings.average_rating
FROM movies
INNER JOIN movie_ratings
ON movies.id = movie_ratings.movie_id
order by movie_ratings.average_rating desc
limit 50