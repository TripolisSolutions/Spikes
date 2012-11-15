class PageInfosController < ApplicationController

  def create
    @page_info = PageInfoParser.new(params[:page_info][:url]).page_info
    respond_to do |format|
      format.html { redirect_to root_url }
      format.js
    end
  end

end
