class AddRoomQuestiontoAnswers < ActiveRecord::Migration[7.0]
  def change
    add_reference :answers, :room_question, index: true, foreign_key: true
  end
end
