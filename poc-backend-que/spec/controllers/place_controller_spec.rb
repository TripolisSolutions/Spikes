require 'spec_helper'

describe PlacesController do
  before :each do
    @user = stub(:user, id: 1)
    controller.stub(:current_user).and_return(@user)
  end
  
  describe "GET 'create'" do
    it "returns http success" do
      twitter_mock = stub("twitter", trend_locations: [])
      @user.stub(:twitter).and_return(twitter_mock)
      put 'create'
      response.should redirect_to(root_url)
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      delete :destroy, id: 123
      response.should redirect_to(root_url)
    end
  end

end
