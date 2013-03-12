class Contact
  include Mongoid::Document
  field :first_name , type: String
  field :middle_name, type: String
  field :last_name, type: String
  field :suffix, type: String
  field :gender, type: String
  field :date_of_birth, type: Date
  embeds_many :email_addresses
  embeds_many :phones
  embeds_many :addresses
  embeds_many :websites
  embeds_many :channels
end
