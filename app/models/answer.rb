class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :room_question, optional: true
end
