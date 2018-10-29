class AddChallengeWinsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :challenge_wins, :integer
    change_column_default(:users, :challenge_wins, 4)
  end
end
