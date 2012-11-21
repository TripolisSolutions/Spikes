class HomePageController < ApplicationController

  def index
    @current_user
    @trend_locations = trend_locations(@current_user) if signed_in?
  end

  def trend_locations(user)
    Rails.cache.fetch("places/#{user.id}", expires_in: 2.minutes) do
      user.twitter.trend_locations
    end
  end

end
