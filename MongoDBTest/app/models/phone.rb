class Phone
  include Mongoid::Document

  PHONE_TYPE = ['Mobile','Home','Business','Fax']

  belongs_to :contact

  field :number, type: String
  field :phone_type , type: String


end