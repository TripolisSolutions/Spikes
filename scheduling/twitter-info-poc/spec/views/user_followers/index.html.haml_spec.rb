require 'spec_helper'

describe "user_followers/index" do
  before(:each) do
    assign(:user_followers, [
      stub_model(UserFollower,
        :user_id => 1,
        :screen_name => "Screen Name",
        :last_loaded => 2,
        :status => "Status"
      ),
      stub_model(UserFollower,
        :user_id => 1,
        :screen_name => "Screen Name",
        :last_loaded => 2,
        :status => "Status"
      )
    ])
  end

  it "renders a list of user_followers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Screen Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
