class AddCounterToRoomUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :room_users, :counter, :integer
  end
end
