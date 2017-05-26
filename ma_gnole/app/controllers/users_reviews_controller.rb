class UsersReviewsController < ApplicationController

  def new
    @user_review = UserReview.new
    @user_id = params['user_id']
    @place_id = params['place_id']
  end

  def create
    @user_review = UserReview.new(users_reviews_params)
    @user_review.place_id = params["user_review"]['place_id'].to_i
    @user_review.user_id = params["user_review"]['user_id'].to_i

    if @user_review.save
      redirect_to account_profile_path
    else
      render :new
    end
  end

  def destroy
  end

  private

  def users_reviews_params
    params.require(:user_review).permit(:rating, :description)
  end
end
