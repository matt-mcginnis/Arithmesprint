class CreateChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :challenges do |t|
      t.string :category
      t.integer :length
      t.integer :issuer_id
      t.integer :receiver_id

      t.timestamps
    end
  end
end
