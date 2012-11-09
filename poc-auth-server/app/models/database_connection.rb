##
# Class representing a database connection obtained from the Authentication server
##
class DatabaseConnection < ActiveRecord::Base

  attr_reader :url , :username , :password

  belongs_to :user

  def initialize (url,username,password)
    @url = url
    @username = username
    @password = password
  end

  def get_database_connection_string
    "#{username}:#{password}@#{url}"
  end

end