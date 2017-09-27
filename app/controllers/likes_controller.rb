class LikesController < ApplicationController

	def create
		@user = User.find(params[:id])
		tit = tweet.likes.build
		tit.user = current_user
		tit.save
		redirect_to tweets_path
	end

	def destroy
		@user = User.find(params[:id])
		like = Like.find(params[:like_id])
		like.destroy
		redirect_to tweets_path
	end

	private

	def tweet
		Tweet.find(params[:tweet_id])
	end


end