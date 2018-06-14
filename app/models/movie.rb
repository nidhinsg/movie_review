class Movie < ApplicationRecord
	mount_uploader :image, ImageUploader
	has_many :user_reviews, dependent: :destroy
end
