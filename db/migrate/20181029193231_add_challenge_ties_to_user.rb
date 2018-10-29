class AddChallengeTiesToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :challenge_ties, :integer, :default => 0
  end
end
