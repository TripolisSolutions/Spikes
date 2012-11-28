require 'spec_helper'

describe "facebook_posts/new" do
  before(:each) do
    assign(:facebook_post, FactoryGirl.build(:facebook_post))
  end

  it "renders new facebook_post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => facebook_posts_path, :method => "post" do
      assert_select "input#facebook_post_account_id", :name => "facebook_post[account_id]"
      assert_select "input#facebook_post_message", :name => "facebook_post[message]"
    end
  end
end
