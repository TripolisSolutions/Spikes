require 'spec_helper'

describe "facebook_posts/show" do
  before(:each) do
    @facebook_post = assign(:facebook_post, stub_model(FacebookPost,
      :account_id => 1,
      :status => "Status",
      :type => "Type",
      :post => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Status/)
    rendered.should match(/Type/)
    rendered.should match(/MyText/)
  end
end
