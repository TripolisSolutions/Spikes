require 'spec_helper'

describe HomePageController do

  subject { page }

  describe "on index page" do

    before { visit root_path }

    describe "a not signed-in user" do
      it {  should have_link("Sign in") }
      it { should have_selector('h1', text: 'Please sign in first') }
    end

    describe "a signed-in user" do

      before :each do
        mock_twitter_auth
        User.any_instance.stub(:timeline) { Array.new }
        click_link("Sign in")
      end

      after :each do
        click_link("Sign out")
      end

      it { should have_link("Sign out") }

      describe "Twitter profile" do
        it { should have_selector('h2', text: 'Tripolis Solutions') }
        it { should have_selector('h3', text: 'tripolis') }
      end

      describe "Tweet creation" do

        before :each do
          get '/'
        end

        it { should have_field("tweet_status") }
        it { should have_button("Tweet") }

        describe "post a tweet", js: true do

          before :each do
            fill_in "tweet_status", with: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit"
            Twitter::Client.any_instance.should_receive(:update) { Twitter::Tweet.new(id: "12345") }
            click_button "Tweet"
          end

          it "should save the tweet locally and have the tweet id from Twitter" do
            Tweet.find_by_status_id("12345").should_not be_nil
          end

          it { should have_notice_message }

          after :each do
            Tweet.delete_all
          end
        end

        describe "Twitter API error", js: true do

          before :each do
            Twitter::Client.any_instance.should_receive(:update) { raise Twitter::Error::AlreadyRetweeted }
            click_button "Tweet"
          end

          it { should have_error_message }
        end

      end

    end

  end

end
