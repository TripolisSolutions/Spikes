class TweetsController < ApplicationController

  before_filter :signed_in_user

  def create
    @tweet = current_user.tweets.build(params[:tweet])
    begin
      published_tweet = current_user.twitter.update(@tweet.status)
      @tweet.status_id = published_tweet.id
      @tweet.save!
      flash[:notice] = "Tweet created!"
    rescue
      flash[:error] = "Oops, something went wrong!"
    end

    respond_to do |format|
      format.html { redirect_to root_url }
      format.js
    end
  end

end