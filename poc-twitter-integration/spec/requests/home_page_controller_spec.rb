require 'spec_helper'

describe HomePageController do

  subject { page }

  describe "on index page" do

    before { visit root_path }

    describe "a not signed-in user" do
      it {  should have_link("Sign in") }
    end

    describe "a signed-in user" do

      before do
        mock_twitter_auth
        click_link("Sign in")
      end

      it {should have_link("Sign out")}

    end

  end

end
