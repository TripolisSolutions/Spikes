class Image

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :url, :width, :height

  def initialize(url, height = 0, width  = 0)
    @url = url
    @height = height
    @width = width
  end
end