class AddUserRefToUserAnswers < ActiveRecord::Migration[7.0]
  def change
    remove_column :user_answers, :user_id
    add_reference :user_answers, :user, null: false, foreign_key: true
  end
end
