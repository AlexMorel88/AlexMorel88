class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :place
  validates :status, presence: :true
end
