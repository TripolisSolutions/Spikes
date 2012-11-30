require 'spec_helper'

describe "facebook_posts/index" do
  before(:each) do
    assign(:facebook_posts, FactoryGirl.create_list(:facebook_post,  2))
  end

  it "renders a list of facebook_posts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    #assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Label".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "MyStatus".to_s, :count => 2
  end
end
