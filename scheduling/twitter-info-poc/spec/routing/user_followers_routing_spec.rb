require "spec_helper"

describe UserFollowersController do
  describe "routing" do

    it "routes to #index" do
      get("/user_followers").should route_to("user_followers#index")
    end

    it "routes to #new" do
      get("/user_followers/new").should route_to("user_followers#new")
    end

    it "routes to #show" do
      get("/user_followers/1").should route_to("user_followers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/user_followers/1/edit").should route_to("user_followers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/user_followers").should route_to("user_followers#create")
    end

    it "routes to #update" do
      put("/user_followers/1").should route_to("user_followers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/user_followers/1").should route_to("user_followers#destroy", :id => "1")
    end

  end
end
