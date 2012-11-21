require 'spec_helper'

describe "user_followers/show" do
  before(:each) do
    @user_follower = assign(:user_follower, stub_model(UserFollower,
      :user_id => 1,
      :screen_name => "Screen Name",
      :last_loaded => 2,
      :status => "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Screen Name/)
    rendered.should match(/2/)
    rendered.should match(/Status/)
  end
end
