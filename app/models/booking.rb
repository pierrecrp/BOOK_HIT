class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :offer

  validates :target, presence: true, uniqueness: true
  validates :deadline, presence: true
end
