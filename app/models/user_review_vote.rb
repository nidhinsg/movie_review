class UserReviewVote < ApplicationRecord
	validates_uniqueness_of :user_review_id, scope: :user_id
end
