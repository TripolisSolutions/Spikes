class Tennant
  include Mongoid::Document

  has_many :contacts

  field :name, type: String

end