class Api::BaseApiController < ApplicationController
	before_action :authenticate_token

	def authenticate_token
		p "------", request.headers["HTTP_AUTH_TOKEN"]
		
		auth_token = request.headers["HTTP_AUTH_TOKEN"]
		unless User.where(auth_token: auth_token).present?
			render json: {status: "ERROR", message: "Authenticity Token Error"}
		end
	end
end