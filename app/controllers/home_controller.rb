class HomeController < ApplicationController
	before_action :authenticate_user!

	#
	# Home Page
	#
	def index
		@movies = Movie.includes(:user_reviews, :movie_ratings).all
	end
end
