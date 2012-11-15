class Image

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :url, :width, :height

  def initialize(url, height = 0, width  = 0)
    @url = url
    @height = height.to_int
    @width = width.to_int
  end

  def width=(width)
    @width = width.to_int
  end

  def height=(height)
    @height = height.to_int
  end
end