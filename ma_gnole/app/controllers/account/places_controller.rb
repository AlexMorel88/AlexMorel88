class Account::PlacesController < ApplicationController

  def index

     if params[:nbrPersons] != "" && params[:nbrPersons] != nil
      @places = Place.where("nbr_person >= ?", params[:nbrPersons])
    else
      @places = Place.all
    end

    if params[:checkin] != "" && params[:checkin] != nil
      @places = @places.select do |place|
        if place.availibilities.where("start_date >= ?", params[:checkin] ).length > 0
          true
        end
      end
    end


    if params[:checkout] != "" && params[:checkout] != nil


      @places = @places.select do |place|
        if place.availibilities.where("end_date <= ?", params[:checkout] ).length > 0
          true
        end
      end
    end

    if params[:location] != "" && params[:location] != nil
      if Place.near(params[:location], 50).length > 0
        @places = Place.near(params[:location], 50)
      end
    end

    @markers = []
    @places.each do |place|
     if place.latitude && place.longitude
      @markers << {
        lat: place.latitude,
        lng: place.longitude,
        infowindow: place.name
        }
     end
    end



  end


  def show
    @place = Place.find(params[:id])
    @place_reviews = @place.place_reviews
    @place_coordinates = { lat: @place.latitude, lng: @place.longitude }
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.user = current_user
    if @place.save
      redirect_to place_path(@place)
    else
      render :new
    end
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])
    @place.update(place_params)
    if @place.save
      redirect_to account_place_path(@place)
    else
      render :edit
    end
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    redirect_to account_places_path
  end

  private

  def place_params
    params.require(:place).permit(:name, :address, :description, :photo, :nbr_person, :price)
  end

end

