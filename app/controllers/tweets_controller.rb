class TweetsController < ApplicationController

before_action :authenticate_user!, except: [:index]

def index
  @tweets = Tweet.all.order("created_at DESC")
end

def new
  @tweet = Tweet.new
end

def create
  tweet_params = params.require(:tweet).permit(:post, :user_id)
  @tweet = Tweet.new(tweet_params)
  @tweet.user = current_user
  if @tweet.save
    redirect_to tweets_path
  else
    render :new
  end
end

def show
  @tweet = Tweet.find(params[:id])
  @reply = Reply.new
end

def edit
  @tweet = Tweet.find(params[:id])
end

def update
  tweet_params = params.require(:tweet).permit(:post, :user_id)
  @tweet = Tweet.find(params[:id])
  if @tweet.update(tweet_params)
    flash[:notice] = "Tweet edited!"
    redirect_to root_path
  else
    flash.now[:notice] = "Field cannot be blank!"
    render :edit
  end
end

def destroy
  @tweet = Tweet.find(params[:id])
  @tweet.destroy
  redirect_to tweets_path
end


end