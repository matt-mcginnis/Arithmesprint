class AddAcceptanceStatusToChallenge < ActiveRecord::Migration[5.2]
  def change
    add_column :challenges, :accepted, :boolean
  end
end
