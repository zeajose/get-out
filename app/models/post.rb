class Post < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user
  has_many :bookings
  has_many :photos

  accepts_nested_attributes_for :photos

  validates :photos, presence: true
  validates :title, presence: true
  validates :price, presence: true

  include PgSearch
  pg_search_scope :search_by_title_description_category,
                  :against => {
                    :title => 'A',
                    :description => 'B',
                    :category => 'C'
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
