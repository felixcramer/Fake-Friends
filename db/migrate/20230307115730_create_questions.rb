class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :content
      t.integer :round
      t.references :room, null: true, foreign_key: true

      t.timestamps
    end
  end
end
