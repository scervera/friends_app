class HomeController < ApplicationController
  # def index
  # 	@users = User.all_except(current_user)
  # 	@users = @users.all_friends_except(current_user)
  # 	@friendships = Friendship.where(user_id: current_user.id)
  # end

  def index
  	@filtered_users = User.all_except(current_user)
    @filtered_users = @filtered_users.all_friends_except(current_user)
  	@friendships = Friendship.where(user_id: current_user.id)
    if params[:search]
      search_term = params[:search].downcase.gsub(/\s+/, "")
      @users = @filtered_users.select { |user|
              user.email.include?(search_term)
              # add aditional search terms here. make sure to add OR statement with ||
            }
    else
      @users = []
    end
  end
end
