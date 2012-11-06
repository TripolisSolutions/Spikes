require 'rubygems'
require 'cloudfiles'

class ImageLibraryController < ApplicationController
  def list

# Log into the Cloud Files system
    cf = CloudFiles::Connection.new(:username => "yhvirtualxx1", :api_key => "9909bf863a8b083ce6e1e06297228c4b")


# Access a specific container
    container = cf.container('images')

    @images = container.objects


  end
end
