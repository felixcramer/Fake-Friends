class AddAnswerRefToUserAnswers < ActiveRecord::Migration[7.0]
  def change
    remove_column :user_answers, :answer_id
    add_reference :user_answers, :answer, null: false, foreign_key: true
  end
end
