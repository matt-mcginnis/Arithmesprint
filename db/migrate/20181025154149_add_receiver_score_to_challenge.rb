class AddReceiverScoreToChallenge < ActiveRecord::Migration[5.2]
  def change
    add_column :challenges, :receiver_score, :integer
  end
end
