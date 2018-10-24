class AddPendingChallengeRequestsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :pending_challenge_requests, :text
  end
end
