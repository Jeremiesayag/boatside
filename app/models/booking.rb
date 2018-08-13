class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :yacht
  validate :start_date_cannot_be_in_the_past,
    :start_date_cannot_be_after_end_date

  def start_date_cannot_be_in_the_past
    if start_date < Date.today
    errors.add(:start_date, "can't be in the past")
    end
  end

  def start_date_cannot_be_after_end_date
    if start_date > end_date
      errors.add(:end_date, "can't be before the start date")
    end
  end

end
