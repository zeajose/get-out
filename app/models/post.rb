class Post < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :photos
end
