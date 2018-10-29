class AddChallengeTiesToUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :challenge_ties, :integer, default: 22
  end
end
