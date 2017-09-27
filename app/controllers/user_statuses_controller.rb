class UserStatusesController < ApplicationController

	def create
		@user = User.find(params[:user_id])
		new_follow = UserStatus.new
		new_follow.update(follower_id: current_user.id, leader_id: @user.id)
		respond_to do |format|
		format.html { redirect_to user_path(@user) }
		format.js
	end
	end

	def destroy
		unfollow = UserStatus.find(params[:user_status_id])
		unfollow.destroy
		respond_to do |format|
		format.html { redirect_to user_path(params[:id]) }
		format.js
	end
	end

end