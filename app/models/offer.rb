class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 250 }
  validates :speciality, presence: true, inclusion: { in: ["poison", "accident", "fire", "explosives", "bladed weapon", "animal", "environmental", "rope", "technological", "creative", "gun fire", "distortion"] }
end
