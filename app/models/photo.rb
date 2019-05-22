class Photo < ApplicationRecord
  belongs_to :post
  mount_uploader :source, PhotoUploader
  validates :photo, presence: true

end
