##
# Class representing a database connection obtained from the Authentication server
##
class DatabaseConnection

  attr_reader :url , :username , :password

  def initialize (url,username,password)
    @url = url
    @username = username
    @password = password
  end

end