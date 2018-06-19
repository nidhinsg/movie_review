json.id @movie_rating.id
json.ratings @movie_rating.ratings
json.average_rating MovieRating.get_avg_rating_of_movie @movie_rating.movie_id
