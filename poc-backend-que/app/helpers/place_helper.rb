module PlaceHelper
  def trend_locations(user)
    Rails.cache.fetch("places/#{user.id}", expires_in: 2.minutes) do
      user.twitter.trend_locations
    end
  end

  def find_location(user, woeid)
    trend_locations(user).select{|place| place.attrs[:woeid].to_s == woeid}
  end
end
