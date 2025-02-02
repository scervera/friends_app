class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :friendships
  #has_many :friendships, ->(user) { where('user_id = ? OR friend_id = ?', user.id, user.id) }
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  scope :all_except, ->(user) { where.not(id: user) }
  scope :all_friends_except, ->(user) { where('id NOT IN (SELECT DISTINCT(friend_id) FROM friendships)') }
  scope :all_friendships_requested, ->(user) { where('id IN (SELECT DISTINCT(friend_id) FROM friendships)') }
  #scope :all_friendships, ->(user) { where('id IN (SELECT DISTINCT(friend_id) FROM friendships) AND friendship_confirmed == true') }
  
end
