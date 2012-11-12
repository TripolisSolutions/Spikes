class SessionsController < ApplicationController
  def new
  end

  def create
    auth_hash = request.env['omniauth.auth']
    if session[:user_id]
      # Means our user is signed in. Add the authorization to the user
      User.find(session[:user_id]).add_provider(auth_hash)
      render :text => "You can now login using #{auth_hash["provider"].capitalize} too!"
    else
      # Log him in or sign him up
      auth = Authorization.find_or_create(auth_hash)
      # Create the session
      session[:user_id] = auth.uid  #TODO why doesnt the user get fetched when getting the autorization
      session[:token] = auth_hash.credentials.token
      session[:customdb] = auth_hash.info.customdb
      session[:username] = auth_hash.info.name
      #Do it ugly the
      #user = User.find(auth.user_id)

      render :text => "Welcome #{session[:username]}!"
    end
  end

  def destroy
    session[:user_id] = nil
    render :text => "You've logged out!"
  end

  def failure
    render :text => "Sorry, but you didn't allow access to our app!"
  end
end
