class Room < ApplicationRecord
  MAX_ROOM_USERS_IN_ROOM = 8

  belongs_to :user
  has_many :questions, dependent: :destroy
  has_many :room_questions, dependent: :destroy
  has_many :room_users, before_add: :check_room_users_limit
  has_many :users, through: :room_users

  validates :name, presence: true, uniqueness: true
  private

  def check_room_users_limit()
    raise RoomUserLimitExceeded if room_users.size >= MAX_ROOM_USERS_IN_ROOM
  end
end
