class CreateChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :challenges do |t|
      t.string :type
      t.integer :length
      t.integer :challenger_id
      t.integer :challenge_acceptor_id

      t.timestamps
    end
  end
end
