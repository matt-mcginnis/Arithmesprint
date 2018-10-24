class RemoveQuestionArrayFromChallenge < ActiveRecord::Migration[5.2]
  def change
    remove_column :challenges, :question_array, :text
  end
end
