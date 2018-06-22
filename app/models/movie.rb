class Movie < ApplicationRecord
	mount_uploader :image, ImageUploader
	has_many :user_reviews, dependent: :destroy
	has_many :movie_ratings, dependent: :destroy
	validates :name, presence: true, uniqueness: true

	def get_avg_rating
		movie_ratings.average(:ratings).to_i
	end

	def get_current_user_rating user_id
		movie_ratings.where(user_id: user_id).first.ratings
	end

	def self.highest_average_rated_movie
	    select('movies.*, avg(movie_ratings.ratings) as averages')
	    	.joins('LEFT JOIN movie_ratings on movie_ratings.movie_id = movies.id')
	    	.group('movies.id')
	    	.order('averages DESC')
	end

	def self.recommended_movie user_id
		# movies rated above 3 by the user
		user_higher_rated_movies = Movie.joins("LEFT JOIN movie_ratings ON movie_ratings.movie_id = movies.id")
										.where("movie_ratings.user_id = ? && movie_ratings.ratings >= ?", user_id, 3)
		# other users who voted for these movies with higher ratings
		users_rated = User.joins("LEFT JOIN movie_ratings ON movie_ratings.user_id = users.id")
						.joins("LEFT JOIN movies ON movies.id = movie_ratings.movie_id")
						.where("movie_ratings.ratings >= ? && movies.id IN (?) && user_id NOT IN (?)", 3, user_higher_rated_movies.pluck(:id), user_id)
		# other movies that are voted for higher rating by these users	
		recommended_movies = Movie.joins("LEFT JOIN movie_ratings ON movie_ratings.movie_id = movies.id")
								.where("movie_ratings.ratings >= ? && movie_ratings.user_id NOT IN (?) && movie_ratings.user_id IN (?)", 3, users_rated, u1.pluck(:id))		
	end
end
