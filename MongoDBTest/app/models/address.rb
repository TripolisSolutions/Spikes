class Address
  include Mongoid::Document

  belongs_to :contact

  field :street_name, type: String
  field :house_number , type: Integer
  field :house_name , type: String
  field :zip_code, type: String
  field :city, type: String
  field :province, type: String
  field :country, type: String

end