class AddNameToRooms < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :name, :string
  end
end
