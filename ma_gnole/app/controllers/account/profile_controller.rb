class Account::ProfileController < ApplicationController

  def show
    @bookings = current_user.bookings
    @old_bookings = @bookings.where("end_date < ?", 1.days.ago)
    @next_bookings = @bookings.where("end_date > ?", 1.days.ago)
    @places = current_user.places
    @availibilities = []
    @places.each do |element|
      @availibilities << Availibility.where(place_id: element.id)

    end
  end

  def edit
  end

  def update
  end
end
