class ParksController < ApplicationController

  skip_before_action :require_login, :only => [:index, :show]

  def index
    if Park.park_exist?(params[:park_name])
      @park = Park.find_park(params[:park_name])[0]
      redirect_to park_path(@park.id)
    else
      @score = Socrata.get_score(params[:park_name])
      @park = Socrata.get_info(params[:park_name])
    end
  end

  def show
    @park = Park.find(params[:id])
    @score = @park.score
    @post = @park.posts.build
  end

  def create
    current_user.parks.build(park_params)
    if current_user.save
      flash.notice = "Park added to MyParks"
      redirect_back(fallback_location: current_user)
    else
      flash.notice = "Error in park addition."
      redirect_to current_user
    end
  end

  def edit
    @park = Park.find(params[:id])
    @feature = @park.features.build
  end

  def update
    @park = Park.find(params[:id])
    if @park.update(park_params)
      flash.notice = "Park updated."
      redirect_to @park
    else
      flash.notice = "Update error."
      redirect_to @park
    end
  end

  private

  def park_params
    response = params.require(:park).permit(:parkname, :parktype, :zipcode, feature_ids: [], features_attributes: [:name])
    response["score"] = params[:score]
    response
  end

end
