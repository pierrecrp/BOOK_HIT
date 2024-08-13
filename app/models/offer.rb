class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings
  
  SPECIALITIES = ["poison", "accident", "fire", "explosives", "bladed weapon", "animal", "environmental", "rope", "technological", "creative", "gun fire", "distortion"]

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 250 }
  validates :speciality, presence: true, inclusion: { in: SPECIALITIES }
end
