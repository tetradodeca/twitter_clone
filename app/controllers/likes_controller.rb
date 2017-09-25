class LikesController < ApplicationController

	def create
		tit = tweet.likes.build
		tit.user = current_user
		tit.save
		redirect_to tweets_path
	end

	def destroy
		like = Like.find(params[:id])
		like.destroy
		redirect_to tweets_path
	end

	private

	def tweet
		Tweet.find(params[:tweet_id])
	end


end