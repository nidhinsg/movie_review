class Movie < ApplicationRecord
	mount_uploader :image, ImageUploader
	has_many :user_reviews, dependent: :destroy
	has_many :movie_ratings, dependent: :destroy
	validates :name, presence: true, uniqueness: true

	def get_avg_rating
		movie_ratings.average(:ratings).to_i
	end

	def self.highest_average_rated_movie
	    select('movies.*, avg(movie_ratings.ratings) as averages')
	    	.joins('LEFT JOIN movie_ratings on movie_ratings.movie_id = movies.id')
	    	.group('movies.id')
	    	.order('averages DESC')
	end
end
