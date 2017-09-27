class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  mount_uploader :background, BackgroundUploader

  has_many :replies
  has_many :tweets
  has_many :likes

  has_many :user_statuses, foreign_key: "follower_id", dependent: :destroy
  has_many :follower_id, through: :user_statuses, source: :follower

  has_many :user_statuses, foreign_key: "leader_id", dependent: :destroy
  has_many :leader_id, through: :user_statuses, source: :leader

  validates :name, presence: true


end
