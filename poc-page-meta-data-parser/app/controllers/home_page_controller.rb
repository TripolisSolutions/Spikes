class HomePageController < ApplicationController
  def index
    @page_info = PageInfo.new("")
  end
end
