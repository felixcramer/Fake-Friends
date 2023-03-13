class Room < ApplicationRecord
  belongs_to :user
  has_many :room_questions, dependent: :destroy
  has_many :questions, through: :room_questions
  has_many :room_users
  has_many :users, through: :room_users
  has_many :user_answers

  validates :name, presence: true, uniqueness: true
end
