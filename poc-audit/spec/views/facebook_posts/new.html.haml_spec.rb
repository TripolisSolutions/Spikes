require 'spec_helper'

describe "facebook_posts/new" do
  before(:each) do
    assign(:facebook_post, stub_model(FacebookPost,
      :account_id => 1,
      :status => "MyString",
      :type => "",
      :post => "MyText"
    ).as_new_record)
  end

  it "renders new facebook_post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => facebook_posts_path, :method => "post" do
      assert_select "input#facebook_post_account_id", :name => "facebook_post[account_id]"
      assert_select "input#facebook_post_status", :name => "facebook_post[status]"
      assert_select "input#facebook_post_type", :name => "facebook_post[type]"
      assert_select "textarea#facebook_post_post", :name => "facebook_post[post]"
    end
  end
end
