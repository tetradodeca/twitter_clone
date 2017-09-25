class UserStatuses < ApplicationController

	def create
		new_follow = UserStatus.new
		new_follow.update(leader_id: params[:id], follower_id: current_user.id)
		if new_follow.save
			redirect_to @user
		end
	end

	def destroy
		unfollow = UserStatus.find(params[:id])
		unfollow.destroy
	end

end