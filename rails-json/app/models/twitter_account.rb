require 'active_resource'
require "json"
##
# Twitter account class
##
class TwitterAccount < ActiveResource::Base
  self.site = "http://localhost.com:4568/"
  schema do
         attribute 'username', :string
         attribute 'full_name', :string
         attribute 'status', :string
         attribute 'token', :string
         attribute 'enabled', :boolean
  end
  #include DataMapper::Resource
  #attr_accessor :username, :full_name,:token,:status,:enabled


  #
  #property :id, Serial
  #property :username ,String
  #property :full_name ,String
  #property :enabled, Boolean  ,:default  => false
  #property :status, String
  #property :modified_date, DateTime
  #property :token,String
  #
  ##parse json string into object
  #def self.from_json (string)
  #  ta = TwitterAccount.new
  #  JSON.load(string).each do |var, val|
  #    ta.instance_variable_set '@'+var, val
  #  end
  #  ta
  #end
  #
  def to_s
    "Id #{id}, username : #{username}, full name : #{full_name}"
  end
end