class RoomQuestion < ApplicationRecord
  belongs_to :room
  belongs_to :question
  has_many :answers
  has_many :answers, through: :question
end
