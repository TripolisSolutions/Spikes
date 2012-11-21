class PlacesController < ApplicationController

  include PlaceHelper

  def index
    # return array of places the user is monitoring
  end

  def create
    locations = find_location(current_user, params[:location])
    if locations.empty?
      #do something smart
    else
      location = locations[0]
      @place = current_user.places.build(:woeid => location.attrs[:woeid],
      :name => location.attrs[:name],
      :country => location.attrs[:country],
      :place_type => location.attrs[:placeType][:name] )
      @place.save!
    end

    respond_to do |format|
      format.html { redirect_to root_url }
      format.js #update overview of monitored places
    end

  end

  def delete
  end
end
