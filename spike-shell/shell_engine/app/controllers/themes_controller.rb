class ThemesController < ApplicationController

  def create
    switch_theme_to params[:theme][:name]
    redirect_to root_url
  end

end