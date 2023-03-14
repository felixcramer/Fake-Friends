class AddRoundToRoomQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :room_questions, :round, :integer
  end
end
