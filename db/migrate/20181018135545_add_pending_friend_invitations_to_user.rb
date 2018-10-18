class AddPendingFriendInvitationsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :pending_friend_invitations, :text
  end
end
