class LikesController < ApplicationController

	def create

		@tweet = Tweet.find(params[:tweet_id])
		@user = User.find(params[:id])
		tit = tweet.likes.build
		tit.user = current_user
		tit.save
		respond_to do |format|
			format.js { render 'create.js.erb' }
		end
	end

	def destroy

		@tweet = Tweet.find(params[:tweet_id])
		@user = User.find(params[:id])
		like = Like.find(params[:like_id])
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