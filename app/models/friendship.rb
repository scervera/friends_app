class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, :class_name => "User"

  validates :friend, uniqueness: true #{ scope: %i[user_id friend_id],
    #message: "This person is already a friend." }

  scope :all_friendships_confirmed, -> { where(friendship_confirmed: true ) }
  scope :all_friendships_pending, -> { where(friendship_confirmed: nil || false ) }
  #scope :all_friendships_requested, -> { where('id IN (SELECT DISTINCT(friend_id) FROM friendships)') }
  scope :all_friendships, ->(user) { where('id IN (SELECT DISTINCT(friend_id == user) || (user_id == user) FROM friendships)') }

end
