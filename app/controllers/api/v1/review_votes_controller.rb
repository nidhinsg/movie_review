class Api::V1::ReviewVotesController < Api::BaseApiController

	def create				 
		review_vote = UserReviewVote.find_or_initialize_by(user_id: params[:user_id],
														user_review_id: params[:user_review_id])
		review_vote.vote = params[:vote_flag]
		# byebug
		review_vote.save
		@user_review = UserReview.find(params[:user_review_id])									
	end
end
