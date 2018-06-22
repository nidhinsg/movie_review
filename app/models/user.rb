class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_reviews, dependent: :destroy
  has_many :movie_ratings, dependent: :destroy
  before_save :generate_auth_token

  protected
  def generate_auth_token
  	self.auth_token = SecureRandom.urlsafe_base64(nil, false)
  end  
end
