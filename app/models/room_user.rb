class RoomUser < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates_uniqueness_of :user_id, scope: :room_id
end
