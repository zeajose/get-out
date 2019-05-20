class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :user, through: :post
  belongs_to :post
end
