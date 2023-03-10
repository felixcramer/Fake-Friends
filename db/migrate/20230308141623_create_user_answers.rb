class CreateUserAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :user_answers do |t|
      t.integer :answer_id
      t.integer :user_id

      t.timestamps
    end
  end
end
