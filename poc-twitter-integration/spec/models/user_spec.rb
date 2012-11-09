require 'spec_helper'

describe User do

  before do
    mock_twitter_auth
    @user = User.from_omniauth(OmniAuth.mock_auth_for(:twitter))
  end

  subject{ @user }

  it {should respond_to(:name)}
  it {should respond_to(:realName)}
  it {should respond_to(:uid)} # the unique user id on the social network, not to confuse with user.id
  it {should respond_to(:avatarUrl)}
  it {should respond_to(:location)}
  it {should respond_to(:description)}

  it "should use name as realname" do
    @user.realName.should == "Tripolis Solutions"
  end

  it "should use nickname as name" do
    @user.name.should == "tripolis"
  end

end
