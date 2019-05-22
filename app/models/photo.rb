class Photo < ApplicationRecord
  belongs_to :post
  mount_uploader :source, PhotoUploader
end
