class UserStatus < ApplicationRecord

	belongs_to :leader, class_name: "User"
	belongs_to :follower, class_name: "User"
	validates :leader_id, presence: true
	validates :follower_id, presence: true
end