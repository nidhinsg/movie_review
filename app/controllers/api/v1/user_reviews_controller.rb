class Api::V1::UserReviewsController < Api::BaseApiController

	def create
		@user_review = UserReview.create(user_id: params[:user_id],
										movie_id: params[:movie_id],
										review_comment: params[:comments])		
	end
end
