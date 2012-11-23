require 'spec_helper'

describe "users/edit" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :client_id => 1,
      :username => "MyString",
      :password => "MyString",
      :remember_token => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    rendered.should have_selector("form", :action => user_path(@user), :method => "post") do |form|
      form.should have_selector("select#user_client_id", :name => "user[client_id]")
      form.should have_selector("input#user_username", :name => "user[username]")
      form.should have_selector("input#user_password", :name => "user[password]")
    end
  end
end
