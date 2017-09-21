class LikesController < ApplicationController

	before_action :set_tweet

	def create
		tit = tweet.likes.build(like_params)
		tit.user = current_user
		tit.save
		redirect_to tweet_path(tweet_id: tweet.id)
	end

	def destroy
		unlike = Like.find(params[:id])
		unlike.destroy
		redirect_to tweet_path(tweet_id: tweet.id)
	end

	private

	def tweet
		Tweet.find(params[:id])
	end

	def like_params
		params.require(:like).permit(:status)
	end

end