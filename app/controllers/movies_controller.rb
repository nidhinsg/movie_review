class MoviesController < ApplicationController
	before_action :authenticate_user!

	def index
		@movies = Movie.all
	end

	def show
		@movie = Movie.includes(user_reviews: [:user, :user_review_votes]).where(id: params[:id]).first		
	end
end
