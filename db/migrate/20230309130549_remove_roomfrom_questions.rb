class RemoveRoomfromQuestions < ActiveRecord::Migration[7.0]
  def change
    remove_reference :questions, :room, index: true, foreign_key: true
  end
end
