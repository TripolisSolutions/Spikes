class User < Struct.new(:name, :id)
  def self.from_omniauth(auth)
    p auth.info["name"]
    p auth
    auth.info["name"]
  end
end
