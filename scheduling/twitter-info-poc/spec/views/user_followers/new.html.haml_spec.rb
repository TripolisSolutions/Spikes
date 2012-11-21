require 'spec_helper'

describe "user_followers/new" do
  before(:each) do
    assign(:user_follower, stub_model(UserFollower,
      :user_id => 1,
      :screen_name => "MyString",
      :last_loaded => 1,
      :status => "MyString"
    ).as_new_record)
  end

  it "renders new user_follower form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => user_followers_path, :method => "post" do
      assert_select "input#user_follower_user_id", :name => "user_follower[user_id]"
      assert_select "input#user_follower_screen_name", :name => "user_follower[screen_name]"
      assert_select "input#user_follower_last_loaded", :name => "user_follower[last_loaded]"
      assert_select "input#user_follower_status", :name => "user_follower[status]"
    end
  end
end
