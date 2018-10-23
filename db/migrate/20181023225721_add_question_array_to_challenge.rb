class AddQuestionArrayToChallenge < ActiveRecord::Migration[5.2]
  def change
    add_column :challenges, :question_array, :text
  end
end
