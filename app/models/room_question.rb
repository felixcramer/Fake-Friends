class RoomQuestion < ApplicationRecord
  belongs_to :room
  belongs_to :question
end
