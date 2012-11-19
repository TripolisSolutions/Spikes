class HomeController < ApplicationController
  before_filter :login_required

  def index
    @posts = Post.find(:all)
  end
end
