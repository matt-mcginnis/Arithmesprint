class AddProblemArrayToChallenge < ActiveRecord::Migration[5.2]
  def change
    add_column :challenges, :problem_array, :text
  end
end
