class HomeController < ApplicationController
  before_filter :login_required

  def index
    benchmark "Fetching posts" do
      @posts = Post.all
    end
  end
end
