class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :post, presence: true
  validates_presence_of :start_date, :end_date
  validate :end_date_is_after_start_date
  validate :start_date_is_same_or_later_than_date_today

  private

  def end_date_is_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date <= start_date
      errors.add(:end_date, "cannot be before or same as the start date")
    end
  end

  def start_date_is_same_or_later_than_date_today
    return if end_date.blank? || start_date.blank?

    if start_date < Time.now.to_date
      errors.add(:start_date, "cannot be in the past")
    end
  end
end
