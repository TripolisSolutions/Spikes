require 'test_helper'
require 'oauth2'
require 'test/unit'
require_relative '../../app/models/user'

class AuthorizationControllerTest < ActionController::TestCase

  def setup
    @client = Client.new
    @client.name = "MyClient"
    @client.redirect_uri = "http://www.example.com"
    @client.save

    @user = User.new(:username => 'foo@bar.com', :password => 'top-secret')
    @user.save
  end

  def test_authorize
    session[:user_id] = @user.id
    post :authorize, :redirect_uri => 'http://example.com/cb', :client_id => @client.client_id

    assert_redirected_to 'http://example.com/cb?error=invalid-request'
  end

end