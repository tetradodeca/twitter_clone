class Tweet < ApplicationRecord
  belongs_to :user
  has_many :replies
  has_many :likes

  validates :post, presence: true
end