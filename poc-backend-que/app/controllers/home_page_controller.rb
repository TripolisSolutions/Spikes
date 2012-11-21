class HomePageController < ApplicationController

  include PlaceHelper

  def index
    @current_user
    @trend_locations = trend_locations(@current_user) if signed_in?
    @place = current_user.places.build if signed_in?
  end

end
