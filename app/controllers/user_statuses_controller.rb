class UserStatusesController < ApplicationController

	def create
		@user = User.find(params[:user_id])
		new_follow = UserStatus.new
		new_follow.update(follower_id: current_user.id, leader_id: @user.id)
		redirect_to user_path(@user)
	end

	def destroy
		unfollow = UserStatus.find(params[:user_status_id])
		unfollow.destroy
		redirect_to user_path(params[:id])
	end

end