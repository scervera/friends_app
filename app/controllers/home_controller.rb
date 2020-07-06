class HomeController < ApplicationController
  # def index
  # 	@users = User.all_except(current_user)
  # 	@users = @users.all_friends_except(current_user)
  # 	@friendships = Friendship.where(user_id: current_user.id)
  # end

  def index
  	@user = current_user
  	@filtered_users = User.all_except(current_user)
    @friendships = Friendship.where(user_id: current_user.id)
  	@friend_requests = Friendship.where(friend_id: current_user.id, friendship_confirmed: false)
  	@my_friendships = Friendship.where(user_id: current_user.id, friendship_confirmed: true) 
    @received_friendships = Friendship.where(friend_id: current_user.id, friendship_confirmed: true)
    @all_my_friendships = (@my_friendships + @received_friendships)
    @combined_friends = ( @user.friends + @user.inverse_friends )
    #@all_my_friendships = Friendship.where('user_id = ? OR friend_id = ?', @user.id, @user.id).where(friendship_confirmed: true)
    #@all_my_friendships = Friendship.all_friendships(current_user)
    if params[:search]
      search_term = params[:search].downcase.gsub(/\s+/, "")
      @possible_friends = @filtered_users.select { |user|
              user.email.include?(search_term)
              # add aditional search terms here. make sure to add OR statement with ||
            }
    else
      @possible_friends = []
    end
  end
end

