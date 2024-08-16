class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  SPECIALITIES = ["poison", "accident", "fire", "explosives", "bladed weapon", "animal", "environmental", "rope", "technological", "creative", "gun fire", "distortion"]

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 250 }
  validates :speciality, presence: true, inclusion: { in: SPECIALITIES }

  include PgSearch::Model
  pg_search_scope :search_by_title_and_speciality,
    against: [ :title, :speciality ],
    using: {
      tsearch: { prefix: true }
    }
end
