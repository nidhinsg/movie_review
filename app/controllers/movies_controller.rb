class MoviesController < ApplicationController
	def index
		@movies = Movie.all
	end

	def show
		@movie = Movie.includes(user_reviews: :user_review_votes).where(id: params[:id]).first
	end
end
