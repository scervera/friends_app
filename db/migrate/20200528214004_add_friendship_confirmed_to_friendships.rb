class AddFriendshipConfirmedToFriendships < ActiveRecord::Migration[5.2]
  def change
    add_column :friendships, :friendship_confirmed, :boolean
  end
end
