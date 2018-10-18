class AddPendingFriendRequestsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :pending_friend_requests, :text
  end
end
