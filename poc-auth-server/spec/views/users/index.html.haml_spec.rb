require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :client_id => 1,
        :username => "Username",
        :password => "Password",
        :remember_token => "Remember Token"
      ),
      stub_model(User,
        :client_id => 1,
        :username => "Username",
        :password => "Password",
        :remember_token => "Remember Token"
      )
    ])
  end

  it "renders a list of users" do
    render
    rendered.should have_selector("tr>td", :content => "Username".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Password".to_s, :count => 2)
  end
end
