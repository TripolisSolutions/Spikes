class SessionsController < ApplicationController
  def create
    session[:user_id] = uid
    redirect_to "/"
  end
end
