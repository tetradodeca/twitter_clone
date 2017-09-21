class RepliesController < ApplicationController

  def create
    reply_params = params.require(:reply).permit(:comment)
    tweet = Tweet.find(params[:tweet_id])
    twee = tweet.replies.build(reply_params)
    twee.user = current_user
    twee.save
    redirect_to tweet_path(id: tweet.id)
  end

  def edit
    @tweet = Tweet.find(params[:tweet_id])
    @reply = Reply.find(params[:id])
  end

  def update
    reply_params = params.require(:reply).permit(:comment)
    @tweet = Tweet.find(params[:tweet_id])
    @reply = Reply.find(params[:id])
    if @reply.update(reply_params)
      redirect_to tweet_path(id: @tweet.id)
    else
      render :edit
    end
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    @reply = Reply.find(params[:id])
    @reply.destroy
    redirect_to tweet_path(id: @tweet.id)
  end

end