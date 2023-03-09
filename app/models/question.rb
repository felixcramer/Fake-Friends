
class Question < ApplicationRecord
  belongs_to :room, optional: true
  has_many :answers, dependent: :destroy
  has_many :room_questions, dependent: :destroy
end