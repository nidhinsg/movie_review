class Api::V1::MoviesController < Api::BaseApiController

	def index
		@movies = Movie.all
	end

	def highest_avg_rated
		@movies = Movie.highest_average_rated_movie
	end
end
