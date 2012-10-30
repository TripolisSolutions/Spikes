require 'active_record'
require "json"
require "active_model/serializers/json"
##
# Twitter account class
##
class TwitterAccount < ActiveRecord::Base
  include ActiveModel::Serialization
  include ActiveModel::Serializers::JSON

  def to_s
    "Id #{@id}, username : #{@username}, full name : #{@full_name}"
  end
end
