
class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :room_questions, dependent: :destroy
end
