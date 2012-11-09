require 'spec_helper'

describe UsersHelper do

  before do
    mock_twitter_auth
    @user = User.from_omniauth(OmniAuth.mock_auth_for(:twitter))
  end

  it "should return twitter avatar url" do
    avatar_for(@user).should =~ /src="https:\/\/avatar.com"/
  end

  it "should return avatar of the specified size" do
    avatar_for(@user, size: 40).should =~ /height="40"/
  end

  it "should return twitter profile url" do
    profile_link_for(@user,"Click me").should =~ /href="http:\/\/twitter.com\/tripolis"/
  end

  it "should return twitter profile url with specified css class" do
    profile_link_for(@user,"Click me", class:"mystyle").should =~ /class="mystyle"/
  end

end