class UserReview < ApplicationRecord
	belongs_to :user
	belongs_to :movie
	has_many :user_review_votes

	def vote_count
		user_review_votes.pluck(:vote).sum
	end
end
