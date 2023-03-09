class Room < ApplicationRecord
  belongs_to :user
  has_many :questions, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
