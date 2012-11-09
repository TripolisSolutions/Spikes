class AuthenticationController < ApplicationController

  def login
    @user = User.find_by_username(params[:username])
    @oauth2 = Songkick::OAuth2::Provider.parse(@user, env)

    if !@user.nil?
      session[:user_id] = @user.id
      render :template => "/authentication/authorize.html.erb", :status => 200
    end

  end


  ##
  # Gets the user data for the token
  ##
  def user
    authorization = Songkick::OAuth2::Provider.access_token(nil, [], env)
    response.headers = authorization.response_headers
    response.status = authorization.response_status

    if authorization.valid?
      user = authorization.owner
      hash = {
          :provider => 'tripolis',
          :id => user.id.to_s,
          :info => {
              :email      => user.username,
              :name       => user.username,
              :customdb   => "Y"
          }
      }

      render :json => hash.to_json

    else
      redirect_to :error
    end

  end

  def authorize
    @user = User.find_by_id(session[:user_id])
    @oauth2 = Songkick::OAuth2::Provider.parse(@user, env)
    if @oauth2.redirect?
      redirect_to @oauth2.redirect_uri, @oauth2.response_status
    end

    response.headers = @oauth2.response_headers
    response.status = @oauth2.response_status

    if response.body = @oauth2.response_body
      render :text => response.body, :status => @oauth2.response_status
    elsif @oauth2.valid?
      render :template => "/authentication/login.erb", :status => 200
    else
      render :template => "/errors/unknown.html.erb", :status => 500
    end
  end

  def allow
    @user = User.find_by_id(params[:user_id])
    @auth = Songkick::OAuth2::Provider::Authorization.new(@user, params)
    if params['allow'] == '1'
      @auth.grant_access!
    else
      @auth.deny_access!
    end
    #@auth.grant_access! #hardcoded approval its our app :)
    redirect_to @auth.redirect_uri
  end

  def error
    render :template => "/errors/unknown.html.erb", :status => 500
  end

end