class AddChallengeLossesToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :challenge_losses, :integer, :default => 0
  end
end
