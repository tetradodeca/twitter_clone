class LikesController < ApplicationController

	def create
		@tweet = Tweet.find(params[:tweet_id])
		tit = tweet.likes.build
		tit.user = current_user
		tit.save
		respond_to do |format|
			format.js { render 'create.js.erb' }
		end
	end

	def destroy
		@tweet = Tweet.find(params[:tweet_id])
		like = Like.find(params[:id])
		like.destroy
		respond_to do |format|
			format.js { render 'destroy.js.erb' }
		end
	end

	private

	def tweet
		Tweet.find(params[:tweet_id])
	end


end