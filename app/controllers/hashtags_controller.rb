class HashtagsController < ApplicationController
	def index 
		@hashtags = Hashtag.all 
	end
	def show
		@hashtag = Hashtag.find(params[:id])
	end
end
