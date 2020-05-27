class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, :class_name => "User"

  validates_uniqueness_of :friend, scope: %i[user_id friend_id]

  
end
