class EmailAddress
  include Mongoid::Document

  belongs_to :contact

  field :email, type: String
  field :active, type: Boolean

end