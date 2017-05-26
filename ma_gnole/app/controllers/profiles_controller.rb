class ProfilesController < ApplicationController

  def show
    @profile = Profile.find(params[:id])
    @user = User.find(params[:id])
  end

end
