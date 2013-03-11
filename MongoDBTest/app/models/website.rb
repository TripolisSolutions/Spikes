class Website
  include Mongoid::Document

  belongs_to :contact

  field :url, type: String

end