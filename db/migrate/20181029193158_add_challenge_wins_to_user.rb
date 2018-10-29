class AddChallengeWinsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :challenge_wins, :integer, :default => 0
  end
end
