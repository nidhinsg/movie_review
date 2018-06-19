class UserReviewVote < ApplicationRecord
	validates :vote, :inclusion => %w(1 -1)
	validates_uniqueness_of :user_review_id, scope: :user_id
end
