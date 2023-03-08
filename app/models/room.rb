class Room < ApplicationRecord
  belongs_to :user
  has_many :question

  validates :name, presence: true, uniqueness: true
end
