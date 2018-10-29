class AddChallengeLossesToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :challenge_losses, :integer
    change_column_default(:users, :challenge_losses, 0)
  end
end
