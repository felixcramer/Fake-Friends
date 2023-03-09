class CreateRoomQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :room_questions do |t|
      t.references :room, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
