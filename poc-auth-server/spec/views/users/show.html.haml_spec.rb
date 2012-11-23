require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :client_id => 1,
      :username => "Username",
      :password => "Password",
      :remember_token => "Remember Token"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Username".to_s)
    rendered.should contain("Password".to_s)
  end
end
