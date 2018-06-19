class HomeController < ApplicationController
	#
	# Home Page
	#
	def index
		@movies = Movie.includes(:user_reviews, :movie_ratings).all
	end
end
