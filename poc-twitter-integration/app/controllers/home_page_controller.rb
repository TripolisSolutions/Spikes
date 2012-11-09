class HomePageController < ApplicationController

  def index
    @tweet = current_user.tweets.build if signed_in?
  end
end
