require 'net/http'

class ApplicationController < ActionController::Base
  protect_from_forgery

  #for each request verify token from header
  def verify
    user_id = request.headers['HTTP_X_TRP_USER']
    custom_db = request.headers['X-CUSTOM-DB']
    puts "USER ID: #{user_id}"

    if custom_db
      url = URI.parse("http://localhost:3000/users/#{user_id}.json")
      req = Net::HTTP::Get.new(url.path)
      res = Net::HTTP.start(url.host, url.port) {|http|
        http.request(req)
      }
      @output = JSON(res.body)
      puts @output
      @database = ""
    end
  end
end
