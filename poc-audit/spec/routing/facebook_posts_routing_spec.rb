require "spec_helper"

describe FacebookPostsController do
  describe "routing" do

    it "routes to #index" do
      get("/facebook_posts").should route_to("facebook_posts#index")
    end

    it "routes to #new" do
      get("/facebook_posts/new").should route_to("facebook_posts#new")
    end

    it "routes to #show" do
      get("/facebook_posts/1").should route_to("facebook_posts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/facebook_posts/1/edit").should route_to("facebook_posts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/facebook_posts").should route_to("facebook_posts#create")
    end

    it "routes to #update" do
      put("/facebook_posts/1").should route_to("facebook_posts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/facebook_posts/1").should route_to("facebook_posts#destroy", :id => "1")
    end

  end
end
