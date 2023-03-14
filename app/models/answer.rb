class Answer < ApplicationRecord
  belongs_to :question, optional: true
  belongs_to :user, optional: true
  belongs_to :room_question, optional: true
end
