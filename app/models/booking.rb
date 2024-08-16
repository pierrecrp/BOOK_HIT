class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :offer

  validates :target, presence: true, uniqueness: true
  validates :deadline, presence: true
  validates :target_address, presence: true

  geocoded_by :target_address
  after_validation :geocode, if: :will_save_change_to_target_address?
end
