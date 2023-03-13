class AddUserstoAnswers < ActiveRecord::Migration[7.0]
  def change
    add_reference :answers, :users, index: true, foreign_key: true
  end
end
