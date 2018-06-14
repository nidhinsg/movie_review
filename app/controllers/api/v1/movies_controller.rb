class Api::V1::MoviesController < ApplicationController

	def index
		@movies = Movie.all
		respond_to do |format|
      		format.xml 
      		format.json
    	end
	end
end
