require 'rubygems'
require 'cloudfiles'

class ImageLibraryController < ApplicationController
  def list

# Log into the Cloud Files system
    cf = CloudFiles::Connection.new(:username => "yhvirtualxx1", :api_key => "9909bf863a8b083ce6e1e06297228c4b")


# Access a specific container
    container = cf.container('images')

    @imageNames = container.objects

  end



  def show_image
    cf = CloudFiles::Connection.new(:username => "yhvirtualxx1", :api_key => "9909bf863a8b083ce6e1e06297228c4b")
    container = cf.container('images')
    send_data container.object(params[:imageName]).data, :type => 'image/png',:disposition => 'inline'
  end

end