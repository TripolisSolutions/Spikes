class SessionsController < ApplicationController
  def create
    p auth
    session[:user_id] = uid
    session[:auth_token] = auth_token
    redirect_to "/"
  end

  private

  def auth
    env['omniauth.auth']
  end

  def uid
    auth.uid
  end

  def auth_token
    auth.credentials.token
  end
end
