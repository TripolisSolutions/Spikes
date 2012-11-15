class PageInfo

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_reader :url, :title, :description, :images
  attr_writer :title, :description, :images

  def initialize(url)
    @url = url
    @images = Array.new
  end

  def persisted?
    false
  end

end