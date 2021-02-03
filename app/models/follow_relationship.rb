class FollowRelationship < ApplicationRecord
  belongs_to :follower
  belongs_to :following

  validates :follower_id, presence: true
  validates :following_id, presence: true
end
