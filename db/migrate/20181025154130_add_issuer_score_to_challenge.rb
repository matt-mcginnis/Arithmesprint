class AddIssuerScoreToChallenge < ActiveRecord::Migration[5.2]
  def change
    add_column :challenges, :issuer_score, :integer
  end
end
