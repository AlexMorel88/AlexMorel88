class Availibility < ApplicationRecord
  belongs_to :place
  validates :start_date, uniqueness: { scope: :place }
end
