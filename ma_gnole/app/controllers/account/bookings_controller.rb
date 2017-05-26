class Account::BookingsController < ApplicationController

  after_action :make_new_availability, only: [:accepted, :refused]

  def index
  end

  def show
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  # def update
  #   @article = Article.find(params[:id])
  #   @article.update(article_params)
  #   redirect_to articles_path(@articles)
  # end

  def accepted
    @booking = Booking.find(params[:id])
    @booking.status = "accepted"
    @booking.save
    redirect_to account_profile_path
  end

  def refused
    @booking = Booking.find(params[:id])
    @booking.status = "refused"
    @booking.save
    redirect_to account_profile_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
  end

  private

  def make_new_availability
    @booking = Booking.find(params[:id])
    @availibility = Availibility.new(price: 20, start_date: @booking.start_date, end_date: @booking.end_date, place_id: @booking.place_id)
    @availibility.save
  end
end
