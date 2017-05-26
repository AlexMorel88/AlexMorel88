class PlacesController < ApplicationController

  def index
    @params = params
    @places = Place.all
    if params[:nbrPersons].present?

      @places = Place.where("nbr_person >= ?", params[:nbrPersons])
    end


    if params[:location].present?
      @places = @places.near(params[:location], 50)

    end
# le select ici execute les requetes sql stockées au dessus,
# si pas de select c'est à l'affichage dans le html que les requetes sont réolues
    if params[:checkin].present? && params[:checkout].present?
      availables_places = []
      @places.each do |place|
        available = true
        place.availibilities.each do |a|
          if a.start_date <= params[:checkout].to_date || a.end_date <= params[:checkin].to_date
            available = false
          end
        end
        availables_places << place if available
      end
      @places = availables_places
    end

    if params[:price].present?
      #TODO
    end

    @markers = []
    @places.each do |place|
     if place.latitude && place.longitude
      @markers << {
        lat: place.latitude,
        lng: place.longitude,
        infowindow: "<a href=#{place_path(place)}><h2>#{place.name}</h2><h3>#{place.address}</h3><p><img src='#{place.photo}' height='200'></p>"
        }
     end
    end



  end

  def show
    @place = Place.find(params[:id])
    @place_reviews = @place.place_reviews


    @markers = []
     if @place.latitude && @place.longitude
      @markers << {
        lat: @place.latitude,
        lng: @place.longitude,
        infowindow: "<h1>#{@place.name}</h1><h2>#{@place.address}</h2><p><img src='#{@place.photo}' height='200'></p>"
        }
     end

  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.user = current_user
    if @place.save
      redirect_to account_place_path(@place)
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
    @place.delete
    redirect_to account_places_path
  end

  private

  def place_params
    params.require(:place).permit(:name, :address, :description, :photo, :nbr_person)
  end


end
