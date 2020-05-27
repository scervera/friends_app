class HomeController < ApplicationController
  def index
  	@users = User.all_except(current_user)
  	@users = @users.all_friends_except(current_user)
  	@friendships = Friendship.where(user_id: current_user.id)
  end
end
