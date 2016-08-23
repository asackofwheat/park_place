class UserParksController < ApplicationController

  def create
    current_user.parks << Park.find(params["park_id"])
    if current_user.save
      flash.notice = "Park added to MyParks"
      redirect_back(fallback_location: current_user)
    else
      flash.notice = "Error in addition."
      redirect_back(fallback_location: current_user)
    end
  end

  def destroy
    if current_user.parks.delete(params[:id])
      flash.notice = "Park removed from MyParks."
      redirect_back(fallback_location: current_user)
    else
      flash.notice = "Problem in deletion."
      redirect_to current_user
    end
  end

end
