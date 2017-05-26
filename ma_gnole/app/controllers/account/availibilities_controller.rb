class Account::AvailibilitiesController < ApplicationController

  def new
    @availibility = Availibility.new
  end

  def create
    @availibility = Availibility.new(availibility_params.merge(place_id: params['availibility'][:place_id].to_i))
    if @availibility.save!
      redirect_to account_profile_path
    else
      render :new
    end

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def availibility_params
    params.require(:availibility).permit(:start_date, :end_date, :price)
  end
end
