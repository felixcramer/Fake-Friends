class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :rooms, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :user_answers, dependent: :destroy
  has_one_attached :photo
  before_destroy :purge_photo

  validates :username, presence: true, uniqueness: true
  private

  def purge_photo
    photo.purge
  end
end

