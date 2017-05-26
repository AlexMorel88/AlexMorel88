class PlacesReviewsController < ApplicationController

  def new
    @places_review = PlaceReview.new
  end

  def create
    @places_review = PlaceReview.new(places_reviews_params)
    @places_review.user = current_user
    @places_review.place = Place.find(params[:place_id])
    if @places_review.save
      redirect_to place_path(@places_review.place)
    else
      render :new
    end
  end

  def destroy
    @places_review = PlaceReview.find(params[:id])
    @places_reviews.delete
    redirect_to account_place(@place)
  end

  private

  def places_reviews_params
    params.require(:place_review).permit(:rating, :description)
  end
end
