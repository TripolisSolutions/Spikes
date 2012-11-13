class SessionsController < ApplicationController
  def create
    session[:user_id] = uid
    session[:auth_token] = auth_token
    redirect_to "/"
  end
end
