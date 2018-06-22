class Api::V1::MovieRatingsController < Api::BaseApiController

	def create
		@movie_rating = MovieRating.find_or_initialize_by(user_id: params[:user_id],
													movie_id: params[:movie_id])
		@movie_rating.ratings = params[:rating]
		@movie_rating.save
	end
end
