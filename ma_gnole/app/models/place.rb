class Place < ApplicationRecord
  belongs_to :user
  has_many :availibilities, dependent: :destroy
  has_many :place_reviews, dependent: :destroy
  has_many :user_reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  validates :name, presence: :true
  validates :address, presence: :true
  validates :description, presence: :true
  validates :price, numericality: { only_integer: true }, presence: :true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
