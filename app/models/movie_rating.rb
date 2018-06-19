class MovieRating < ApplicationRecord
	belongs_to :user
	belongs_to :movie
	validates :ratings, inclusion: 1..5

	def self.get_avg_rating_of_movie movie_id
		where(movie_id: movie_id)
		.average(:ratings).to_i
	end
end
