class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :bookings

  validates :first_name, presence: true
  validates :email, presence: true
  validates :password, presence: true

  mount_uploader :photo, PhotoUploader
end
