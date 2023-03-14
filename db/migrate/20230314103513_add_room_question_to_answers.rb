class AddRoomQuestionToAnswers < ActiveRecord::Migration[7.0]
  def change
    add_reference :answers, :room_question, null: true, foreign_key: true
  end
end
