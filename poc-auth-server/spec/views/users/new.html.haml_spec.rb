require 'spec_helper'

describe "users/new" do
  before(:each) do
    assign(:user, stub_model(User,
      :client_id => 1,
      :username => "MyString",
      :password => "MyString",
      :remember_token => "MyString"
    ).as_new_record)
  end

  it "renders new user form" do
    render

    rendered.should have_selector("form", :action => users_path, :method => "post") do |form|
      form.should have_selector("select#user_client_id", :name => "user[client_id]")
      form.should have_selector("input#user_username", :name => "user[username]")
      form.should have_selector("input#user_password", :name => "user[password]")
    end
  end
end
