class AddPendingChallengeInvitationsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :pending_challenge_invitations, :text
  end
end
