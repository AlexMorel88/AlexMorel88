  class BookingsController < ApplicationController

  before_action :authenticate_user!

  def new
    @place = Place.find(params[:place_id])
    @booking = Booking.new
  end

  def create
    @place = Place.find(params[:place_id])
    @booking = Booking.new(booking_params)
    @booking.status = "pending"
    @days = diff_days(@booking.start_date, @booking.end_date).to_i
    @booking.price = @place.price * @days
    @booking.place = @place
    @booking.user = current_user
    if @booking.save!
      BookingMailer.confirm(@booking).deliver_now
      redirect_to places_path

    else
      render :new
    end
  end

  def diff_days(start_date, end_date)
    @nbr_days = end_date - start_date
  end

private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
