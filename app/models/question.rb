class Question < ApplicationRecord
  belongs_to :room, optional: true
  has_many :answer, dependent: :destroy
end
