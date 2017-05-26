class PlaceReview < ApplicationRecord
  belongs_to :user
  belongs_to :place
  validates :description, presence: :true
  validates :rating, numericality: { only_integer: true }, presence: true, inclusion: { in: (0..5), allow_nil: true }
end
