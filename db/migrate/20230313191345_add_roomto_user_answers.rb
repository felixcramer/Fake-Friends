class AddRoomtoUserAnswers < ActiveRecord::Migration[7.0]
  def change
    add_reference :user_answers, :room, index: true, foreign_key: true
  end
end
