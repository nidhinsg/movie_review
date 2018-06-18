class Movie < ApplicationRecord
	mount_uploader :image, ImageUploader
	has_many :user_reviews, dependent: :destroy
	has_many :movie_ratings, dependent: :destroy

	def get_avg_rating
		self.movie_ratings.average(:ratings).to_i
	end
end
